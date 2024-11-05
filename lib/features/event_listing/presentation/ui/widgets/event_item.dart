import 'package:amiy_app/core/utils/colors.dart'; 
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/responive.dart';

/// A widget that displays an individual event item.
class EventItem extends StatelessWidget {
  /// Creates an [EventItem].
  ///
  /// The [title], [description], [imageUrl], [date], and [responsive]
  /// parameters are required to initialize the widget.
  const EventItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.responsive,
    super.key,
  });

  /// The title of the event.
  final String title;

  /// The description of the event.
  final String description;

  /// The URL of the event's image.
  final String imageUrl;

  /// The date of the event in string format.
  final String date;

  /// The responsive design helper.
  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(AppColors.grey).withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: responsive.blockSizeVertical * 15,
              width: responsive.width,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Color(AppColors.lighGreyColor),
                highlightColor: Color(AppColors.white),
                child: Container(
                  height: responsive.blockSizeVertical * 15,
                  width: responsive.width,
                  color: const Color(AppColors.white),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF000000),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFF673AB7),
                      ),
                      height: 50,
                      width: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            date.split(" ")[0], // Month
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color(AppColors.white),
                            ),
                          ),
                          Text(
                            date.split(" ")[1].replaceAll(",", ""), // Day
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: const Color(AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        description,
                        style: GoogleFonts.openSans(
                          fontSize: responsive.fontSize(11),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xB2000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
