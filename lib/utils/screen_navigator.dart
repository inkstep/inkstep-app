import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inkstep/blocs/journeys_bloc.dart';
import 'package:inkstep/blocs/journeys_event.dart';
import 'package:inkstep/models/card_model.dart';
import 'package:inkstep/ui/pages/artists_screen.dart';
import 'package:inkstep/ui/pages/care_screen.dart';
import 'package:inkstep/ui/pages/journeys_screen.dart';
import 'package:inkstep/ui/pages/new/login_screen.dart';
import 'package:inkstep/ui/pages/onboarding.dart';
import 'package:inkstep/ui/pages/onboarding_required_info.dart';
import 'package:inkstep/ui/pages/single_journey_screen.dart';
import 'package:inkstep/ui/pages/studios_screen.dart';
import 'package:inkstep/ui/routes/scale_page_route.dart';
import 'package:inkstep/utils/app_config.dart';

import 'info_navigator.dart';

class ScreenNavigator {
  void pop(BuildContext context) {
    Navigator.pop(context);
  }

  void openOnboardingPage(BuildContext context) {
    Navigator.pushReplacement<dynamic, dynamic>(context,
        MaterialPageRoute<dynamic>(builder: (context) => Onboarding()));
  }

  void openOnboardingRequiredInfoPage(BuildContext context) {
    Navigator.pushReplacement<dynamic, dynamic>(
        context,
        MaterialPageRoute<dynamic>(
            builder: (context) => OnboardingRequiredInfo(),
            fullscreenDialog: true));
  }

  void openViewJourneysScreen(BuildContext context) {
    Navigator.pushReplacement<dynamic, dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (context) => JourneysScreen(
          onInit: () {},
        ),
      ),
    );
  }

  void openLoginScreen(BuildContext context) {
    Navigator.pushReplacement<dynamic, dynamic>(
      context,
      MaterialPageRoute<dynamic>(builder: (context) => LoginScreen()),
    );
  }

  void openViewJourneysScreenWithNewDevice(BuildContext context, int userId) {
    Navigator.pushReplacement<dynamic, dynamic>(
      context,
      MaterialPageRoute<dynamic>(
          builder: (context) => JourneysScreen(
                onInit: () {
                  final JourneysBloc journeyBloc =
                      BlocProvider.of<JourneysBloc>(context);
                  journeyBloc.dispatch(LoadUser(userId));
                },
              )),
    );
  }

  Widget buildArtistsSelectionScreen(BuildContext context) {
    final config = AppConfig.of(context);
    return ArtistSelectionScreen(
      baseUrl: config.apiUrl,
    );
  }

  void openArtistSelectionReplace(BuildContext context) {
    Navigator.pushReplacement<dynamic, dynamic>(
      context,
      MaterialPageRoute<dynamic>(builder: buildArtistsSelectionScreen),
    );
  }

  void openArtistSelection(BuildContext context) {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(builder: buildArtistsSelectionScreen),
    );
  }

  void expandArtistSelection(BuildContext context, RelativeRect rect) {
    Navigator.push<dynamic>(
      context,
      ScaleRoute(
        rect: rect,
        child: buildArtistsSelectionScreen(context),
      ),
    );
  }

  void openStudioSelection(BuildContext context) {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(builder: (context) => StudioSelectionScreen()),
    );
  }

  void openNewJourneyScreen(BuildContext context, int artistID) {
    InfoNavigator(artistID, context).start(context);
  }

  void openCareScreen(BuildContext context, DateTime bookedTime) {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
          builder: (context) => CareScreen(
                bookedTime: bookedTime,
              ),
          fullscreenDialog: true),
    );
  }

  void openFullscreenJourney(BuildContext context, CardModel card) {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
          builder: (context) => SingleJourneyScreen(card: card),
          fullscreenDialog: true),
    );
  }
}
