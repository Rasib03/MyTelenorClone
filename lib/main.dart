import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:my_telenor/blocs/numberVerification_bloc/bloc/number_verification_bloc.dart';
import 'package:my_telenor/firebase_operations/firebase_cloud_messaging.dart';
import 'package:my_telenor/firebase_options.dart';
import 'package:my_telenor/blocs/home_bloc/homeview_bloc.dart';
import 'package:my_telenor/screens/home/home.dart';
import 'package:my_telenor/screens/navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FCM().initNotifications();
  Stripe.publishableKey =
      "pk_test_51QkpamFhS7fUusM3PqgIfSO2FFqtdxZZJCupJcnbE8lGEF8qxKO59irBzJkWleM916HoJcH8FL3iz21Z7ynHpss900kQJ4l2S8";
  // await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn() =>
        FirebaseAuth.instance.currentUser == null ? false : true;

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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: isUserLoggedIn()
            ? const BottomNavBar(
                number: '03339637570',
              )
            : const MyHomePage(),
      ),
    );
  }
}
