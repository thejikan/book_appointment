class DoctorDetailsConfig {
  String doctorName;
  String image;
  String speciality;
  String location;
  int patientServed;
  int yearsOfExperience;
  double rating;
  int numberOfReviews;
  Map<String, List<String>> availability;

  DoctorDetailsConfig({
    required this.doctorName,
    required this.location,
    required this.image,
    required this.speciality,
    required this.patientServed,
    required this.yearsOfExperience,
    required this.rating,
    required this.numberOfReviews,
    required this.availability,
  });

  factory DoctorDetailsConfig.empty() {
    return DoctorDetailsConfig(
      speciality: '',
      doctorName: '',
      location: '',
      image: '',
      patientServed: 0,
      yearsOfExperience: 0,
      rating: 0.0,
      numberOfReviews: 0,
      availability: {},
    );
  }
}