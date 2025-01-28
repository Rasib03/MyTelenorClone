part of 'number_verification_bloc.dart';

@immutable
sealed class NumberVerificationState {}

final class NumberVerificationInitial extends NumberVerificationState {}

class OTPSent extends NumberVerificationState {
  final String verificationId;
  OTPSent({required this.verificationId});
}

class SendOTPSuccess extends NumberVerificationState {
  final String verificationId;
  SendOTPSuccess({required this.verificationId});
}

class SendOTPFailure extends NumberVerificationState {
  late final String errorMessage;

  SendOTPFailure({required String errorMessage});
}

class VerifyOTPSuccess extends NumberVerificationState {}

class VerifyOTPFailure extends NumberVerificationState {
  late final String errorMessage;

  VerifyOTPFailure({required String errorMessage});
}

class LoggedOut extends NumberVerificationState {}
