import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final _advancedDrawerController = AdvancedDrawerController();
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade400,
              Colors.blue.shade900,
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: true,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_2,
                  color: Colors.blue.shade400,
                  size: 80,
                ),
              ),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                },
                leading: const Icon(Icons.person_2),
                title: const Text('Home'),
              ),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                },
                leading: const Icon(Icons.person_2),
                title: const Text('Subscriptions'),
              ),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                },
                leading: const Icon(Icons.settings),
                title: const Text('Account Settings'),
              ),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                },
                leading: const Icon(Icons.edit_document),
                title: const Text('Lock a Complaint'),
              ),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                },
                leading: const Icon(Icons.contact_phone),
                title: const Text('Contact Us'),
              ),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                },
                leading: const Icon(Icons.logout_outlined),
                title: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            Container(
              width: mq.width,
              height: mq.height * .06,
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
              ),
            ),
            Container(
              width: mq.width,
              height: mq.height * .114,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade400,
                    Colors.blue.shade900,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: mq.width * .4),
                        child: const Text(
                          'History',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: mq.width * .27),
                        child: IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _handleMenuButtonPressed();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mq.height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selected = false;
                          });
                        },
                        child: Column(
                          children: [
                            const Text(
                              'LAST 7 DAYS',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: mq.width / 2,
                              height: 4.3,
                              color:
                                  _selected ? Colors.transparent : Colors.white,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selected = true;
                          });
                        },
                        child: Column(
                          children: [
                            const Text(
                              'LAST 30 DAYS',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: mq.width / 2,
                              height: 4.3,
                              color:
                                  _selected ? Colors.white : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Material(
              elevation: 2,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                width: mq.width * .93,
                height: mq.height * .1,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Evenly distribute space

                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 5.0), // Fixed padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: const Center(
                              child: Text(
                                '\$',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'BALANCE USED',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "4.4",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'PKR',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.red,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0), // Fixed padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.red,
                            size: 35,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              elevation: 2,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                width: mq.width * .93,
                height: mq.height * .1,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Evenly distribute space
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30.0), // Fixed padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'CALL',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "0.00",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'MINs',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.yellow,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0), // Fixed padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.yellow,
                            size: 35,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              elevation: 2,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                width: mq.width * .93,
                height: mq.height * .1,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Evenly distribute space
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30.0), // Fixed padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purple,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.sms,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'SMS',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'SMS',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.purple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0), // Fixed padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.purple,
                            size: 35,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              elevation: 2,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                width: mq.width * .93,
                height: mq.height * .1,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Evenly distribute space
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0), // Fixed padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.signal_cellular_alt_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'INTERNET',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "0.00",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'MBs',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.orange,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0), // Fixed padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.orange,
                            size: 35,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
