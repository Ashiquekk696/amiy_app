import 'package:amiy_app/features/event_details/data/models/attendees_list_model.dart';

/// Represents the state of the event details.
class EventDetailsState {
  final bool? slotBooked;
  final bool? isLoading;
  final List<AttendeeListModel>? attendeeListingModel;
  final String? errorMessage;

  /// Creates an [EventDetailsState] with optional parameters.
  const EventDetailsState({
    this.isLoading = false,
    this.slotBooked = false,
    this.attendeeListingModel,
    this.errorMessage,
  });

  /// Returns a copy of the current state with updated values.
  EventDetailsState copyWith({
    bool? isLoading,
    List<AttendeeListModel>? attendeeListingModel,
    String? errorMessage,
    bool? slotBooked,
  }) {
    return EventDetailsState(
      isLoading: isLoading ?? this.isLoading,
      slotBooked: slotBooked ?? this.slotBooked,
      attendeeListingModel: attendeeListingModel ?? this.attendeeListingModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
