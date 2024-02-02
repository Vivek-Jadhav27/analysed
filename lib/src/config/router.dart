import 'package:flutter/material.dart';
import 'package:kioski/src/data/models/app_route.dart';
import 'package:kioski/src/presentation/error/error_page.dart';
import 'package:kioski/src/presentation/home/home_page.dart';
import 'package:kioski/src/presentation/home/productlist.dart';
import 'package:kioski/src/utils/constants/routes.dart';

class AppRouter {
  static List<AppRoute> routes() => [
        AppRoute(route: Routes.home, view: HomePage()),
        AppRoute(route: Routes.productlist, view: ProductListPage())
      ];

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    var result = routes().where(
      (element) => element.route == settings.name,
    );
    if (result.isNotEmpty) {
      return MaterialPageRoute(builder: (context) => result.first.view);
    }
    return MaterialPageRoute(builder: (context) => ErrorPage());
  }
}
