import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan_flutter_rafly/providers/DashboardProvider.dart';
import 'package:latihan_flutter_rafly/BaseTheme.dart';
import 'package:latihan_flutter_rafly/views/dashboard/home/home_screen.dart';
import 'package:latihan_flutter_rafly/views/dashboard/notification_screen.dart';
import 'package:latihan_flutter_rafly/views/dashboard/profile_screen.dart';
import 'package:provider/provider.dart';

import '../../helpers/BaseHelper.dart';
import '../../widgets/MenuIconWidget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentPageIndex = 0;

  Widget _saldoSection() {
    return Container(
      width: double.infinity,
      height: 90,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: Colors.white,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: 150,
        ),
        Image.asset(
          "assets/images/e-collector.png",
          width: 100,
          height: 100,
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    DashboardProvider stateDashboard = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: currentPageIndex,
              children: [
                HomeScreen(context),
                NotificationScreen(context),
                ProfileScreen(context),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            selectedIcon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
