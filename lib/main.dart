import 'package:amiy_app/core/utils/di.dart';
import 'package:amiy_app/core/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  /// Inject dependencies and handle potential errors
  ServiceLocator.injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amiy App',
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
