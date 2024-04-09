import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/trip/domain/entities/trip.dart';
import 'package:flutter_clean_architecture/features/trip/presentation/providers/trip_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTripScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: "Title");
  final _descController = TextEditingController(text: "Description");
  final _locationController = TextEditingController(text: "City ");
  final _pictureController = TextEditingController(text: "Photo");
  List<String> pictures = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextFormField(
            controller: _descController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          TextFormField(
            controller: _locationController,
            decoration: InputDecoration(labelText: 'Location'),
          ),
          TextFormField(
            controller: _pictureController,
            decoration: InputDecoration(labelText: 'Picture'),
          ),
          ElevatedButton(
            onPressed: () {
              pictures.add(_pictureController.text);
              if (_formKey.currentState!.validate()) {
                final newTrip = Trip(
                  title: _titleController.text,
                  photos: pictures,
                  description: _descController.text,
                  location: _locationController.text,
                  date: DateTime.now(),
                );
                ref.read(tripListNotifierProvider.notifier).addNewTrip(newTrip);
                ref.watch(tripListNotifierProvider.notifier).loadTrip();
              }
            },
            child: Text('Add Trip'),
          )
        ],
      ),
    );
  }
}
