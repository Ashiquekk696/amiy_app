import 'package:amiy_app/core/utils/colors.dart';
import 'package:amiy_app/features/event_details/presentation/ui/widgets/attendees_section.dart';
import 'package:amiy_app/features/event_details/presentation/ui/widgets/booking_form.dart';
import 'package:amiy_app/features/event_listing/data/model/event_list_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/responive.dart';
import 'widgets/event_image.dart';
import 'widgets/event_info.dart';

/// A page that displays the details of an event, including the image,
/// information, booking form, and attendees section.
class EventDetailsPage extends StatelessWidget {
  /// Creates an [EventDetailsPage].
  ///
  /// The [eventListModel] parameter is required and represents the details of the event.
  const EventDetailsPage(this.eventListModel, {super.key});

  /// The model containing event details.
  final EventListModel? eventListModel;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);

    if (eventListModel == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Event Details")),
        body: const Center(child: Text("No event data available.")),
      );
    }

    return Scaffold(
      backgroundColor: const Color(AppColors.white),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EventImage(
                    eventListModel: eventListModel!, responsive: responsive),
                const SizedBox(height: 20),
                EventInfo(
                    eventListModel: eventListModel!, responsive: responsive),
                const SizedBox(height: 30),
                BookingForm(responsive: responsive),
                const SizedBox(height: 30),
                AttendeesSection(responsive: responsive),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
