import 'package:amiy_app/features/event_details/presentation/ui/event_details_page.dart';
import 'package:amiy_app/features/event_listing/presentation/ui/event_listing_page.dart';
import 'package:flutter/material.dart';
import '../../features/event_listing/data/model/event_list_model.dart';

class AppRoutes {
  static const String home = "/";
  static const String eventDetails = "/eventDetails";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => EventListingPage());
      case eventDetails:
        final eventListModel = settings.arguments as EventListModel?;
        if (eventListModel != null) {
          return MaterialPageRoute(
            builder: (_) => EventDetailsPage(eventListModel),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page not found!'),
        ),
      ),
    );
  }
}
