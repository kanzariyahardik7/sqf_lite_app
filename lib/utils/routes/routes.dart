import 'package:sqf_lite_app/universal_widget/mytext.dart';
import 'package:sqf_lite_app/utils/colors.dart';
import 'package:sqf_lite_app/utils/routes/routes_name.dart';
import 'package:sqf_lite_app/view/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const MyHomePage());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
                child: MyText(
              text: "No Routes defined",
              color: black0,
              fontsize: 25,
              fontweight: FontWeight.w700,
            )),
          );
        });
    }
  }
}
