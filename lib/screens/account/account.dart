import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool _selected = false;

  void _handleSwipe(DragEndDetails details) {
    if (details.primaryVelocity! > 0) {
      // Swipe to the right
      setState(() {
        _selected = false;
      });
    } else if (details.primaryVelocity! < 0) {
      // Swipe to the left
      setState(() {
        _selected = true;
      });
    }
  }

  final _advancedDrawerController = AdvancedDrawerController();

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
      openScale: 1.0,
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
                  )),
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
        body: GestureDetector(
          onHorizontalDragEnd: _handleSwipe, // Detect swipe gestures
          child: Column(
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
                          padding: EdgeInsets.only(left: mq.width * .34),
                          child: const Text(
                            'My Account',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: mq.width * .2),
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
                                'USAGE',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                width: mq.width / 2,
                                height: 4.3,
                                color: _selected
                                    ? Colors.transparent
                                    : Colors.white,
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
                                'SUBSCRIPTION',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                width: mq.width / 2,
                                height: 4.3,
                                color: _selected
                                    ? Colors.white
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: mq.height * .35),
                child: const Text(
                  'You do not have any active subscriptions.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
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
