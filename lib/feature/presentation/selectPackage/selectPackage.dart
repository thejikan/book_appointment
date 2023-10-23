import 'package:book_appointment/feature/model/colorConfig.dart';
import 'package:book_appointment/feature/presentation/selectPackage/bloc/selectPackage_cubit.dart';
import 'package:book_appointment/feature/service/detailsService.dart';
import 'package:book_appointment/router/appRoutesEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

const List<String> list = <String>['30 min', '60 min'];

enum PackageEnum { message, voiceCall, videoCall, inPerson }

class SelectPackageView extends StatelessWidget {
  const SelectPackageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectPackageCubit>(
      create: (context) => SelectPackageCubit(context.read<DetailsService>()),
      child: _SelectPackageView(),
    );
  }
}

class _SelectPackageView extends StatelessWidget {
  _SelectPackageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectPackageCubit, SelectPackageState>(
      listener: (context, state) {},
      builder: (context, state) {
        PackageEnum? _character = PackageEnum.message;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: InkWell(
              onTap: () {
                // context.go(AppRoutes.bookAppointment.routePath);
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
              'Select Package',
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 16, top: 8),
                              child: Text(
                                'Select Duration',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                            DropdownMenu<String>(
                              leadingIcon: Icon(
                                Icons.access_time_filled_outlined,
                                color: Colors.indigo,
                              ),
                              trailingIcon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.indigo,
                                size: 36,
                              ),
                              initialSelection: (list).first,
                              width: 340,
                              onSelected: (String? value) {
                                // This is called when the user selects an item.
                                // setState(() {
                                //   dropdownValue = value!;
                                // });
                              },
                              dropdownMenuEntries: list
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                return DropdownMenuEntry<String>(
                                    value: value, label: value);
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Select Package
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                        child: Text(
                          'Select Package',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverGrid.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        crossAxisCount: 1,
                        childAspectRatio: 5,
                        children: List.generate(state.packages.length, (index) {
                          return InkWell(
                            onTap: () {
                              _character = radioValue(state.packages[index]);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        child: Icon(
                                          iconValue(state.packages[index]),
                                          color: Colors.indigo,
                                          size: 30,
                                        ),
                                        backgroundColor: Colors.blue[100],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              state.packages[index],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              '${state.packages[index]} with Doctor',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Radio<PackageEnum>(
                                    value: radioValue(state.packages[index]),
                                    groupValue: _character,
                                    onChanged: (PackageEnum? value) {
                                      // setState(() {
                                      //   _character = value;
                                      // });
                                    },
                                  ),
                                ],
                              ),
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
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
            child: ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.review.routePath);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[700],
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Next',
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

PackageEnum radioValue(String value) {
  switch (value) {
    case 'Messaging':
      return PackageEnum.message;
    case 'Voice Call':
      return PackageEnum.voiceCall;
    case 'Video Call':
      return PackageEnum.videoCall;
    case 'In Person':
      return PackageEnum.inPerson;
    default:
      return PackageEnum.message;
  }
}

IconData iconValue(String value) {
  switch (value) {
    case 'Messaging':
      return Icons.textsms;
    case 'Voice Call':
      return Icons.call;
    case 'Video Call':
      return Icons.video_camera_back_rounded;
    case 'In Person':
      return Icons.person;
    default:
      return Icons.textsms;
  }
}
