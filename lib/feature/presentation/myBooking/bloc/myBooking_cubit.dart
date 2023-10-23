import 'package:book_appointment/feature/model/myBookingConfig.dart';
import 'package:book_appointment/feature/service/detailsService.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'myBooking_state.dart';

class MyBookingCubit extends Cubit<MyBookingState> {
  final DetailsService _detailsService;

  MyBookingCubit(this._detailsService) : super(const MyBookingState()) {
    initialState();
  }

  void initialState() async {
    List<MyBookingConfig> data = await _detailsService.getMyBooking();

    emit(state.copyWith(
      myBookings: data,
    ));
  }
}
