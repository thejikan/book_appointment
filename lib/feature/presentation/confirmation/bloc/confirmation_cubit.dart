import 'package:book_appointment/feature/model/myBookingConfig.dart';
import 'package:book_appointment/feature/service/detailsService.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'confirmation_state.dart';

class ConfirmationCubit extends Cubit<ConfirmationState> {
  final DetailsService _detailsService;

  ConfirmationCubit(this._detailsService) : super(const ConfirmationState()) {
    initialState();
  }

  void initialState() async {
    ConfirmationConfig data = await _detailsService.getConfirmation();

    emit(state.copyWith(
      appointmentPackage: data.appointmentPackage,
      doctorName: data.doctorName,
      location: data.location,
      appointmentDate: data.appointmentDate,
      appointmentTime: data.appointmentTime,
    ));
  }
}
