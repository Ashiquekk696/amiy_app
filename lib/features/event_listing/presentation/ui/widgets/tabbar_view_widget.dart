import 'package:amiy_app/core/utils/constants.dart'; 
import 'package:flutter/material.dart';

import '../../../../../core/utils/responive.dart';
import '../../../data/model/event_list_model.dart';
import 'event_listing_widget.dart';

/// A widget that displays a TabBarView for different categories of events.
class TabBarViewWidget extends StatelessWidget {
  /// Creates a [TabBarViewWidget].
  ///
  /// The [tabController] parameter is required to control the tab selection,
  /// [responsive] is required for responsive design, and [events] contains
  /// the list of events to be displayed.
  const TabBarViewWidget({
    super.key,
    required TabController tabController,
    required this.responsive,
    required this.events,
  }) : _tabController = tabController;

  /// The controller for the tabs.
  final TabController _tabController;

  /// The responsive design helper.
  final Responsive responsive;

  /// The list of events to be displayed.
  final List<EventListModel> events;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          EventListWidget(
            eventType: AppConstants.$new,
            responsive: responsive,
            events: events,
          ),
          EventListWidget(
            eventType: AppConstants.trending,
            responsive: responsive,
            events: events,
          ),
          EventListWidget(
            eventType: AppConstants.waitingRoom,
            responsive: responsive,
            events: events,
          ),
        ],
      ),
    );
  }
}
