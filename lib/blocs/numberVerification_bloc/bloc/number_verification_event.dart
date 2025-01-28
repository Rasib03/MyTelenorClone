part of 'number_verification_bloc.dart';

@immutable
sealed class NumberVerificationEvent {}

class SendOTP extends NumberVerificationEvent {
  final String number;
  SendOTP({required this.number});
}

class SendOTPSuccessEvent extends NumberVerificationEvent {
  final String verificationId;
  SendOTPSuccessEvent({required this.verificationId});
}

class VerifyOTP extends NumberVerificationEvent {
  final String varificationId;
  final String smsCode;

  VerifyOTP({required this.smsCode, required this.varificationId});
}

class Logout extends NumberVerificationEvent {
  Logout();
}
