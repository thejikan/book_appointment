part of 'review_cubit.dart';

class ReviewState extends Equatable {
  final String appointmentPackage;
  final String doctorName;
  final String location;
  final String appointmentDate;
  final String appointmentTime;
  final String bookingFor;
  final String duration;
  final String speciality;

  const ReviewState({
    this.appointmentPackage = '',
    this.doctorName = '',
    this.location = '',
    this.appointmentDate = '',
    this.appointmentTime = '',
    this.bookingFor = '',
    this.duration = '',
    this.speciality = '',
  });

  ReviewState copyWith({
    String? appointmentPackage,
    String? doctorName,
    String? location,
    String? appointmentDate,
    String? appointmentTime,
    String? bookingFor,
    String? duration,
    String? speciality,
  }) {
    return ReviewState(
      appointmentPackage: appointmentPackage ?? this.appointmentPackage,
      doctorName: doctorName ?? this.doctorName,
      location: location ?? this.location,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      appointmentTime: appointmentTime ?? this.appointmentTime,
      bookingFor: bookingFor ?? this.bookingFor,
      duration: duration ?? this.duration,
      speciality: speciality ?? this.speciality,
    );
  }

  @override
  List<Object?> get props => [
        appointmentPackage,
        doctorName,
        location,
        appointmentDate,
        appointmentTime,
        bookingFor,
        duration,
        speciality,
      ];
}
