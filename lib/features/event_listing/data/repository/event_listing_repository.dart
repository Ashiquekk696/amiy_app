import '../model/event_list_model.dart';

abstract class EventListRepository {
  Future<List<EventListModel>> getEventList();
}
