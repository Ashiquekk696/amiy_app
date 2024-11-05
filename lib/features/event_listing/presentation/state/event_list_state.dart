import '../../data/model/event_list_model.dart';

class EventListState {
  final bool? isLoading;
  final List<EventListModel>? eventListingModel;
  final String? errorMessage;
  const EventListState(
  {    this.isLoading =false, this.eventListingModel, this.errorMessage});

  EventListState copyWith(
      {bool? isLoading,
      List<EventListModel>? eventListingModel,
      String? errorMessage}) {
    return EventListState(
      isLoading: 
      isLoading ?? this.isLoading,
      eventListingModel: 
        eventListingModel ?? this.eventListingModel,
        errorMessage: 
       this.errorMessage);
  }
}
