part of 'confirmation_cubit.dart';

class ConfirmationState extends Equatable {
  final String appointmentPackage;
  final String doctorName;
  final String location;
  final String appointmentDate;
  final String appointmentTime;

  const ConfirmationState({
    this.appointmentPackage = '',
    this.doctorName = '',
    this.location = '',
    this.appointmentDate = '',
    this.appointmentTime = '',
  });

  ConfirmationState copyWith({
    String? appointmentPackage,
    String? doctorName,
    String? location,
    String? appointmentDate,
    String? appointmentTime,
  }) {
    return ConfirmationState(
      appointmentPackage: appointmentPackage ?? this.appointmentPackage,
      doctorName: doctorName ?? this.doctorName,
      location: location ?? this.location,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      appointmentTime: appointmentTime ?? this.appointmentTime,
    );
  }

  @override
  List<Object?> get props => [
        appointmentPackage,
        doctorName,
        location,
        appointmentDate,
        appointmentTime,
      ];
}
