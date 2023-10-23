import 'package:book_appointment/feature/model/doctorDetailsConfig.dart';
import 'package:book_appointment/feature/service/detailsService.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DetailsService _detailsService;

  HomeCubit(this._detailsService) : super(const HomeState()) {
    initialState();
  }

  void initialState() async {
    List<DoctorDetailsConfig> data = await _detailsService.getDoctorDetails();

    emit(state.copyWith(
      doctorsList: data,
    ));
  }
}
