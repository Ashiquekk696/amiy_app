
import '../../../../core/network/api_base_helper.dart';
import '../../../../core/utils/endpoints.dart';

class AttendeeListRemoteDataSource {
  ApiBaseHelper apiBaseHelper;
  AttendeeListRemoteDataSource(this.apiBaseHelper);
  Future<List> getAttendeeList() async {
    List response = await apiBaseHelper.get(ApiEndPoints.attendeeList);
    return response;
  }
}
