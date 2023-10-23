import 'dart:collection';
import 'dart:io';
import 'package:http/http.dart' as http;

class DetailsProvider extends IDetailsProvider {

  String baseUrl = 'https://my-json-server.typicode.com/githubforekam/doctor-appointment';

  @override
  Future<http.Response> getDoctorDetails() async {
    String endPointPath = '$baseUrl/doctors';
    // String endPointPath = 'https://my-json-server.typicode.com/githubforekam/doctor-appointment/doctors';

    return await http.get(
      Uri.parse(endPointPath),
    );
  }

  @override
  Future<http.Response> getPackageDetails() async {
    String endPointPath = '$baseUrl/appointment_options';

    return await http.get(
      Uri.parse(endPointPath),
    );
  }

  @override
  Future<http.Response> getConfirmation() async {
    String endPointPath = '$baseUrl/booking_confirmation';


    return await http.get(
      Uri.parse(endPointPath),
    );
  }

  @override
  Future<http.Response> myBooking() async {
    String endPointPath = '$baseUrl/appointments';


    return await http.get(
      Uri.parse(endPointPath),
    );
  }


}

abstract class IDetailsProvider {
  Future<http.Response> getDoctorDetails();
  Future<http.Response> getPackageDetails();
  Future<http.Response> getConfirmation();
  Future<http.Response> myBooking();
}
