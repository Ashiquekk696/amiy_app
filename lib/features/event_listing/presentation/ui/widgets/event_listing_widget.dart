import 'package:amiy_app/core/utils/colors.dart';
import 'package:amiy_app/core/utils/routes.dart';
import 'package:amiy_app/features/event_listing/data/model/event_list_model.dart';
import 'package:amiy_app/features/event_listing/presentation/ui/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/responive.dart';

/// A widget that displays a list of events in a masonry grid layout.
class EventListWidget extends StatelessWidget {
  /// Creates an [EventListWidget].
  ///
  /// The [eventType] parameter specifies the type of events to display,
  /// [responsive] provides responsive design utilities, and [events]
  /// is the list of events to be shown.
  const EventListWidget({
    required this.eventType,
    required this.responsive,
    required this.events,
    super.key,
  });

  /// The type of events to display.
  final String eventType;

  /// The responsive design helper.
  final Responsive responsive;

  /// The list of events to be displayed.
  final List<EventListModel> events;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: MasonryGridView.builder(
        itemCount: events.length,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: responsive.isUltraLargeScreen()
              ? 4
              : responsive.isExtraLargeScreen() || responsive.isLargeScreen()
                  ? 3
                  : responsive.isMediumScreen()
                      ? 2
                      : 1,
        ),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, i) {
          return AnimationConfiguration.staggeredGrid(
            position: i,
            duration: const Duration(milliseconds: 500),
            columnCount: 3,
            child: Column(
              children: [
                EventItem(
                  imageUrl: events[i].imageUrl??"",
                  title: events[i].eventName??"",
                  description: events[i].description??"",
                  date: events[i].date??"",
                  responsive: responsive,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.eventDetails,
                        arguments: events[i],
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(AppColors.primaryColor),
                      padding: EdgeInsets.symmetric(
                        vertical: responsive.blockSizeVertical * 2,
                        horizontal: responsive.blockSizeHorizontal * 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 6,
                      shadowColor: Colors.black.withOpacity(0.2),
                    ),
                    child: Text(
                      'BOOK NOW',
                      style: GoogleFonts.montserrat(
                        fontSize: responsive.fontSize(12),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
