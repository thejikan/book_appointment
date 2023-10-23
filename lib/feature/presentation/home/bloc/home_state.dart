part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<DoctorDetailsConfig> doctorsList;

  const HomeState({
    this.doctorsList = const [],
  });

  HomeState copyWith({
    List<DoctorDetailsConfig>? doctorsList,
  }) {
    return HomeState(
      doctorsList: doctorsList ?? this.doctorsList,
    );
  }

  @override
  List<Object?> get props => [
    doctorsList,
      ];
}
