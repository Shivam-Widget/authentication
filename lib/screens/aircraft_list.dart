import 'package:authentication/provider/aircraft_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../sharedprefrences/SharedPrefs.dart';

class AirCraftList extends StatefulWidget {
  const AirCraftList({super.key});

  @override
  State<AirCraftList> createState() => _AirCraftListState();
}

class _AirCraftListState extends State<AirCraftList> {
  TextEditingController searchController = TextEditingController();
  static String? accessToken = SharedPreferencesHelper.accessToken;



  @override
  void initState() {
    super.initState();
    Provider.of<AircraftProvider>(context, listen: false)
        .getAircraftPostData(context);
  }

  List airCraftCatList = [
    {'name': 'ALL'},
    {'name': 'DOUBLE ENGINE AIRCRAFTS'},
    {'name': 'CHOPERS'},
    {'name': 'MULTI ENGINE'},
    {'name': 'CIRRUS SR22'},
    {'name': 'AIRPLANES'},
    {'name': 'AIRLINES'},
    {'name': 'SINGLE PISTON'},
    {'name': 'DEMOGROUP'},
    {'name': 'AIRGROUPDEMO'},
    {'name': 'FEB TESTGROUP'},
  ];

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<AircraftProvider>(context);
    debugPrint("----Token----> $accessToken");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF1E374F),
        title: const Text(
          'AirCraft',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Color(0xFF1E374F),
        ),
      ),
      body: postModel.loading
          ? Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 3,
                    strokeCap: StrokeCap.butt,
                  ),
                  Image.asset(
                    'assets/images/upflyte_launcher.png',
                    scale: 2,
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: Colors.grey.shade500,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: TextField(
                        cursorColor: Colors.cyanAccent,
                        style: TextStyle(color: Colors.grey.shade200),
                        controller: searchController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Search',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade400,
                          ),
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const ScrollPhysics(),
                            itemCount: airCraftCatList.length,
                            itemBuilder: (ctx, i) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey, width: 2),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${airCraftCatList[i]['name']}',
                                          style: TextStyle(
                                              color: Colors.grey.shade500),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount:
                                postModel.aircraftListModel.data?.length ?? 0,
                            itemBuilder: (BuildContext ctx, int i) {
                              return Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(15),
                                        height: 190,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: CachedNetworkImage(
                                            imageUrl: postModel
                                                    .aircraftListModel
                                                    .data?[i]
                                                    .imagePath ?? '',
                                            placeholder: (context, url) =>
                                                Image.asset(
                                                    'assets/images/aircratimages/ic_aircraftplaceholder.png', fit: BoxFit.cover,),
                                            errorWidget: (context, url, error) => Image.asset(
                                              'assets/images/aircratimages/ic_aircraftplaceholder.png', fit: BoxFit.cover,),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        right: 25,
                                        child: Image.asset(
                                          'assets/images/aircratimages/Icon.png',
                                          scale: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        postModel.aircraftListModel.data?[i]
                                                .tailNo ??
                                            '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        height: 25,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Icon(Icons.add,
                                            color: Colors.blue, size: 15),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            },
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
