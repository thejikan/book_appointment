part of 'router.dart';

GoRoute _homeRoutes() {
  return GoRoute(
    path: AppRoutes.home.routePath,
    builder: (context, state) {
      return RepositoryProvider.value(
        value: serviceLocator.getDetailsService(),
        child: HomeView(),
      );
    },
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.bookAppointment.routeSubPath,
        builder: (context, state) {
          DoctorDetailsConfig doctor = state.extra as DoctorDetailsConfig;
          return RepositoryProvider.value(
            value: serviceLocator.getDetailsService(),
            child: BookAppointmentView(doctor: doctor,),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.selectPackage.routeSubPath,
        builder: (context, state) {
          // int id = state.extra as int;
          return RepositoryProvider.value(
            value: serviceLocator.getDetailsService(),
            child: SelectPackageView(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.review.routeSubPath,
        builder: (context, state) {
          return RepositoryProvider.value(
            value: serviceLocator.getDetailsService(),
            child: ReviewView(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.confirmation.routeSubPath,
        builder: (context, state) {
          return RepositoryProvider.value(
            value: serviceLocator.getDetailsService(),
            child: ConfirmationView(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.myBooking.routeSubPath,
        builder: (context, state) {
          return RepositoryProvider.value(
            value: serviceLocator.getDetailsService(),
            child: MyBookingView(),
          );
        },
      ),
    ],

  );
}
