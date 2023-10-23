import 'package:book_appointment/feature/model/doctorDetailsConfig.dart';
import 'package:book_appointment/feature/presentation/bookAppointment/bookAppointment.dart';
import 'package:book_appointment/feature/presentation/confirmation/confirmation.dart';
import 'package:book_appointment/feature/presentation/home/home.dart';
import 'package:book_appointment/feature/presentation/myBooking/myBooking.dart';
import 'package:book_appointment/feature/presentation/review/review.dart';
import 'package:book_appointment/feature/presentation/selectPackage/selectPackage.dart';
import 'package:book_appointment/feature/service/serviceLocator.dart';
import 'package:book_appointment/main.dart';
import 'package:book_appointment/router/appRoutesEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'appRoutes.dart';

typedef PopViewCallback = void Function(bool result);

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(title: 'Flutter Demo Home Page');
      },
      redirect: (BuildContext context, GoRouterState state) async {
        return AppRoutes.selectPackage.routePath;
        return AppRoutes.myBooking.routePath;
        // return AppRoutes.details.routePath;
        // return AppRoutes.product.routePath;
      },
    ),
    _homeRoutes(),
  ],
);
