import 'package:amiy_app/core/network/api_base_helper.dart';
import 'package:amiy_app/core/utils/endpoints.dart';

class EventListDatasource {
  ApiBaseHelper apiBaseHelper;
  EventListDatasource(this.apiBaseHelper);
  Future<List> getHomeData() async {
      /// Fetches the list of events from the remote data source.
      /// Returns a list of events or throws an exception if the fetch fails.
    List response = await apiBaseHelper.get(ApiEndPoints.eventList);
    return response;
  }
}
