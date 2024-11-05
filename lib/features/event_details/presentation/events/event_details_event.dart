/// Abstract class representing events related to event details.
abstract class EventDetailsEvent {}

/// Event to load the attendee list.
class AttendListLoadEvent extends EventDetailsEvent {}

/// Event to book a slot for an attendee.
class BookMySlotEvent extends EventDetailsEvent {
  final String? name;
  final String? email;
  final String? phone;

  /// Creates a [BookMySlotEvent] with optional name, email, and phone.
  BookMySlotEvent({
    this.name,
    this.email,
    this.phone,
  });
}
