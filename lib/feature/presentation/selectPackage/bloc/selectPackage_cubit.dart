import 'package:book_appointment/feature/model/packageConfig.dart';
import 'package:book_appointment/feature/service/detailsService.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'selectPackage_state.dart';

class SelectPackageCubit extends Cubit<SelectPackageState> {
  final DetailsService _detailsService;

  SelectPackageCubit(this._detailsService) : super(const SelectPackageState()) {
    initialState();
  }

  void initialState() async {
    PackageConfig data = await _detailsService.getPackageDetails();

    print(data.duration);
    emit(state.copyWith(
      durations: data.duration,
      packages: data.package,
    ));
  }
}
