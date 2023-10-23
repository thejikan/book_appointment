import 'package:book_appointment/feature/model/colorConfig.dart';
import 'package:book_appointment/feature/presentation/review/bloc/review_cubit.dart';
import 'package:book_appointment/feature/service/detailsService.dart';
import 'package:book_appointment/router/appRoutesEnum.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({Key? key}) : super(key: key);

  // final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReviewCubit>(
      create: (context) =>
          ReviewCubit(context.read<DetailsService>()),
      child: _ReviewView(),
    );
  }
}

class _ReviewView extends StatelessWidget {
  _ReviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewCubit, ReviewState>(
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
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey)),
                  child: Icon(Icons.arrow_back_outlined, color: Colors.black),
                ),
              ),
            ),
            title: const Center(
                child: Text(
                  'Review Summary',
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
                            CircleAvatar(
                              radius:48,
                              child: Icon(Icons.image, color: Colors.black),
                              backgroundColor: Colors.blueGrey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Dr. Jonny Wilson', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6),
                                    child: Text('Dentist', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on, color: Colors.indigo,),
                                      Text('New York, United States ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),),
                                      Icon(Icons.map, color: Colors.indigo,),
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
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Date & Hour', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('August 24, 2023 | 10:00 AM', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Package', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Messaging', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Duration', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('30 minutes', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Booking for', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Self', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
          /// button
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.confirmation.routePath);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[700],
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0),
                shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(18)),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Confirm',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
