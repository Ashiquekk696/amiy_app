import 'package:amiy_app/features/event_details/data/models/attendees_list_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/colors.dart';

/// A widget that displays an attendee's information.
class AttendeeCard extends StatelessWidget {
  /// Creates an [AttendeeCard].
  ///
  /// The [attendee] parameter is required and must not be null.
  const AttendeeCard({super.key, required this.attendee});

  final AttendeeListModel attendee;

  @override
  Widget build(BuildContext context) {
    final String name = attendee.name ?? "N/A";
    final String initials = _getInitials(name);

    return Visibility(
      visible: _isVisible(),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 8),
        child: Container(
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(AppColors.white),
            boxShadow: [
              BoxShadow(
                color: const Color(AppColors.grey).withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(AppColors.lighGreyColor),
                  child: Text(
                    initials,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(AppColors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(AppColors.black),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  attendee.phone ?? "",
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(AppColors.lightBlack),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Determines whether the card should be visible based on the attendee's information.
  bool _isVisible() {
    return attendee.name != null && attendee.phone?.isNotEmpty == true;
  }

  /// Generates initials from the attendee's name.
  String _getInitials(String name) {
    if (name.isEmpty) return "?"; // Default if the name is empty
    List<String> words = name.split(' ');
    String initials = words
        .map((word) => word.isNotEmpty ? word[0].toUpperCase() : '')
        .join();
    return initials.length > 2
        ? initials.substring(0, 2)
        : initials; // Limit to two initials for better display
  }
}
