import 'package:flutter_clean_architecture/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:flutter_clean_architecture/features/trip/data/models/trip_model.dart';
import 'package:flutter_clean_architecture/features/trip/domain/entities/trip.dart';
import 'package:flutter_clean_architecture/features/trip/domain/repositories/trip_repository.dart';

class TripRepositoryImpl implements TripRepository {
  final TripLocalDataSource localDataSource;
  TripRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    localDataSource.addTrip(tripModel);
  }

  @override
  Future<void> deleteTrip(int index) async {
    localDataSource.deleteTrip(index);
  }

  @override
  Future<List<Trip>> getTrips() async {
    final tripModel = localDataSource.getTrips();
    final List<Trip> result =
        tripModel.map((model) => model.toEntity()).toList();
    return result;
  }
}
