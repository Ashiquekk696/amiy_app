import 'dart:io';

import 'package:amiy_app/core/network/api_base_helper.dart';
import 'package:amiy_app/features/event_details/data/datasources/attendees_remote_datasource.dart';
import 'package:amiy_app/features/event_details/data/datasources/book_slot_remote_datasource.dart';
import 'package:amiy_app/features/event_details/data/repositories/attendees_repo.dart';
import 'package:amiy_app/features/event_details/data/repositories/book_slot_repository.dart';
import 'package:amiy_app/features/event_details/domain/repository/attendees_repo_impl.dart';
import 'package:amiy_app/features/event_details/domain/repository/book_attendance_impl.dart';
import 'package:amiy_app/features/event_details/presentation/bloc/event_details_bloc.dart';
import 'package:amiy_app/features/event_listing/data/datasources/event_listing_datasource.dart';
import 'package:amiy_app/features/event_listing/data/repository/event_listing_repository.dart';
import 'package:amiy_app/features/event_listing/domain/repository/event_listing_repo_impl.dart';
import 'package:amiy_app/features/event_listing/presentation/bloc/event_list_bloc.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  static final getit = GetIt.instance;
  static void injectDependencies() {
    initEventListDependencies();
    initEventDetailsDependencies();
  }

  static void initEventListDependencies() {
    getit.registerLazySingleton<ApiBaseHelper>(() => ApiBaseHelper());
    getit.registerLazySingleton<EventListDatasource>(
        () => EventListDatasource(getit<ApiBaseHelper>()));
    getit.registerLazySingleton<EventListRepository>(
        () => EventListRepoImpl(getit<EventListDatasource>()));
    getit.registerLazySingleton<EventListBloc>(
        () => EventListBloc(getit<EventListRepository>()));
  }

  static void initEventDetailsDependencies() { 
    getit.registerLazySingleton<AttendeeListRemoteDataSource>(
        () => AttendeeListRemoteDataSource(getit<ApiBaseHelper>()));
              getit.registerLazySingleton<BookSlotRemoteDatasource>(
        () => BookSlotRemoteDatasource(getit<ApiBaseHelper>()));
    getit.registerLazySingleton<AttendeesRepository>(
        () => AttendeesRepositoryImpl(getit<AttendeeListRemoteDataSource>()));
            getit.registerLazySingleton<BookSlotRepository>(
        () => BookSlotRepoImpl(getit<BookSlotRemoteDatasource>()));
    getit.registerLazySingleton<EventDetailsBloc>(
        () => EventDetailsBloc(getit<AttendeesRepository>(),getit<BookSlotRepository>(),));
  }
}
