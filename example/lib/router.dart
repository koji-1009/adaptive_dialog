import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import 'pages/alert_page.dart';
import 'pages/sheet_page.dart';

class Router {
  final Map<String, WidgetBuilder> pushRoutes = {
    AlertPage.routeName: (context) => const AlertPage(),
    SheetPage.routeName: (context) => const SheetPage(),
  };

  Route onGenerateRoute(RouteSettings settings) {
    final name = settings.name;
    final uri = Uri(path: name);
    final segments = uri.pathSegments;
    final path = '/${segments.first}';
    final pushPage = pushRoutes[path];
    if (pushPage != null) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: pushPage,
      );
    }
    return null;
  }
}

String pascalCaseFromRouteName(String name) => name.substring(1).pascalCase;

@immutable
class PageInfo {
  const PageInfo({
    @required this.routeName,
  });

  final String routeName;

  static List<PageInfo> get all => [
        AlertPage.routeName,
        SheetPage.routeName,
      ].map((rn) => PageInfo(routeName: rn)).toList();
}