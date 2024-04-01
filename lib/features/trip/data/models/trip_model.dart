import 'package:flutter_clean_architecture/features/trip/domain/entities/trip.dart';
import 'package:hive/hive.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String> photos;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final String location;

  TripModel(
      {required this.title,
      required this.photos,
      required this.description,
      required this.date,
      required this.location});

  // conversion from Entity to Model
  factory TripModel.fromEntity(Trip trip) => TripModel(
        title: trip.title,
        photos: trip.photos,
        description: trip.description,
        date: trip.date,
        location: trip.location,
      );

  // conversion from Model to Entity
  Trip toEntity() => Trip(
        title: title,
        photos: photos,
        description: description,
        date: date,
        location: location,
      );
}
