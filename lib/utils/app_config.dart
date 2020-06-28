import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({
    @required this.appName,
    @required this.flavourName,
    @required this.apiUrl,
    @required Widget child,
  }) : super(child: child);

  final String appName;
  final String flavourName;
  final String apiUrl;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
