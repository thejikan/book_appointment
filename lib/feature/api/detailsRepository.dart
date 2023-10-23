import 'dart:convert';

import 'package:book_appointment/feature/api/detailsProvider.dart';
import 'package:book_appointment/feature/model/doctorDetailsConfig.dart';
import 'package:book_appointment/feature/model/myBookingConfig.dart';
import 'package:book_appointment/feature/model/packageConfig.dart';

class DetailsRepository implements IDetailsRepository {
  IDetailsProvider provider;

  DetailsRepository({
    required this.provider,
  });

  @override
  Future<List<DoctorDetailsConfig>> getDoctorDetails() async {
    List<DoctorDetailsConfig> response = [];
    try {
      final apiResponse = await provider.getDoctorDetails();

      if (apiResponse.statusCode != 200) {
        print(apiResponse.body);
        throw Exception(apiResponse.statusCode);
      }
      List<dynamic> doctorsList = json.decode(apiResponse.body);

      for (var doctor in doctorsList) {
        Map<String, List<String>> availability = {};
        Map<String, dynamic> data = doctor['availability'];

        data.forEach((key, value) {
          List<String> duration = [];
          for (String time in value) {
            duration.add(time);
          }
          availability[key] = duration;
        });

        response.add(DoctorDetailsConfig(
          doctorName: doctor['doctor_name'],
          location: doctor['location'],
          image: doctor['image'],
          speciality: doctor['speciality'],
          patientServed: doctor['patients_served'],
          yearsOfExperience: doctor['years_of_experience'],
          rating: doctor['rating'],
          numberOfReviews: doctor['number_of_reviews'],
          availability: availability,
        ));
      }

      return response;
    } on Exception catch (e, stacktrace) {
      return response;
      // throw Exception();
    }
  }

  @override
  Future<PackageConfig> getPackageDetails() async {
    try {
      final apiResponse = await provider.getPackageDetails();

      if (apiResponse.statusCode != 200) {
        print(apiResponse.body);
        throw Exception(apiResponse.statusCode);
      }
      Map<String, dynamic> product = json.decode(apiResponse.body);

      List<String> durations = [];
      for (String duration in product['duration']) {
        durations.add(duration);
      }
      List<String> packages = [];
      for (String package in product['package']) {
        packages.add(package);
      }

      return PackageConfig(duration: durations, package: packages);
    } on Exception catch (e, stacktrace) {
      return PackageConfig.empty();
    }
  }

  @override
  Future<ConfirmationConfig> getConfirmation() async {
    try {
      final apiResponse = await provider.getConfirmation();

      if (apiResponse.statusCode != 200) {
        print(apiResponse.body);
        throw Exception(apiResponse.statusCode);
      }
      var confirmationData = json.decode(apiResponse.body);

      return ConfirmationConfig(
        appointmentPackage: confirmationData['appointment_package'],
        doctorName: confirmationData['doctor_name'],
        location: confirmationData['location'],
        appointmentDate: confirmationData['appointment_date'],
        appointmentTime: confirmationData['appointment_time'],
      );
    } on Exception catch (e, stacktrace) {
      return ConfirmationConfig.empty();
      // throw Exception();
    }
  }

  @override
  Future<List<MyBookingConfig>> myBooking() async {
    List<MyBookingConfig> response = [];
    try {
      final apiResponse = await provider.myBooking();

      if (apiResponse.statusCode != 200) {
        print(apiResponse.body);
        throw Exception(apiResponse.statusCode);
      }
      var productsList = json.decode(apiResponse.body);

      for (var product in productsList) {
        response.add(MyBookingConfig(
          bookingId: product['booking_id'],
          doctorName: product['doctor_name'],
          location: product['location'],
          appointmentDate: product['appointment_date'],
          appointmentTime: product['appointment_time'],
        ));
      }

      return response;
    } on Exception catch (e, stacktrace) {
      return response;
    }
  }
}

abstract class IDetailsRepository {
  Future<List<DoctorDetailsConfig>> getDoctorDetails();
  Future<PackageConfig> getPackageDetails();
  Future<ConfirmationConfig> getConfirmation();
  Future<List<MyBookingConfig>> myBooking();
}
