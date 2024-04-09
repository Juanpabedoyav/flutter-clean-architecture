import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/trip/presentation/providers/trip_provider.dart';
import 'package:flutter_clean_architecture/features/trip/presentation/widgets/travel_card.dart';
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
        return TravelCard(
          title: trip.title,
          description: trip.description,
          location: trip.location,
          onDelete: () {},
          imageUrl:
              'https://exitocol.vtexassets.com/arquivos/ids/18490301/Surtido-Mega-Lonchera-FRITO-LAY-586-gr-3285022_a.jpg?v=638200621131830000',
          date: '',
        );
      },
    );
  }
}
