import 'package:authentication/onboarding/onboarding_screen.dart';
import 'package:authentication/provider/aircraft_provider.dart';
import 'package:authentication/provider/reservation_provider.dart';
import 'package:authentication/screens/aircraft_list.dart';
import 'package:authentication/screens/reservation_list.dart';
import 'package:authentication/sharedprefrences/SharedPrefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AircraftProvider>(
          create: (context) => AircraftProvider(),
        ),
        ChangeNotifierProvider<ReservationProvider>(
          create: (context) => ReservationProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: OnBoardingScreen(),
      ),
    );
  }
}
