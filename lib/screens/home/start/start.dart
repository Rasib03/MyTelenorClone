import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_telenor/constants/colors.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  bool _isComplete = false;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colors['primary'],
      body: SingleChildScrollView(
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
                    'Sign in with your mobile number',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: mq.width * .67, top: mq.height * .02),
                  child: const Text(
                    'Mobile Number',
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
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: '03XXXXXXXXX',
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
                                  11), // Limit input to 11 digits
                              FilteringTextInputFormatter
                                  .digitsOnly, // Allow only digits
                            ],
                            onChanged: (value) {
                              if (value.length == 11) {
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
                Container(
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
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
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
                  margin: EdgeInsets.only(top: mq.height * .5),
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
      ),
    );
  }
}
