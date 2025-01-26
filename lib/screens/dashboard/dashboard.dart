import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:my_telenor/payment_method/payments.dart';

class Dashboard extends StatefulWidget {
  final String phoneNumber;
  const Dashboard({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool select = false;
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: mq.width,
                    height: mq.height * .275,
                    child: Stack(
                      children: [
                        Container(
                          width: mq.width,
                          height: mq.height * .17,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade800,
                                Colors.blue.shade300,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.elliptical(200, 20),
                              bottomRight: Radius.elliptical(200, 20),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: mq.height * .055,
                                  left: mq.width * .05,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Text(
                                          'MUHAMMAD RASIB',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 12,
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: mq.width * .28,
                                      height: mq.height * .02,
                                      decoration: BoxDecoration(
                                        color: Colors.white54.withOpacity(.4),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            widget.phoneNumber,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.send_to_mobile,
                                            color: Colors.white,
                                            size: 12,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: mq.width * .32),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Symbols.search,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          _handleMenuButtonPressed();
                                        },
                                        icon: const Icon(
                                          Icons.menu,
                                          color: Colors.white,
                                          size: 22,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: mq.width * .04,
                          bottom: 0,
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: mq.width * .92,
                              height: mq.height * .15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0, top: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Mobile Balance',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              'Rs. 49.13',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              'Expires on 29th May, 2025',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const Row(
                                              children: [
                                                Icon(
                                                  AntDesign.export_outline,
                                                  color: Colors.blue,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Telenor Star',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(
                                                  Icons.arrow_right_alt_rounded,
                                                  color: Colors.blue,
                                                  size: 14,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Icon(
                                              AntDesign.gift_fill,
                                              color: Colors.yellow.shade300,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    width: mq.width * .85,
                                    color: Colors.grey.shade200,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Row(
                                          children: [
                                            Icon(
                                              AntDesign.sync_outline,
                                              size: 14,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text('Balance Loan'),
                                          ],
                                        ),
                                        Container(
                                          height: mq.height * .035,
                                          width: 1,
                                          color: Colors.grey.shade200,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(
                                              AntDesign.tablet_outline,
                                              size: 14,
                                              color: Colors.blue,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Recharge',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: mq.height * .01),
                  Padding(
                    padding: EdgeInsets.only(
                      left: mq.width * .05,
                      right: mq.width * .05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Usage Remaining',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          'Last Updated 22/12/2024 15:50',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: mq.width,
                            height: mq.height * .18,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Icon(
                                              AntDesign.global_outline,
                                              color: Colors.red,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              'Data',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          ],
                                        ),
                                        const Text(
                                          '0',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Text(
                                          'MBs Left',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: mq.width * .15,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: Colors.red.shade100,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: mq.height * .06,
                                      width: 1,
                                      color: Colors.grey.shade200,
                                    ),
                                    Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              color: Colors.orange,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              'Telenor Mins',
                                              style: TextStyle(
                                                  color: Colors.orange),
                                            )
                                          ],
                                        ),
                                        const Text(
                                          '0',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Text(
                                          'Mins Left',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: mq.width * .15,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: Colors.orange.shade100,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: mq.height * .06,
                                      width: 1,
                                      color: Colors.grey.shade200,
                                    ),
                                    Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              color: Colors.purple,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              'All Net.Mins',
                                              style: TextStyle(
                                                  color: Colors.purple),
                                            )
                                          ],
                                        ),
                                        const Text(
                                          '0',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Text(
                                          'Mins Left',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: mq.width * .15,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: Colors.purple.shade100,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 1,
                                  width: mq.width,
                                  color: Colors.grey.shade200,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      AntDesign.gift_fill,
                                      color: Colors.blue,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      'Get offer now',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Icon(
                                      Icons.navigate_next_outlined,
                                      color: Colors.blue,
                                      size: 18,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: mq.width * .05,
                      right: mq.width * .05,
                      top: 12,
                    ),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: mq.width,
                        height: mq.height * .3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Column(
                                    children: [
                                      Icon(
                                        AntDesign.credit_card_outline,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        'Create',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'Bundle',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 1,
                                    height: 50,
                                    color: Colors.grey.shade200,
                                  ),
                                  const Column(
                                    children: [
                                      Icon(
                                        Icons.sim_card,
                                        color: Colors.yellowAccent,
                                      ),
                                      Text(
                                        'Purchase',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'SIM',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 1,
                                    height: 50,
                                    color: Colors.grey.shade200,
                                  ),
                                  const Column(
                                    children: [
                                      Icon(
                                        Icons.satellite_outlined,
                                        color: Colors.blueGrey,
                                      ),
                                      Text(
                                        'Latest',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'Offers',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 1,
                                    height: 50,
                                    color: Colors.grey.shade200,
                                  ),
                                  const Column(
                                    children: [
                                      Icon(
                                        Icons.card_giftcard_outlined,
                                        color: Colors.cyan,
                                      ),
                                      Text(
                                        'Free MBs',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Column(
                                    children: [
                                      Icon(
                                        Icons.headphones,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        'Lock a',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'Complaint',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 1,
                                    height: 50,
                                    color: Colors.grey.shade200,
                                  ),
                                  const Column(
                                    children: [
                                      Icon(
                                        AntDesign.global_outline,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        'Packages',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 1,
                                    height: 50,
                                    color: Colors.grey.shade200,
                                  ),
                                  const Column(
                                    children: [
                                      Icon(
                                        AntDesign.gift_twotone,
                                        color: Colors.amber,
                                        size: 30,
                                      ),
                                      Text(
                                        'Gift a Bundle',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 1,
                                    height: 50,
                                    color: Colors.grey.shade200,
                                  ),
                                  const Column(
                                    children: [
                                      Icon(
                                        AntDesign.laptop_outline,
                                        color: Colors.green,
                                      ),
                                      Text(
                                        'Digital',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'Services',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: mq.width * .8,
                              height: 1,
                              color: Colors.grey.shade200,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'See More',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Transform.rotate(
                                  angle: pi / .285,
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: Colors.blue,
                                    size: 11,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: mq.width * .05,
                      right: mq.width * .05,
                      top: 12,
                    ),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: mq.width,
                        height: mq.height * .26,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: mq.width * .3,
                              height: mq.height * .02,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: Colors.blue.shade900,
                              ),
                              child: const Center(
                                child: Text(
                                  'FREE PANDA PRO',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: mq.height * .03,
                              left: mq.width * .05,
                              child: const Text(
                                'Monthly Prime',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Positioned(
                              top: mq.height * .055,
                              left: mq.width * .047,
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: Colors.yellow,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Validity 30 Days',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: mq.height * .03,
                              left: mq.width * .46,
                              child: Row(
                                children: [
                                  const Text(
                                    'Rs. 1740 (',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/logo/easypaisaLogo.png',
                                    width: 16,
                                    height: 16,
                                  ),
                                  const Text(
                                    ' Rs. 2000)',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: mq.height * .085,
                              left: mq.width * .14,
                              child: const Column(
                                children: [
                                  Text(
                                    '300 GBs',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    'Internet',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: mq.height * .13,
                              left: mq.width * .09,
                              child: const Column(
                                children: [
                                  Text(
                                    'Unlimited',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    'Telenor Minutes+',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: mq.height * .085,
                              left: mq.width * .34,
                              child: const Column(
                                children: [
                                  Text(
                                    '50+',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    'INTL. Minutes',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: mq.height * .13,
                              left: mq.width * .39,
                              child: const Column(
                                children: [
                                  Text(
                                    '20000',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    'SMS',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: mq.height * .085,
                              left: mq.width * .6,
                              child: const Column(
                                children: [
                                  Text(
                                    '1500',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    'Other Net. Mins',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: mq.height * .185,
                              left: mq.width * .05,
                              child: Container(
                                width: mq.width * .8,
                                height: 1,
                                color: Colors.grey.shade200,
                              ),
                            ),
                            Positioned(
                              top: mq.height * .19,
                              left: mq.width * .05,
                              child: const Text(
                                'Free Funds Pro Subscription',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 8,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: mq.height * .21,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: mq.width * .3,
                                    height: mq.height * .04,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            'assets/logo/easypaisaLogo.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                          const Text(
                                            'easypaisa 1-Tap',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print("object");
                                      Payments().makePayment();
                                      print('after making payment');
                                    },
                                    child: Container(
                                      width: mq.width * .2,
                                      height: mq.height * .04,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: mq.width * .02,
                                            ),
                                            Image.asset(
                                              'assets/logo/visaLogo.png',
                                              width: 20,
                                              height: 20,
                                            ),
                                            SizedBox(width: mq.width * .023),
                                            Image.asset(
                                              'assets/logo/easypaisaLogo.png',
                                              width: 20,
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: mq.width * .2,
                                    height: mq.height * .04,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Activate',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: mq.width * .05,
                      right: mq.width * .05,
                      top: 20,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: mq.width * .95,
                          height: mq.height * .05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    select = false;
                                  });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Top Offers',
                                      style: TextStyle(
                                        color: select == false
                                            ? Colors.blue.shade600
                                            : Colors.grey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.ease,
                                      margin: const EdgeInsets.only(
                                        top: 6,
                                      ),
                                      height: 3,
                                      width: mq.width * .4,
                                      color: select == false
                                          ? Colors.blue.shade900
                                          : Colors.transparent,
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    select = true;
                                  });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Deals',
                                      style: TextStyle(
                                        color: select == true
                                            ? Colors.blue.shade600
                                            : Colors.grey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.ease,
                                      margin: const EdgeInsets.only(
                                        top: 6,
                                      ),
                                      height: 3,
                                      width: mq.width * .4,
                                      color: select == true
                                          ? Colors.blue.shade900
                                          : Colors.transparent,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (select == false)
                    Padding(
                      padding: EdgeInsets.only(
                        left: mq.width * .05,
                        right: mq.width * .05,
                        top: 12,
                      ),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: mq.width,
                          height: mq.height * .26,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: mq.width * .3,
                                height: mq.height * .02,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Colors.blue.shade900,
                                ),
                                child: const Center(
                                  child: Text(
                                    'FREE PANDA PRO',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: mq.height * .03,
                                left: mq.width * .05,
                                child: const Text(
                                  'Monthly Prime',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: mq.height * .055,
                                left: mq.width * .047,
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: Colors.yellow,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Validity 30 Days',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: mq.height * .03,
                                left: mq.width * .46,
                                child: Row(
                                  children: [
                                    const Text(
                                      'Rs. 1740 (',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/logo/easypaisaLogo.png',
                                      width: 16,
                                      height: 16,
                                    ),
                                    const Text(
                                      ' Rs. 2000)',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: mq.height * .085,
                                left: mq.width * .14,
                                child: const Column(
                                  children: [
                                    Text(
                                      '300 GBs',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Text(
                                      'Internet',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: mq.height * .13,
                                left: mq.width * .09,
                                child: const Column(
                                  children: [
                                    Text(
                                      'Unlimited',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Text(
                                      'Telenor Minutes+',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: mq.height * .085,
                                left: mq.width * .34,
                                child: const Column(
                                  children: [
                                    Text(
                                      '50+',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Text(
                                      'INTL. Minutes',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: mq.height * .13,
                                left: mq.width * .39,
                                child: const Column(
                                  children: [
                                    Text(
                                      '20000',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Text(
                                      'SMS',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: mq.height * .085,
                                left: mq.width * .6,
                                child: const Column(
                                  children: [
                                    Text(
                                      '1500',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Text(
                                      'Other Net. Mins',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: mq.height * .185,
                                left: mq.width * .05,
                                child: Container(
                                  width: mq.width * .8,
                                  height: 1,
                                  color: Colors.grey.shade200,
                                ),
                              ),
                              Positioned(
                                top: mq.height * .19,
                                left: mq.width * .05,
                                child: const Text(
                                  'Free Funds Pro Subscription',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: mq.height * .21,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: mq.width * .3,
                                      height: mq.height * .04,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                              'assets/logo/easypaisaLogo.png',
                                              width: 20,
                                              height: 20,
                                            ),
                                            const Text(
                                              'easypaisa 1-Tap',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: mq.width * .2,
                                      height: mq.height * .04,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: mq.width * .02,
                                            ),
                                            Image.asset(
                                              'assets/logo/visaLogo.png',
                                              width: 20,
                                              height: 20,
                                            ),
                                            SizedBox(width: mq.width * .023),
                                            Image.asset(
                                              'assets/logo/easypaisaLogo.png',
                                              width: 20,
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: mq.width * .2,
                                      height: mq.height * .04,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Activate',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: EdgeInsets.only(
                        left: mq.width * .05,
                        right: mq.width * .05,
                        top: 12,
                      ),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: mq.width,
                          height: mq.height * .26,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_off_outlined,
                                size: 40,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: mq.width * .05,
                      right: mq.width * .05,
                      top: 12,
                    ),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: mq.width,
                        height: mq.height * .08,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 15),
                            Icon(
                              Icons.headset_mic_outlined,
                              color: Colors.orange.shade400,
                              size: 27,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Help & Customer',
                                  style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Support',
                                  style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: mq.width * .1),
                            Container(
                              width: mq.width * .25,
                              height: mq.height * .045,
                              decoration: BoxDecoration(
                                color:
                                    Colors.lightBlue.shade100.withOpacity(.4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Get Help',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue.shade500,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Transform.flip(
                                    flipX: true,
                                    child: Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      color: Colors.blue.shade500,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
            Positioned(
              top: mq.height * .76,
              left: mq.width * .71,
              child: Container(
                width: mq.width * .29,
                height: mq.height * .065,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                  color: Colors.green.shade800,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Icon(
                        Icons.light_mode_outlined,
                        color: Colors.yellow.shade500,
                        size: 34,
                      ),
                    ),
                    const Positioned(
                      left: 55,
                      child: Text(
                        'PLAY',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 72,
                      top: 20,
                      child: Text(
                        '&',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 60,
                      top: 35,
                      child: Text(
                        'WIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
