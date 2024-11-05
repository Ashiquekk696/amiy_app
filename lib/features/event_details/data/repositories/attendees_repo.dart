import 'package:amiy_app/features/event_details/data/models/attendees_list_model.dart';

abstract class AttendeesRepository {
  Future<List<AttendeeListModel>> getAttendeeList();
}
