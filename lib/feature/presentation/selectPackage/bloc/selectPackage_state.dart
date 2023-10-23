part of 'selectPackage_cubit.dart';

class SelectPackageState extends Equatable {
  final List<String> durations;
  final List<String> packages;

  const SelectPackageState({
    this.durations = const [],
    this.packages = const [],
  });

  SelectPackageState copyWith({
    List<String>? durations,
    List<String>? packages,
  }) {
    return SelectPackageState(
      durations: durations ?? this.durations,
      packages: packages ?? this.packages,
    );
  }

  @override
  List<Object?> get props => [
        durations,
        packages,
      ];
}
