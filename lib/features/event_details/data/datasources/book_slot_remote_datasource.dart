import '../../../../core/network/api_base_helper.dart';
import '../../../../core/utils/endpoints.dart';

class BookSlotRemoteDatasource {
  final ApiBaseHelper apiBaseHelper;

  BookSlotRemoteDatasource(this.apiBaseHelper);

  Future<bool> bookMySlot(String? name, String? email, String? phone) async {
    try {
      // Prepare the data to send in the request
      final payload = {
        "username": name ?? "",
        "phone": phone ?? "",
        "email": email ?? ""
      };

      // Make the API call to book the slot
      var response = await apiBaseHelper.post(ApiEndPoints.bookMySlot, payload);

      // Check if the response is not empty and return true if successful
      if (response.isNotEmpty) {
        return true;
      }
      return false; // Return false if response is empty
    } catch (error) {
      // Handle errors that occur during the API call
      // You could log the error or rethrow it to be handled by the caller
      // Logger().e('Error booking slot: $error');
      throw Exception('Failed to book slot: $error');
    }
  }
}
