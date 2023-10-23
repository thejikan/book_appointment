class MyBookingConfig {
  String bookingId;
  String doctorName;
  String location;
  String appointmentDate;
  String appointmentTime;

  MyBookingConfig({
    required this.bookingId,
    required this.doctorName,
    required this.location,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  factory MyBookingConfig.empty() {
    return MyBookingConfig(
      bookingId: '',
      doctorName: '',
      location: '',
      appointmentDate: '',
      appointmentTime: '',
    );
  }
}

class ConfirmationConfig {
  String appointmentPackage;
  String doctorName;
  String location;
  String appointmentDate;
  String appointmentTime;

  ConfirmationConfig({
    required this.appointmentPackage,
    required this.doctorName,
    required this.location,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  factory ConfirmationConfig.empty() {
    return ConfirmationConfig(
      appointmentPackage: '',
      doctorName: '',
      location: '',
      appointmentDate: '',
      appointmentTime: '',
    );
  }
}