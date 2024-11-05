import 'package:amiy_app/features/event_listing/data/model/event_list_model.dart';
import 'package:amiy_app/features/event_listing/data/repository/event_listing_repository.dart';
import '../../data/datasources/event_listing_datasource.dart';

class EventListRepoImpl implements EventListRepository {
  EventListDatasource eventListingDatasource;
  EventListRepoImpl(this.eventListingDatasource);

  /// Fetches the list of events from the data source.
  ///
  /// Returns a list of [EventListModel] or throws an exception if the fetch fails.
  @override
  Future<List<EventListModel>> getEventList() async {
    var response = await eventListingDatasource.getHomeData();
    List<EventListModel>? eventListingModel;
    eventListingModel =
        response.map((e) => EventListModel.fromJson(e)).toList(); 
    return eventListingModel;
  }
}
