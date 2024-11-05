import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/colors.dart';

/// A widget that displays a date in a styled box.
class DateBox extends StatelessWidget {
  /// Creates a [DateBox] widget.
  ///
  /// The [date] parameter is required and should be a string representing a date.
  const DateBox({required this.date});

  /// The date to be displayed in the box.
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF673AB7),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date?.split(" ")[0] ?? "",
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(AppColors.white),
            ),
          ),
          Text(
            date?.split(" ")[1].replaceAll(",", "") ?? "",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
