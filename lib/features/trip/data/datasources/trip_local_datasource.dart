import 'package:flutter_clean_architecture/features/trip/data/models/trip_model.dart';
import 'package:hive/hive.dart';

class TripLocalDataSource {
  final Box<TripModel> tripBox;

  TripLocalDataSource(this.tripBox);

  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }

  void addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  void deleteTrip(int index) {
    tripBox.deleteAt(index);
  }
}
