import 'package:book_appointment/feature/model/productConfig.dart';
import 'package:book_appointment/feature/service/detailsService.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  final DetailsService _detailsService;

  ReviewCubit(this._detailsService) : super(const ReviewState()) {
    initialState();
  }

  void initialState() async {

    emit(state.copyWith(
      // appointmentPackage: data.appointmentPackage,
      // doctorName: data.doctorName,
      // location: data.location,
      // appointmentDate: data.appointmentDate,
      // appointmentTime: data.appointmentTime,
    ));
  }
}
