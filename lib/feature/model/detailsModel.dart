import 'dart:convert';

import 'package:book_appointment/feature/model/doctorDetailsConfig.dart';

class DetailsModel {
  String appointmentPackage;
  String doctorName;
  String location;
  String appointmentDate;
  String appointmentTime;
  String bookingFor;
  String duration;
  String speciality;

  DetailsModel({
    this.appointmentPackage = '',
    this.doctorName = '',
    this.location = '',
    this.appointmentDate = '',
    this.appointmentTime = '',
    this.bookingFor = '',
    this.duration = '',
    this.speciality = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appointmentPackage': appointmentPackage,
      'doctorName': doctorName,
      'location': location,
      'appointmentDate': appointmentDate,
      'appointmentTime': appointmentTime,
      'bookingFor': bookingFor,
      'duration': duration,
      'speciality': speciality,
    };
  }

  factory DetailsModel.fromMap(Map<String, dynamic> map) {
    return DetailsModel(
      appointmentPackage: map['appointmentPackage'] as String,
      doctorName: map['doctorName'] as String,
      location: map['location'] as String,
      appointmentDate: map['appointmentDate'] as String,
      appointmentTime: map['appointmentTime'] as String,
      bookingFor: map['bookingFor'] as String,
      duration: map['duration'] as String,
      speciality: map['speciality'] as String,
    );
  }

  factory DetailsModel.empty() {
    return DetailsModel(
      appointmentPackage: '',
      doctorName: '',
      location: '',
      appointmentDate: '',
      appointmentTime: '',
      bookingFor: '',
      duration: '',
      speciality: '',
    );
  }

  factory DetailsModel.fromQueryMap(Map<String, dynamic> map) {
    return DetailsModel(
      appointmentPackage: map['appointmentPackage'] as String? ?? '',
      doctorName: map['doctorName'] as String? ?? '',
      location: map['location'] as String? ?? '',
      appointmentDate: map['appointmentDate'] as String? ?? '',
      appointmentTime: map['appointmentTime'] as String? ?? '',
      bookingFor: map['bookingFor'] as String? ?? '',
      duration: map['duration'] as String? ?? '',
      speciality: map['speciality'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailsModel.fromJson(String source) =>
      DetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
