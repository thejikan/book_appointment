import 'package:book_appointment/feature/model/doctorDetailsConfig.dart';
import 'package:book_appointment/feature/presentation/bookAppointment/bloc/bookAppointment_cubit.dart';
import 'package:book_appointment/feature/service/detailsService.dart';
import 'package:book_appointment/router/appRoutesEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({Key? key, required this.doctor}) : super(key: key);

  final DoctorDetailsConfig doctor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookAppointmentCubit>(
      create: (context) => BookAppointmentCubit(context.read<DetailsService>(), doctor),
      child: _BookAppointmentView(),
    );
  }
}

class _BookAppointmentView extends StatelessWidget {
  _BookAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookAppointmentCubit, BookAppointmentState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: InkWell(
              onTap: () {
                context.go(AppRoutes.product.routePath);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      shape: BoxShape.circle),
                  child: Icon(Icons.arrow_back_outlined, color: Colors.black),
                ),
              ),
            ),
            title: const Center(
                child: Text(
              'Book Appointment',
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
              Expanded(
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    /// profile
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(36),
                                // Image radius
                                child: Image.network(
                                    state.image,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.doctorName,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                      state.speciality,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.indigo,
                                      ),
                                      Text(
                                        state.location,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),
                                      Icon(
                                        Icons.map,
                                        color: Colors.indigo,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(),
                      ),
                    ),

                    /// review
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 36,
                                  child: Icon(
                                    Icons.people_rounded,
                                    color: Colors.indigo,
                                    size: 40,
                                  ),
                                  backgroundColor: Colors.blue[100],
                                ),
                                Text(
                                  '${state.patientServed.toString()}+',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.indigo),
                                ),
                                Text(
                                  'Patients',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 36,
                                  child: Icon(
                                    Icons.work_rounded,
                                    color: Colors.indigo,
                                    size: 40,
                                  ),
                                  backgroundColor: Colors.blue[100],
                                ),
                                Text(
                                  '${state.yearsOfExperience.toString()}+',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.indigo),
                                ),
                                Text(
                                  'Years Exp.',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 36,
                                  child: Icon(
                                    Icons.star_half_rounded,
                                    color: Colors.indigo,
                                    size: 40,
                                  ),
                                  backgroundColor: Colors.blue[100],
                                ),
                                Text(
                                  '${state.rating.toString()}+',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.indigo),
                                ),
                                Text(
                                  'Rating',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 36,
                                  child: Icon(
                                    Icons.textsms,
                                    color: Colors.indigo,
                                    size: 40,
                                  ),
                                  backgroundColor: Colors.blue[100],
                                ),
                                Text(
                                  state.numberOfReviews.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.indigo),
                                ),
                                Text(
                                  'Review',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// book appointment
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          'Book Appointment',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ),
                    ),

                    /// Day
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 16),
                        child: Text(
                          'Day',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          height: 80.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.availability.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Card(
                                    color: Colors.indigo[600],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(36.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 36, vertical: 8),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8, top: 4),
                                            child: Text(
                                              'Today',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          Text(
                                            '4 Oct',
                                            style: TextStyle(
                                                color: Colors.grey[300],
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    /// Time
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 16),
                        child: Text(
                          'Time',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          height: 50.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Card(
                                    color: Colors.indigo[600],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 12),
                                      child: Text(
                                        '7:00 PM',
                                        style: TextStyle(
                                            color: Colors.grey[300],
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 70.0,
                    )),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.selectPackage.routePath);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[700],
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Make Appointment',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
