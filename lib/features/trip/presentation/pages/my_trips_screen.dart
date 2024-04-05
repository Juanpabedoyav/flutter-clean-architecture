import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/trip/presentation/providers/trip_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTripsScreen extends ConsumerWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripList = ref.watch(tripListNotifierProvider);
    return ListView.builder(
      itemCount: tripList.length,
      itemBuilder: (context, index) {
        final trip = tripList[index];
        return Text(trip.title);
      },
    );
  }
}
