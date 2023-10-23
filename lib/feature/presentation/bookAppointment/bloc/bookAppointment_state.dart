part of 'bookAppointment_cubit.dart';

class BookAppointmentState extends Equatable {
  final String doctorName;
  final String image;
  final String speciality;
  final String location;
  final int patientServed;
  final int yearsOfExperience;
  final double rating;
  final int numberOfReviews;
  final Map<String, List<String>> availability;

  const BookAppointmentState({
    this.doctorName = '',
    this.location = '',
    this.image = '',
    this.speciality = '',
    this.patientServed = 0,
    this.yearsOfExperience = 0,
    this.rating = 0,
    this.numberOfReviews = 0,
    this.availability = const {},
  });

  BookAppointmentState copyWith({
    String? doctorName,
    String? image,
    String? speciality,
    String? location,
    int? patientServed,
    int? yearsOfExperience,
    double? rating,
    int? numberOfReviews,
    Map<String, List<String>>? availability,
  }) {
    return BookAppointmentState(
      speciality: speciality ?? this.speciality,
      doctorName: doctorName ?? this.doctorName,
      location: location ?? this.location,
      image: image ?? this.image,
      patientServed: patientServed ?? this.patientServed,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      rating: rating ?? this.rating,
      numberOfReviews: numberOfReviews ?? this.numberOfReviews,
      availability: availability ?? this.availability,
    );
  }

  @override
  List<Object?> get props => [
        speciality,
        doctorName,
        location,
        image,
        patientServed,
        yearsOfExperience,
        rating,
        numberOfReviews,
        availability,
      ];
}
