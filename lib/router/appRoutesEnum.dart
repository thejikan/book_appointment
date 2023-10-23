import 'package:book_appointment/router/routesHelperClass.dart';

class AppRoutes {
  static const home = RoutesBase(
    name: "home",
    routePath: "/home",
    routeSubPath: "home",
  );
  static const bookAppointment = RoutesBase(
    name: "bookAppointment",
    routePath: "/home/bookAppointment",
    routeSubPath: "bookAppointment",
  );
  static const selectPackage = RoutesBase(
    name: "selectPackage",
    routePath: '/home/selectPackage',
    routeSubPath: "selectPackage",
  );
  static const review = RoutesBase(
    name: "review",
    routePath: "/home/review",
    routeSubPath: "review",
  );
  static const confirmation = RoutesBase(
    name: "confirmation",
    routePath: '/home/confirmation',
    routeSubPath: "confirmation",
  );
  static const myBooking = RoutesBase(
    name: "myBooking",
    routePath: "/home/myBooking",
    routeSubPath: "myBooking",
  );
  static const details = RoutesBase(
    name: "details",
    routePath: '/product/details',
    routeSubPath: "details",
  );
  static const product = RoutesBase(
    name: "product",
    routePath: '/product',
    routeSubPath: "product",
  );

}
