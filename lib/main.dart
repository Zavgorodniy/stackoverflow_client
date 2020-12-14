import 'package:flutter/material.dart';
import 'package:stackoverflow_client/managers/locator.dart';
import 'package:stackoverflow_client/utils/routes.dart';
import 'package:stackoverflow_client/utils/srings.dart';
import 'package:stackoverflow_client/view/home/home.dart';
import 'package:stackoverflow_client/view/questions/question_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupProjectDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: getRoute,
      home: Home(),
    );
  }
}

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.questions:
      return buildRoute(settings, QuestionList(settings.arguments));
    default:
      return null;
  }
}

MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) =>
    MaterialPageRoute(
      settings: settings,
      builder: (context) => builder,
    );