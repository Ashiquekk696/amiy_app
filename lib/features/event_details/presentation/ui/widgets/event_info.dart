import 'package:amiy_app/core/utils/colors.dart';
import 'package:amiy_app/core/utils/responive.dart';
import 'package:amiy_app/features/event_listing/data/model/event_list_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'date_box.dart';

/// Displays the event information, including the event name, date,
/// description, and a booking prompt.
class EventInfo extends StatelessWidget {
  final EventListModel eventListModel;
  final Responsive responsive;

  const EventInfo({super.key, required this.eventListModel, required this.responsive});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Displays the date box for the event.
            DateBox(date: eventListModel.date),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                eventListModel.eventName ?? "",
                style: GoogleFonts.montserrat(
                  fontSize: responsive.fontSize(18),
                  fontWeight: FontWeight.bold,
                  color: const Color(AppColors.black),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "10 AM - 3 PM",
          style: GoogleFonts.openSans(
            fontSize: responsive.fontSize(14),
            fontWeight: FontWeight.w400,
            color: const Color(AppColors.lightBlack),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          eventListModel.description ?? "",
          style: GoogleFonts.openSans(
            fontSize: responsive.fontSize(14),
            fontWeight: FontWeight.w500,
            color: const Color(AppColors.black),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          eventListModel.fullDescription ?? "",
          style: GoogleFonts.openSans(
            fontSize: responsive.fontSize(14),
            fontWeight: FontWeight.w400,
            color: const Color(AppColors.black),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          "Book Your Spot",
          style: GoogleFonts.montserrat(
            fontSize: responsive.fontSize(16),
            fontWeight: FontWeight.w600,
            color: const Color(AppColors.black),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
