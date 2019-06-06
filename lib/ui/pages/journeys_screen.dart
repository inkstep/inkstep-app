import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inkstep/blocs/journeys_bloc.dart';
import 'package:inkstep/blocs/journeys_event.dart';
import 'package:inkstep/blocs/journeys_state.dart';
import 'package:inkstep/ui/components/feature_discovery.dart';
import 'package:inkstep/ui/components/journey_cards.dart';
import 'package:inkstep/ui/pages/onboarding/welcome_back_header.dart';

class JourneysScreen extends StatefulWidget {
  const JourneysScreen({Key key, this.onInit}) : super(key: key);

  @override
  _JourneysScreenState createState() => _JourneysScreenState();

  final void Function() onInit;
}

class _JourneysScreenState extends State<JourneysScreen> with SingleTickerProviderStateMixin {
  int _currentPageIndex = 0;

  AnimationController _controller;
  Animation<double> _animation;
  PageController _pageController;

  @override
  void initState() {
    widget.onInit();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final JourneysBloc journeyBloc = BlocProvider.of<JourneysBloc>(context);
    return FeatureDiscovery(
      child: BlocBuilder<JourneysEvent, JourneysState>(
        bloc: journeyBloc,
        builder: (BuildContext context, JourneysState state) {
          if (state is JourneyError) {
            print('JourneyError');
            Navigator.pop(context);
          }

          if (state is JourneysNoUser) {
            return Container(
              decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            );
          } else if (state is JourneysWithUser) {
            final JourneysWithUser loadedState = state;
            _controller.forward();
            _animation.addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                if (loadedState.firstTime == true) {
                  FeatureDiscovery.discoverFeatures(context, ['aftercare_button_0']);
                  journeyBloc.dispatch(ShownFeatureDiscovery());
                }
              }
            });
            final void Function(ScrollNotification) onNotification = (notification) {
              if (notification is ScrollEndNotification) {
                final currentPage = _pageController.page.round().toInt();
                if (_currentPageIndex != currentPage) {
                  setState(() => _currentPageIndex = currentPage);
                }
              }
            };
            return LoadedJourneyScreen(
              animation: _animation,
              loadedState: loadedState,
              onNotification: onNotification,
              pageController: _pageController,
            );
          } else {
            print(state);
            return Container(
              child: Center(child: Text('Abort Mission')),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class LoadedJourneyScreen extends StatelessWidget {
  const LoadedJourneyScreen({
    Key key,
    @required Animation<double> animation,
    @required this.loadedState,
    @required this.onNotification,
    @required PageController pageController,
  })  : _animation = animation,
        _pageController = pageController,
        super(key: key);

  final Animation<double> _animation;
  final JourneysWithUser loadedState;
  final void Function(ScrollNotification) onNotification;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: FadeTransition(
        opacity: _animation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            WelcomeBackHeader(
              // TODO(DJRHails): Use a user bloc
              name: loadedState.cards.isEmpty ? '' : loadedState.user.name,
              tasksToComplete: 0,
            ),
            Expanded(
              flex: 1,
              child: NotificationListener<ScrollNotification>(
                onNotification: onNotification,
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == loadedState.cards.length) {
                      return AddCard();
                    } else {
                      return JourneyCard(model: loadedState.cards[index]);
                    }
                  },
                  itemCount: loadedState.cards.length + 1,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 32.0),
            ),
          ],
        ),
      ),
    );
  }
}
