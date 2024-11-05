import 'package:amiy_app/features/event_details/data/datasources/attendees_remote_datasource.dart';
import 'package:amiy_app/features/event_details/data/models/attendees_list_model.dart';
import 'package:amiy_app/features/event_details/data/repositories/attendees_repo.dart';

class AttendeesRepositoryImpl implements AttendeesRepository {
  AttendeeListRemoteDataSource attendeeListRemoteDataSource;
  AttendeesRepositoryImpl(this.attendeeListRemoteDataSource);
  @override
  Future<List<AttendeeListModel>> getAttendeeList()async {
     // Fetch the raw list of attendees from the remote data source
   var response = await attendeeListRemoteDataSource.getAttendeeList();
    List<AttendeeListModel>? eventListingModel;
    eventListingModel =
        response.map((e) => AttendeeListModel.fromJson(e)).toList(); 
    return eventListingModel;
  }
 
}
