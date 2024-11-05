import 'package:amiy_app/features/event_listing/presentation/events/event_list_event.dart';
import 'package:amiy_app/features/event_listing/presentation/state/event_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/event_list_model.dart';
import '../../data/repository/event_listing_repository.dart';

class EventListBloc extends Bloc<EventListEvent, EventListState> {
  late EventListRepository? eventListingRepo;
  late List<EventListModel>? eventListModel;
  EventListBloc(this.eventListingRepo) : super(EventListState()) {
    on<EventListLoadEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        eventListModel = await eventListingRepo?.getEventList();
        emit(state.copyWith(
            isLoading: false, eventListingModel: eventListModel));
      },
    );
  }
}
