// ignore_for_file: prefer_function_declarations_over_variables, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// SEND OTP
Future<void> sendOTP(
    String phoneNumber, Function(String verificationId) onCodeSent) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final PhoneVerificationCompleted verificationCompleted =
      (PhoneAuthCredential phoneAuthCredential) async {
    // Automatically sign in when OTP is verified
    await _auth.signInWithCredential(phoneAuthCredential);
  };

  final PhoneVerificationFailed verificationFailed =
      (FirebaseAuthException exception) {
    print("Verification failed: ${exception.message}");
    // You can show a snackbar or dialog for the error here
  };

  final PhoneCodeSent codeSent = (String verificationId, int? resendToken) {
    // This is called when OTP is sent successfully
    onCodeSent(verificationId); // Pass verificationId to the caller
  };

  await _auth.verifyPhoneNumber(
    timeout: const Duration(minutes: 2),
    phoneNumber: phoneNumber, // Make sure to format it with the country code
    verificationCompleted: verificationCompleted,
    verificationFailed: verificationFailed,
    codeSent: codeSent,
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}

//  VERIFY OTP
Future<void> verifyOTP(String verificationId, String smsCode) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    // Create a credential using the verificationId and smsCode
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    // Sign in with the credential
    await _auth.signInWithCredential(credential);

    print("Successfully signed in!");
    // You can navigate the user to the home screen or another page here
  } catch (e) {
    print("Failed to verify OTP: $e");
    // Handle error (e.g., invalid OTP) by showing a message to the user
  }
}

// EXAMPLE
String verificationId = ''; // Store the verificationId globally or in the state


