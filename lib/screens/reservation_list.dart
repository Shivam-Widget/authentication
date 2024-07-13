import 'package:authentication/provider/reservation_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReservationList extends StatefulWidget {
  const ReservationList({super.key});

  @override
  State<ReservationList> createState() => _ReservationListState();
}

class _ReservationListState extends State<ReservationList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final reservationProvider =
        Provider.of<ReservationProvider>(context, listen: false);
    reservationProvider.getReservationPostData(context);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (reservationProvider.hasMore && !reservationProvider.loading) {
          reservationProvider.getReservationPostData(context, loadMore: true);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final postModel = Provider.of<ReservationProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF1E374F),
        title: const Text(
          'Reservations',
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
        automaticallyImplyLeading: false,
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
                )
              ],
            ))
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
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade200,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            controller: _scrollController,
                            itemCount: postModel.reservation.data?.length ?? 0,
                            itemBuilder: (BuildContext ctx, int i) {
                              DateTime startDateTime = DateTime.parse(
                                  postModel.reservation.data?[i].startDateTime ?? '');
                              String formattedStartDate =
                                  DateFormat('MMM dd, yyyy').format(startDateTime);
                              String formattedStartTime =
                                  DateFormat.jm().format(startDateTime);
                              DateTime endDateTime = DateTime.parse(
                                  postModel.reservation.data?[i].endDateTime ?? '');
                              String formattedEndDate =
                                  DateFormat('MMM dd, yyyy').format(endDateTime);
                              String formattedEndTime =
                                  DateFormat.jm().format(endDateTime);
                              String flightStatus =
                                  postModel.reservation.data?[i].flightStatus ?? '';

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 150,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  postModel.reservation.data?[i]
                                                          .scheduleActivityName ??
                                                      '',
                                                  style: const TextStyle(
                                                      color: Colors.grey, fontSize: 12),
                                                ),
                                                Text(
                                                  postModel.reservation.data?[i]
                                                          .tailNo ??
                                                      '',
                                                  style: const TextStyle(
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
                                                color:
                                                    getFlightStatusColor(flightStatus),
                                                borderRadius: BorderRadius.circular(3),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  flightStatus,
                                                  style: TextStyle(
                                                      color: getFlightStatusTextcolor(
                                                          flightStatus)),
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
                                            Text(
                                              postModel.reservation.data?[i]
                                                      .departureAirportName ??
                                                  '',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            Image.asset(
                                              'assets/images/aircratimages/ic_aircraftline.png',
                                              scale: 3,
                                            ),
                                            const Spacer(),
                                            Text(
                                              postModel.reservation.data?[i]
                                                      .arrivalAirportName ??
                                                  '',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  formattedStartDate,
                                                  style: const TextStyle(
                                                      color: Colors.grey, fontSize: 14),
                                                ),
                                                Text(
                                                  formattedStartTime,
                                                  style: const TextStyle(
                                                      color: Colors.grey, fontSize: 14),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              children: [
                                                Text(
                                                  formattedEndDate,
                                                  style: const TextStyle(
                                                      color: Colors.grey, fontSize: 14),
                                                ),
                                                Text(
                                                  formattedEndTime,
                                                  style: const TextStyle(
                                                      color: Colors.grey, fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
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

  Color getFlightStatusColor(String status) {
    switch (status) {
      case 'CheckedOut':
        return const Color(0xFFDEF3E9);
      case 'CheckedIn':
        return const Color(0xFFF0E6F4);
      case 'Scheduled':
        return const Color(0xFFD9EDF7);
      case 'Pending':
        return const Color(0xFFFDF6DB);
      case 'Denied':
        return const Color(0xFFFBE4E2);
      default:
        return const Color(0xFFFCE6E6); // Default color
    }
  }

  Color getFlightStatusTextcolor(String status) {
    switch (status) {
      case 'CheckedOut':
        return const Color(0xFF21B06E);
      case 'CheckedIn':
        return const Color(0xFFF9B59B6);
      case 'Scheduled':
        return const Color(0xFF0088CD);
      case 'Pending':
        return const Color(0xFFF1C40F);
      case 'Denied':
        return const Color(0xFFE74C3C);
      default:
        return const Color(0xFFBB2649); // Default color
    }
  }
}
