import 'package:authentication/screens/aircraft_list.dart';
import 'package:authentication/screens/reservation_list.dart';
import 'package:authentication/screens/schedules_screen.dart';
import 'package:flutter/material.dart';
import '../screens/dashboard.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List menuList = [
    {
      'name': 'Aircraft',
    },
    {
      'name': 'Document',
    },
    {
      'name': 'Scheduler',
    },
    {
      'name': 'Reservation',
    },
    {
      'name': 'Logbook',
    },
    {
      'name': 'Weather',
    },
    {
      'name': 'Maps',
    },
    {
      'name': 'Tracker',
    },
  ];

  final List<Color> iconColors = [
    const Color(0xFFCCCCCC),
    const Color(0xFFCCCCCC),
    const Color(0xFFCCCCCC),
    const Color(0xFFCCCCCC),
    const Color(0xFFCCCCCC),
  ];

  @override
  void initState() {
    _onItemTapped(0);
    super.initState();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    ReservationList(),
    AirCraftList(),
    SchedulesScreen(),
    Text(
      'Scheduled',
      style: optionStyle,
    ),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      if (_selectedIndex == -1) {
        // Set the selected icon color to yellow for the first time
        iconColors[index] = const Color(0xFF1E374F);
      } else {
        _selectedIndex = index;
        for (int i = 0; i < iconColors.length; i++) {
          iconColors[i] = const Color(0xFFCCCCCC);
        }
        // Set the selected icon color to yellow
        iconColors[index] = const Color(0xFF1E374F);
      }
    });
    if (index == _widgetOptions.length - 1) {
      _scaffoldKey.currentState?.openEndDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset('assets/images/ic_home.png',
                  color: iconColors[0]), // Set color here
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset('assets/images/ic_voucher.png',
                  color: iconColors[1]), // Set color here
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset('assets/images/ic_plain.png',
                  color: iconColors[2]), // Set color here
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset('assets/images/ic_calendar.png',
                  color: iconColors[3]), // Set color here
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: GestureDetector(
                child: Image.asset('assets/images/ic_menu.png',
                    color: iconColors[4]),
              ), // Set color here
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF1E374F),
        onTap: _onItemTapped,
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 100,
              color: const Color(0xFF1E374F),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.2,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: menuList.length,
                      itemBuilder: (ctx, i) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                    child: Image.asset(
                                      'assets/images/ic_plain.png',
                                      scale: 4,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${menuList[i]['name']}',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        );
                      },
                    ),
                    const Spacer(),
                    const Text(
                      'Dev Version: 1.2.4 (50)',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
