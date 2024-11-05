import 'package:amiy_app/core/utils/constants.dart';
import 'package:amiy_app/core/utils/responive.dart';
import 'package:amiy_app/core/widgets/loader_widget.dart';
import 'package:amiy_app/features/event_listing/presentation/bloc/event_list_bloc.dart';
import 'package:amiy_app/features/event_listing/presentation/events/event_list_event.dart';
import 'package:amiy_app/features/event_listing/presentation/ui/widgets/tabs_widget.dart';
import 'package:amiy_app/features/event_listing/presentation/state/event_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import 'widgets/tabbar_view_widget.dart';

/// The main page for displaying the list of events.
/// It contains an app bar, a set of tabs, and a tab view
/// for listing event categories such as "New", "Trending", and "Waiting Room".
class EventListingPage extends StatefulWidget {
  const EventListingPage({super.key});

  @override
  _EventListingPageState createState() => _EventListingPageState();
}

class _EventListingPageState extends State<EventListingPage>
    with SingleTickerProviderStateMixin { 
  late TabController _tabController;
 
  late final EventListBloc eventListBloc;
 
  /// Sets up the [TabController] and loads events by adding an [EventListLoadEvent] to the [EventListBloc].
  @override
  void initState() {
    super.initState();
    eventListBloc = GetIt.I<EventListBloc>();
    eventListBloc.add(EventListLoadEvent());
    _tabController = TabController(length: 3, vsync: this);
  }

  /// Disposes of the [TabController] when the widget is removed from the widget tree.
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// Builds the widget tree for the event listing page.
  /// The UI adapts based on the loading state of the [EventListBloc].
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(AppColors.white),
        body: BlocBuilder<EventListBloc, EventListState>(
            bloc: eventListBloc,
            builder: (context, state) {
              // Show loading indicator if data is still being fetched
              if ((state.isLoading ?? false)) {
                return const LoaderWidget();
              } else {
                return Center(
                  child: SizedBox(
                    width: responsive.width * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        AppBarWidget(
                          responsive: responsive,
                          title: AppConstants.events,
                        ),
                         
                        TabsWidget(
                            responsive: responsive,
                            tabController: _tabController),
                         
                        TabBarViewWidget(
                          tabController: _tabController,
                          responsive: responsive,
                          events: state.eventListingModel ?? [],
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
