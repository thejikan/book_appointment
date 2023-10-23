import 'package:book_appointment/feature/presentation/myBooking/bloc/myBooking_cubit.dart';
import 'package:book_appointment/feature/service/detailsService.dart';
import 'package:book_appointment/router/appRoutesEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyBookingView extends StatelessWidget {
  const MyBookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyBookingCubit>(
      create: (context) => MyBookingCubit(context.read<DetailsService>()),
      child: _MyBookingView(),
    );
  }
}

class _MyBookingView extends StatelessWidget {
  _MyBookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBookingCubit, MyBookingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: InkWell(
              onTap: () {
                context.go(AppRoutes.home.routePath);
              },
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.circle),
                child:
                    const Icon(Icons.arrow_back_outlined, color: Colors.black),
              ),
            ),
            title: const Center(
                child: Text(
              'My Booking',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            )),
            actions: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      shape: BoxShape.circle),
                  child: const Icon(Icons.search, color: Colors.black),
                ),
              ),
            ],
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverGrid.count(
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 20,
                        crossAxisCount: 1,
                        childAspectRatio: 1.37,
                        children:
                            List.generate(state.myBookings.length, (index) {
                          return Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    '${state.myBookings[index].appointmentDate} - ${state.myBookings[index].appointmentTime}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Image.network(state.myBookings[index].image),
                                    const Icon(
                                      Icons.image,
                                      color: Colors.black,
                                      size: 75,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.myBookings[index].doctorName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                    Icons.location_on_outlined),
                                                Text(
                                                  state.myBookings[index]
                                                      .location,
                                                  style: const TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                    Icons.location_on_outlined),
                                                const Text(
                                                  'Booking ID: ',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                Text(
                                                  state.myBookings[index]
                                                      .bookingId,
                                                  style: const TextStyle(
                                                      color: Colors.blue),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue[200],
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(28)),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 24),
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.indigo[700]),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.indigo[700],
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(28)),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 20),
                                          child: Text(
                                            'Reschedule',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
