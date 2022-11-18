import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/user/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'firebase_options.dart';
import 'trips_app_cupertino.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        bloc: UserBloc(),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const TripsAppCupertino()
        ),
    );
  }
}

