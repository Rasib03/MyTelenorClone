import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_telenor/firebase_operations/authentication.dart';

part 'number_verification_event.dart';
part 'number_verification_state.dart';

class NumberVerificationBloc
    extends Bloc<NumberVerificationEvent, NumberVerificationState> {
  NumberVerificationBloc() : super(NumberVerificationInitial()) {
    // Handle sending OTP
    on<SendOTP>((event, emit) async {
      final String phoneNumber = '+92${event.number.substring(1)}';

      try {
        await sendOTP(
          phoneNumber,
          (String verificationId) {
            add(SendOTPSuccessEvent(verificationId: verificationId));
          },
        );
      } catch (e) {
        emit(SendOTPFailure(errorMessage: e.toString()));
      }
    });

    // Handle OTP sent successfully
    on<SendOTPSuccessEvent>((event, emit) {
      emit(SendOTPSuccess(verificationId: event.verificationId));
    });

    // Handle verifying OTP
    on<VerifyOTP>((event, emit) async {
      try {
        await verifyOTP(event.varificationId, event.smsCode);

        emit(VerifyOTPSuccess()); // OTP successfully verified
      } catch (e) {
        emit(
            VerifyOTPFailure(errorMessage: e.toString())); // Emit failure state
      }
    });
  }
}
