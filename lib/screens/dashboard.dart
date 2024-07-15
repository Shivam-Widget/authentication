import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List infoList = [
    {
      'title': 'Total Time',
      'color': Colors.yellow.withOpacity(0.5),
      'num': '2699.915',
    },
    {
      'title': 'Total Landing',
      'color': Colors.purple.withOpacity(0.5),
      'num': '3605.0',
    },
    {
      'title': 'Total VFR/IFR',
      'color': Colors.yellow.withOpacity(0.5),
      'num': '351.0/37.0',
    },
    {
      'title': 'Instruction',
      'color': Colors.purple.withOpacity(0.5),
      'num': '6740.9099',
    },
    {
      'title': 'Distance',
      'color': Colors.yellow.withOpacity(0.5),
      'num': '67993.45',
    },
    {
      'title': 'Ground Training',
      'color': Colors.purple.withOpacity(0.5),
      'num': '21757.866',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E374F),
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey.withOpacity(0.5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/img.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: const Text(
          'Hi, Sam!',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Stack(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black54),
                  child: const Icon(
                    Icons.notifications_none,
                    color: Colors.white70,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: const Center(
                      child: Text(
                        '22',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: infoList.length,
                        itemBuilder: (ctx, i) {
                          return Row(
                            children: [
                              Container(
                                height: 80,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                        ),
                                        color: infoList[i]['color'],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      '${infoList[i]['title']}',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      '${infoList[i]['num']}',
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text(
                    'Upcoming reservation',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 152,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Charter Flight',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Text(
                                'N311CM',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Center(
                              child: Text('Scheduled',
                                  style: TextStyle(color: Colors.blue)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            'HFC',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/aircratimages/ic_aircraftline.png',
                            scale: 3,
                          ),
                          const Spacer(),
                          const Text(
                            'FKK',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Aug 13, 2025',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Text(
                                '03:18 PM',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text(
                                'Aug 13, 2025',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Text(
                                '07:01 PM',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text(
                    'Documents',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (ctx, i) {
                          return Row(
                            children: [
                              Container(
                                height: 80,
                                width: 360,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.picture_as_pdf_outlined,
                                        color: Colors.lightBlue,
                                        size: 65,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'ICON A5 POH Revision 3',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'N/A',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            'Jackson Backer',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text(
                    'Recent Flights',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      height: 155,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (ctx, i) {
                          return Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                height: 152,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Charter Flight',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                'N311CM',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 30,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.purple
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'CheckedIn',
                                                style: TextStyle(
                                                    color: Colors.purple),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const Text(
                                            'HFC',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Image.asset(
                                            'assets/images/aircratimages/ic_aircraftline.png',
                                            scale: 3,
                                          ),
                                          const Spacer(),
                                          const Text(
                                            'FKK',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Aug 13, 2025',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                              ),
                                              Text(
                                                '03:18 PM',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            children: [
                                              Text(
                                                'Aug 13, 2025',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                              ),
                                              Text(
                                                '07:01 PM',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text(
                    'Logbook',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.info_outline,
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
