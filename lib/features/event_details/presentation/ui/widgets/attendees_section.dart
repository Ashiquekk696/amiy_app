import 'package:amiy_app/core/utils/colors.dart';
import 'package:amiy_app/core/utils/responive.dart';
import 'package:amiy_app/core/widgets/loader_widget.dart';
import 'package:amiy_app/features/event_details/presentation/events/event_details_event.dart';
import 'package:amiy_app/features/event_details/presentation/state/event_details_state.dart';
import 'package:amiy_app/features/event_details/presentation/ui/widgets/attendee_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/event_details_bloc.dart';

/// A section displaying the list of attendees for an event.
class AttendeesSection extends StatefulWidget {
  /// Creates an [AttendeesSection].
  ///
  /// The [responsive] parameter is required for responsive design.
  const AttendeesSection({required this.responsive});

  final Responsive responsive;

  @override
  State<AttendeesSection> createState() => _AttendeesSectionState();
}

class _AttendeesSectionState extends State<AttendeesSection> {
  late EventDetailsBloc eventDetailsBloc;

  @override
  void initState() {
    super.initState();
    eventDetailsBloc = GetIt.I<EventDetailsBloc>();
    eventDetailsBloc.add(AttendListLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        const SizedBox(height: 10),
        _buildAttendeeList(),
        const SizedBox(height: 30),
      ],
    );
  }

  /// Builds the title of the attendees section.
  Widget _buildTitle() {
    return Text(
      "Attendees",
      style: GoogleFonts.montserrat(
        fontSize: widget.responsive.fontSize(16),
        fontWeight: FontWeight.w600,
        color: const Color(AppColors.black),
      ),
    );
  }

  /// Builds the list of attendees or shows a loading indicator.
  Widget _buildAttendeeList() {
    return BlocBuilder<EventDetailsBloc, EventDetailsState>(
      bloc: eventDetailsBloc,
      builder: (context, state) {
        if (state.isLoading ?? false) {
          return const LoaderWidget();
        } else {
          return Wrap(
            children: (state.attendeeListingModel ?? []).map((attendee) {
              return Padding(
                padding: const EdgeInsets.only(left: 0), // Adjust spacing here
                child: AttendeeCard(attendee: attendee),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
