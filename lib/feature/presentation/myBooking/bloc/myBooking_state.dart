part of 'myBooking_cubit.dart';

class MyBookingState extends Equatable {
  final List<MyBookingConfig> myBookings;

  const MyBookingState({
    this.myBookings = const [],
  });

  MyBookingState copyWith({
    List<MyBookingConfig>? myBookings,
  }) {
    return MyBookingState(
      myBookings: myBookings ?? this.myBookings,
    );
  }

  @override
  List<Object?> get props => [
        myBookings,
      ];
}
