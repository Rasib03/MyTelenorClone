import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telenor/constants/colors.dart';
import 'package:my_telenor/screens/home/bloc/homeview_bloc.dart';
import 'package:my_telenor/screens/home/data/courasol_data.dart';
import 'package:my_telenor/screens/home/start/start.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    context.read<HomeviewBloc>().add(TriggerChange(0));
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colors['primary'],
      body: Padding(
        padding: EdgeInsets.only(top: mq.height * .05),
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * .95,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: mq.width * .6, top: mq.height * .01),
                child: const Text(
                  "Powered by TELENOR",
                  style: TextStyle(fontSize: 11),
                ),
              ),
              BlocBuilder<HomeviewBloc, HomeviewState>(
                builder: (context, state) {
                  final dataa;
                  int index = 0;
                  if (state is ChangeTriggered) {
                    context
                        .read<HomeviewBloc>()
                        .add(TriggerChange(state.index));
                    dataa = data[state.index];
                    index = state.index + 1;
                  } else {
                    dataa = data[0];
                    index = 0 + 1;
                  }

                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: mq.height * .015),
                        child: Text(
                          dataa['heading']!,
                          style: TextStyle(
                              fontSize: 20,
                              color: colors['primary'],
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: mq.height * .01,
                            left: mq.width * .055,
                            right: mq.width * .055),
                        child: Text(
                          dataa['sub-heading']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-1, 0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                        child: Container(
                          key: ValueKey<int>(index),
                          margin: EdgeInsets.only(top: mq.height * .01),
                          width: mq.width * .7,
                          height: mq.height * .4,
                          color: Colors.transparent,
                          child: Image.asset(
                            dataa['image']!,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: mq.height * .02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: index == 1 ? 22 : 12,
                              height: 12,
                              decoration: BoxDecoration(
                                shape: index == 1
                                    ? BoxShape.rectangle
                                    : BoxShape.circle,
                                color: index == 1
                                    ? colors['primary']
                                    : Colors.grey,
                                borderRadius: index == 1
                                    ? BorderRadius.circular(15)
                                    : null,
                              ),
                            ),
                            SizedBox(
                              width: mq.width * .05,
                            ),
                            Container(
                              width: index == 2 ? 22 : 12,
                              height: 12,
                              decoration: BoxDecoration(
                                shape: index == 2
                                    ? BoxShape.rectangle
                                    : BoxShape.circle,
                                color: index == 2
                                    ? colors['primary']
                                    : Colors.grey,
                                borderRadius: index == 2
                                    ? BorderRadius.circular(15)
                                    : null,
                              ),
                            ),
                            SizedBox(
                              width: mq.width * .05,
                            ),
                            Container(
                              width: index == 3 ? 22 : 12,
                              height: 12,
                              decoration: BoxDecoration(
                                shape: index == 3
                                    ? BoxShape.rectangle
                                    : BoxShape.circle,
                                color: index == 3
                                    ? colors['primary']
                                    : Colors.grey,
                                borderRadius: index == 3
                                    ? BorderRadius.circular(15)
                                    : null,
                              ),
                            ),
                            SizedBox(
                              width: mq.width * .05,
                            ),
                            Container(
                              width: index == 4 ? 22 : 12,
                              height: 12,
                              decoration: BoxDecoration(
                                shape: index == 4
                                    ? BoxShape.rectangle
                                    : BoxShape.circle,
                                color: index == 4
                                    ? colors['primary']
                                    : Colors.grey,
                                borderRadius: index == 4
                                    ? BorderRadius.circular(15)
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Start(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: mq.height * .02),
                  width: mq.width * .85,
                  height: mq.height * .055,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: colors['primary'],
                  ),
                  child: const Center(
                    child: Text(
                      'S T A R T',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: mq.height * .03),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Start(),
                    ),
                  ),
                  child: Text(
                    'Sign in with Another Number',
                    style: TextStyle(
                      color: colors['primary'],
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: mq.height * .02,
                    left: mq.width * .07,
                    right: mq.width * .07),
                child: const Row(
                  children: [
                    Text(
                      '----------------------------------- ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      ' ----------------------------------',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: mq.height * .03,
                    left: mq.width * .07,
                    right: mq.width * .07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: mq.width * .4,
                      height: mq.height * .05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          width: 2,
                          color: colors['primary']!,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Get Telenor SIM',
                          style: TextStyle(
                            color: colors['primary'],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: mq.width * .4,
                      height: mq.height * .05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Use as Guest',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: mq.height * .046),
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
  }
}
