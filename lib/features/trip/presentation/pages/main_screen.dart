import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/trip/presentation/pages/add_trip_screen.dart';
import 'package:flutter_clean_architecture/features/trip/presentation/pages/my_trips_screen.dart';
import 'package:flutter_clean_architecture/features/trip/presentation/providers/trip_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tripListNotifierProvider.notifier).loadTrip();

    _pageController.addListener(() {
      _currentPage.value = _pageController.page!.round();
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hola',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Viaja Hoy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          MyTripsScreen(),
          AddTripScreen(),
          Text('3'),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentPage,
        builder: (context, pageIndex, child) {
          return BottomNavigationBar(
            currentIndex: pageIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  color: Colors.blue,
                  size: 30,
                ),
                label: "My trips",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
                label: "Add trips",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.map,
                  color: Colors.blue,
                  size: 30,
                ),
                label: "Maps",
              ),
            ],
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
          );
        },
      ),
    );
  }
}
