import 'package:book_appointment/feature/model/doctorDetailsConfig.dart';
import 'package:book_appointment/feature/model/productConfig.dart';
import 'package:book_appointment/feature/service/detailsService.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bookAppointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  final DetailsService _detailsService;
  final DoctorDetailsConfig doctor;

  BookAppointmentCubit(this._detailsService, this.doctor)
      : super(const BookAppointmentState()) {
    initialState();
  }

  void initialState() async {
    // ProductConfig data = await _detailsService.getProductById(productId);
    // List<String> imageUrls = data.imageUrls;
    // imageUrls.add(data.category.image);
    //
    emit(state.copyWith(
      speciality: doctor.speciality,
      doctorName: doctor.doctorName,
      location: doctor.location,
      image: doctor.image,
      patientServed: doctor.patientServed,
      yearsOfExperience: doctor.yearsOfExperience,
      rating: doctor.rating,
      numberOfReviews: doctor.numberOfReviews,
      availability: doctor.availability,
    ));
  }

  // void changeDotIndicator(){
  //   int num = (state.sliderCardNumber+1)%4;
  //   emit(state.copyWith(
  //     sliderCardNumber: num,
  //   ));
  // }
}
