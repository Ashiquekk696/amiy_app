import 'package:amiy_app/features/event_details/data/datasources/book_slot_remote_datasource.dart';
import 'package:amiy_app/features/event_details/data/repositories/book_slot_repository.dart';

class BookSlotRepoImpl implements BookSlotRepository {
  final BookSlotRemoteDatasource bookSlotRemoteDataSource;

  BookSlotRepoImpl(this.bookSlotRemoteDataSource);

  @override
  Future<bool> bookMySlot(String name, String email, String phone) async {
    try {
      // Call the remote datasource to book the slot
      var response = await bookSlotRemoteDataSource.bookMySlot(name, email, phone);
      
      // Log the response (consider using a logging library)
      // For example: Logger().d('Booking response: $response');
      
      return response;
    } catch (error) {
      // Handle any errors that occur during the booking process
      // For example, log the error or rethrow it for higher-level handling
      // Logger().e('Error booking slot: $error');
      throw Exception('Failed to book slot: $error');
    }
  }
}
