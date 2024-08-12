// import 'package:flutter/material.dart';
// import 'package:pro_web_toon/pages/details/details_page.dart';
// import 'package:pro_web_toon/pages/originals/originals_page.dart';
// import 'package:pro_web_toon/utils/router/route_transition.dart';
// import 'package:pro_web_toon/utils/router/routes.dart';

// class RouteGenerator {
//   const RouteGenerator._();

//   static Route onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.ORIGINALS:
//         return RouteTransition.customTransitionBuilder(
//           child: const OriginalsPage(),
//         );
//       case Routes.DETAILS:
//         return RouteTransition.customTransitionBuilder(
//           child: const DetailsPage(),
//           arguments: settings.arguments,
//         );
//       default:
//         return RouteTransition.customTransitionBuilder(
//           child: const OriginalsPage(),
//         );
//     }
//   }
// }
