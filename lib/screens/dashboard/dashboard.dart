import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
    );
  }
}
