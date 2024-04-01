import 'package:flutter_clean_architecture/features/trip/domain/entities/trip.dart';
import 'package:flutter_clean_architecture/features/trip/domain/repositories/trip_repository.dart';

class AddTrips {
  final TripRepository repository;
  AddTrips(this.repository);
  Future<void> call(Trip trip) {
    return repository.addTrip(trip);
  }
}
