import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telenor/blocs/numberVerification_bloc/bloc/number_verification_bloc.dart';
import 'package:my_telenor/constants/colors.dart';

import 'package:my_telenor/screens/navbar.dart';

class Verification extends StatefulWidget {
  final String number;
  final String verificationId;
  const Verification({
    super.key,
    required this.number,
    required this.verificationId,
  });

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  late final TextEditingController _controller;

  bool _isComplete = false;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colors['primary'],
      body: BlocConsumer<NumberVerificationBloc, NumberVerificationState>(
        listener: (context, state) {
          if (state is VerifyOTPSuccess) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BottomNavBar(
                  number: widget.number,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is VerifyOTPFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('OTP verification failure'),
              ),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: mq.height * .05),
              child: Container(
                width: mq.width,
                height: MediaQuery.of(context).size.height * .95,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: mq.width,
                      height: mq.height * .06,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade800,
                            Colors.blue.shade300,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "My Telenor",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: mq.height * .04),
                      child: const Text(
                        'We sent verification to',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: mq.height * .01),
                      child: Text(
                        widget.number.toString(),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: mq.height * .02, left: mq.height * .17),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Change number',
                              style: TextStyle(
                                color: colors['primary'],
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: mq.width * .01,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: colors['primary'],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: mq.width * .73, top: mq.height * .02),
                      child: const Text(
                        'Enter OTP',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: mq.width * .02, top: mq.height * .01),
                      child: Container(
                        width: mq.width * .88,
                        height: mq.height * .05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: mq.width * .04,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .7,
                              height: MediaQuery.of(context).size.height * .05,
                              child: TextFormField(
                                controller: _controller,
                                keyboardType: TextInputType.number,
                                autofocus: true,
                                decoration: InputDecoration(
                                  hintText: 'O T P',
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: _isComplete
                                        ? BorderSide.none
                                        : BorderSide.none,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(
                                      6), // Limit input to 11 digits
                                  FilteringTextInputFormatter
                                      .digitsOnly, // Allow only digits
                                ],
                                onChanged: (value) {
                                  if (value.length == 6) {
                                    FocusScope.of(context)
                                        .unfocus(); // Dismiss the keyboard
                                    setState(() {
                                      _isComplete =
                                          true; // Mark the form as complete
                                    });
                                  } else {
                                    setState(() {
                                      _isComplete =
                                          false; // Reset if the input is less than 11 digits
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: mq.width * .5, top: mq.height * .008),
                      child: Row(
                        children: [
                          Text(
                            "Didn't get a code? ",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            " Resend  ",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Colors.grey.shade700,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<NumberVerificationBloc>().add(
                              VerifyOTP(
                                smsCode: _controller.text,
                                varificationId: widget.verificationId,
                              ),
                            );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          top: mq.height * .05,
                          right: mq.width * .02,
                        ),
                        width: mq.width * .88,
                        height: mq.height * .05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: colors['primary'],
                        ),
                        child: const Center(
                          child: Text(
                            'Verify Code',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: mq.height * .04, left: mq.height * .025),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 14,
                            color: colors['primary'],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Back',
                              style: TextStyle(
                                color: colors['primary'],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: mq.height * .395),
                      width: mq.width,
                      height: mq.height * .06,
                      color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'By proceeding you agree to our',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Terms of Service',
                                style: TextStyle(
                                  color: colors['primary'],
                                  fontSize: 14,
                                ),
                              ),
                              const Text(
                                ' and ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  color: colors['primary'],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
