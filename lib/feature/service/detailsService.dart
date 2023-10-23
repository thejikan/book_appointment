import 'package:book_appointment/feature/api/detailsRepository.dart';
import 'package:book_appointment/feature/model/detailsModel.dart';
import 'package:book_appointment/feature/model/doctorDetailsConfig.dart';
import 'package:book_appointment/feature/model/myBookingConfig.dart';
import 'package:book_appointment/feature/model/packageConfig.dart';
import 'package:book_appointment/feature/model/productConfig.dart';
import 'package:rxdart/subjects.dart';

class DetailsService {
  IDetailsRepository repository;

  late DetailsModel _detailsModel;
  late BehaviorSubject<DetailsModel> detailsController;

  DetailsService({required this.repository, DetailsModel? detailsModel}) {
    _detailsModel = detailsModel ?? DetailsModel.empty();
  }

  Future<List<DoctorDetailsConfig>> getDoctorDetails() async {
    try {
      List<DoctorDetailsConfig> data = await repository.getDoctorDetails();

      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<PackageConfig> getPackageDetails() async {
    try {
      PackageConfig data = await repository.getPackageDetails();

      return data;
    } catch (e) {
      return PackageConfig.empty();
      // rethrow;
    }
  }

  Future<ConfirmationConfig> getConfirmation() async {
    try {
      ConfirmationConfig data = await repository.getConfirmation();

      return data;
    } catch (e) {
      return ConfirmationConfig.empty();
      // rethrow;
    }
  }

  Future<List<MyBookingConfig>> getMyBooking() async {
    try {
      List<MyBookingConfig> data = await repository.myBooking();

      return data;
    } catch (e) {
      return [];
      // rethrow;
    }
  }

  void setSelectDoctorData(DoctorDetailsConfig doctor){

  }


}
