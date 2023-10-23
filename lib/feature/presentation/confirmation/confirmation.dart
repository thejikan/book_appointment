import 'package:book_appointment/feature/presentation/confirmation/bloc/confirmation_cubit.dart';
import 'package:book_appointment/feature/service/detailsService.dart';
import 'package:book_appointment/router/appRoutesEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ConfirmationView extends StatelessWidget {
  const ConfirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConfirmationCubit>(
      create: (context) => ConfirmationCubit(context.read<DetailsService>()),
      child: _ConfirmationView(),
    );
  }
}

class _ConfirmationView extends StatelessWidget {
  _ConfirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmationCubit, ConfirmationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: InkWell(
              onTap: () {
                context.go(AppRoutes.myBooking.routePath);
              },
              child: Container(
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.circle),
                child:
                    const Icon(Icons.arrow_back_outlined, color: Colors.black),
              ),
            ),
            title: const Center(
                child: Text(
              'Confirmation',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            )),
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Expanded(
                  child: CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      /// profile
                      SliverToBoxAdapter(
                        child: Container(
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.indigo[700],
                            size: 100,
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            const Text('Appointment confirmed!',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                )),
                            const Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                  'You have successfully booked appointment with',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)),
                            ),
                            Text(state.doctorName,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),

                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.indigo[600],
                                size: 32,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text('Esther Howard',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.date_range_sharp,
                                    color: Colors.indigo[600],
                                    size: 32,
                                  ),
                                  Text(state.appointmentDate,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.timer_rounded,
                                    color: Colors.indigo[600],
                                    size: 32,
                                  ),
                                  Text(state.appointmentTime,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// button
                      SliverPadding(
                        padding: const EdgeInsets.only(top: 46),
                        sliver: SliverToBoxAdapter(
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context.go(AppRoutes.myBooking.routePath);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50),
                                  backgroundColor: Colors.indigo[700],
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    'View Appointments',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: InkWell(
                                  onTap: () {
                                    context.go(AppRoutes.home.routePath);
                                  },
                                  child: Text(
                                    'Book Another',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.indigo[700],
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // SliverPadding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   sliver: SliverToBoxAdapter(
                      //     child: Center(
                      //       child: Padding(
                      //         padding: const EdgeInsets.symmetric(vertical: 12),
                      //         child: InkWell(
                      //           onTap: (){},
                      //           child: Text(
                      //             'Book Another',
                      //             style: TextStyle(
                      //                 fontSize: 20, color: Colors.indigo[700], fontWeight: FontWeight.w500),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // bottomNavigationBar: Column(
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {},
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: Colors.indigo[700],
          //         padding:
          //         const EdgeInsets.symmetric(horizontal: 8.0),
          //         shape: const RoundedRectangleBorder(
          //           borderRadius:
          //           BorderRadius.all(Radius.circular(18)),
          //         ),
          //       ),
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(vertical: 12),
          //         child: Text(
          //           'View Appointments',
          //           style: TextStyle(
          //               fontSize: 20, color: Colors.white),
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.symmetric(vertical: 12),
          //       child: InkWell(
          //         onTap: (){},
          //         child: Text(
          //           'Book Another',
          //           style: TextStyle(
          //               fontSize: 20, color: Colors.indigo[700]),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        );
      },
    );
  }
}
