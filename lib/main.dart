import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telenor/blocs/numberVerification_bloc/bloc/number_verification_bloc.dart';
import 'package:my_telenor/firebase_options.dart';
import 'package:my_telenor/blocs/home_bloc/homeview_bloc.dart';
import 'package:my_telenor/screens/home/home.dart';

void main() async {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeviewBloc>(
          create: (context) => HomeviewBloc(),
        ),
        BlocProvider<NumberVerificationBloc>(
          create: (context) => NumberVerificationBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
