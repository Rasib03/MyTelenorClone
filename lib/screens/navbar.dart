import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_telenor/screens/account/account.dart';
import 'package:my_telenor/screens/dashboard/dashboard.dart';
import 'package:my_telenor/screens/explore/explore.dart';
import 'package:my_telenor/screens/offers/offers.dart';
import 'package:my_telenor/screens/history/history.dart';

class BottomNavBar extends StatefulWidget {
  final String number;
  const BottomNavBar({super.key, required this.number});

  @override
  State<BottomNavBar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  Widget? selectWidget() {
    switch (_selectedIndex) {
      case 0:
        return Dashboard(
          phoneNumber: widget.number,
        );

      case 1:
        return const Account();

      case 2:
        return const Offers();

      case 3:
        return const History();

      case 4:
        return const Explore();

      default:
        return const Scaffold(
          backgroundColor: Colors.white,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      body: selectWidget(),
      backgroundColor: Colors.white.withOpacity(.98),
      bottomNavigationBar: Container(
        width: mq.width,
        height: mq.height * .07,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
          ),
          border: Border(
            left: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
            right: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
            top: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          color: Colors.transparent,
        ),
        child: GNav(
          rippleColor: Colors.green[300]!,
          hoverColor: Colors.pink[100]!,
          gap: 8,
          activeColor: Colors.black,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.blue[100]!,
          color: Colors.black,
          tabs: const [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Account',
            ),
            GButton(
              icon: LineIcons.gift,
              text: 'Offers',
            ),
            GButton(
              icon: LineIcons.history,
              text: 'History',
            ),
            GButton(
              icon: LineIcons.envelopeOpenText,
              text: 'Explore',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
