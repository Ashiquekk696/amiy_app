import 'package:amiy_app/features/event_details/presentation/events/event_details_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/attendees_repo.dart';
import '../../data/repositories/book_slot_repository.dart';
import '../state/event_details_state.dart';

class EventDetailsBloc extends Bloc<EventDetailsEvent, EventDetailsState> {
  final AttendeesRepository attendeesRepo;
  final BookSlotRepository bookSlotRepository;

  EventDetailsBloc(this.attendeesRepo, this.bookSlotRepository)
      : super(const EventDetailsState()) {
    on<AttendListLoadEvent>(_onAttendListLoad);
    on<BookMySlotEvent>(_onBookMySlot);
  }

  /// Handles loading the attendee list
  Future<void> _onAttendListLoad(AttendListLoadEvent event, Emitter<EventDetailsState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final attendeeListModel = await attendeesRepo.getAttendeeList();
      emit(state.copyWith(isLoading: false, attendeeListingModel: attendeeListModel));
    } catch (error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    }
  }

  /// Handles booking a slot
  Future<void> _onBookMySlot(BookMySlotEvent event, Emitter<EventDetailsState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final isSlotBooked = await bookSlotRepository.bookMySlot(
        event.name ?? "",
        event.email ?? "",
        event.phone ?? "",
      );

      if (isSlotBooked) {
        // Reload the attendee list after successful booking
        final attendeeListModel = await attendeesRepo.getAttendeeList();
        emit(state.copyWith(isLoading: false, slotBooked: true, attendeeListingModel: attendeeListModel));
      } else {
        emit(state.copyWith(isLoading: false, slotBooked: false));
      }
    } catch (error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    }
  }
}
