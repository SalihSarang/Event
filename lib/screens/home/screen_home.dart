import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/home_screen/home_screen.dart';
import 'package:event_vault/widgets/screen_event_manager/event_cards/event_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EventAddModal> upcomingEvents = [];

  fetchUpcomingEvents() {
    List<EventAddModal> events = getUpcomingEvents();
    setState(() {
      upcomingEvents = events;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUpcomingEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: CustomAppBar(title: "Dashboard"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              'Upcoming Events',
              style: myFont(size: 25),
            ),
            CarouselSlider(
              items: upcomingEvents.map(
                (event) {
                  return Container(
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: EventCard(event: event),
                      ),
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                height: 325.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            eventCompleted(context: context),
            SizedBox(height: 20),
            // graph(),
          ],
        ),
      ),
    );
  }
}
