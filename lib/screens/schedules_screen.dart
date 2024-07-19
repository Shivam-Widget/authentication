import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';

class SchedulesScreen extends StatefulWidget {
  const SchedulesScreen({super.key});

  @override
  State<SchedulesScreen> createState() => _SchedulesScreenState();
}

class _SchedulesScreenState extends State<SchedulesScreen>
    with SingleTickerProviderStateMixin {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
        },
      );
    }
  }

  int _counter = 0;
  int _counters = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _counters--;
    });
  }

  List aircraftList = [
    {
      'name': 'Wl373737',
      'isChecked': false,
    },
    {
      'name': 'THS1',
      'isChecked': false,
    },
    {
      'name': 'TEST11',
      'isChecked': false,
    },
    {
      'name': 'TEST10',
      'isChecked': false,
    },
    {
      'name': 'NC76510',
      'isChecked': false,
    },
    {
      'name': 'NC32166',
      'isChecked': false,
    },
    {
      'name': 'N92ME',
      'isChecked': false,
    },
    {
      'name': 'N9161T',
      'isChecked': false,
    },
    {
      'name': 'N811SB',
      'isChecked': false,
    },
    {
      'name': 'N748D',
      'isChecked': false,
    },
    {
      'name': 'N722MA',
      'isChecked': false,
    },
    {
      'name': 'N66AR',
      'isChecked': false,
    },
    {
      'name': 'N65GY',
      'isChecked': false,
    },
    {
      'name': 'N5314S',
      'isChecked': false,
    },
    {
      'name': 'N497PG',
      'isChecked': false,
    },
    {
      'name': 'N49456',
      'isChecked': false,
    },
  ];


  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MMM d, yyyy').format(selectedDate);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF1E374F),
        title: const Text(
          'Schedules',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              color: Colors.grey.shade400,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Container(
                                height: 850,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: AlertDialog(
                                  backgroundColor: Colors.transparent,
                                  title: const Text(
                                    'All Aircraft',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  actions: [
                                    TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        hintText: 'Search Aircraft',
                                        contentPadding: const EdgeInsets.fromLTRB(
                                            20.0, 10.0, 20.0, 10.0),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 600,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: const ScrollPhysics(),
                                                itemCount: aircraftList.length,
                                                scrollDirection: Axis.vertical,
                                                itemBuilder: (ctx, i) {
                                                  return Column(
                                                    children: [
                                                      CheckboxListTile(
                                                        value: aircraftList[i]
                                                            ['isChecked'],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            aircraftList[i]
                                                                    ['isChecked'] =
                                                                value!;
                                                          },
                                                          );
                                                        },
                                                        title: Text(
                                                            '${aircraftList[i]['name']}'),
                                                      ),
                                                      const Divider(),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: const Text('CLEAR & CLOSE'),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('OK')),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text('All Aircraft'),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.1,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.blue, width: 3),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Aircraft',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.1,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.blue, width: 3),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Pilot',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.white,
              child: Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width,
                height: 40,
                color: const Color(0xFFEBF0FF),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: _incrementCounter,
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            formattedDate,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: _incrementCounter,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            
            
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CustomDataTable(
                fixedCornerCell: '',
                borderColor: Colors.grey.shade300,
                rowsCells: _rowsCells,
                fixedColCells: _fixedColCells,
                fixedRowCells: _fixedRowCells,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _rowsCells = [
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
  ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],

];
final _fixedColCells = [
  "NC76510",
  "NC32166",
  "N9161T",
  "N811SB",
  "N748D",
  "N722MA",
  "N66AR",
  "N65GY",
  "N5314S",
  "N497PG",
  "N49456",
  "N311CM",
  "N268BA",
  "N265SB",
  "N16623",
  "N12H4",
];
final _fixedRowCells = [
  '12 AM',
  '1 AM',
  '2 AM',
  '3 AM',
  '4 AM',
  '5 AM',
  '6 AM',
  '7 AM',
  '8 AM',
  "9 AM",
  "10 AM",
  "11 AM",
  "12 PM",
  '1 PM',
  '2 PM',
  '3 PM',
  '4 PM',
  '5 PM',
  '6 PM',
  '7 PM',
  '8 PM',
  "9 PM",
  "10 PM",
  "11 PM",


];

class CustomDataTable<T> extends StatefulWidget {
  final T fixedCornerCell;
  final List<T> fixedColCells;
  final List<T> fixedRowCells;
  final List<List<T>> rowsCells;
  final double fixedColWidth;
  final double cellWidth;
  final double cellHeight;
  final double cellMargin;
  final double cellSpacing;
  final Color borderColor;

  const CustomDataTable({
    super.key,
    required this.fixedCornerCell,
    required this.fixedColCells,
    required this.fixedRowCells,
    required this.rowsCells,
    this.fixedColWidth = 60.0,
    this.cellHeight = 56.0,
    this.cellWidth = 120.0,
    this.cellMargin = 10.0,
    this.cellSpacing = 10.0,
    required this.borderColor,
  });

  @override
  State<StatefulWidget> createState() => CustomDataTableState();
}

class CustomDataTableState<T> extends State<CustomDataTable<T>> {
  final _columnController = ScrollController();
  final _rowController = ScrollController();
  final _subTableYController = ScrollController();
  final _subTableXController = ScrollController();

  Widget _buildChild(double width, T data) => SizedBox(
        width: 80,
        child: Text(
          '$data',
          textAlign: TextAlign.center,
        ),
      );

  TableBorder _buildBorder({
    bool top = false,
    bool left = false,
    bool right = false,
    bool bottom = false,
    bool verticalInside = false,
  }) {
    return TableBorder(
      top: top ? BorderSide(color: widget.borderColor) : BorderSide.none,
      left: left ? BorderSide(color: widget.borderColor) : BorderSide.none,
      right: right ? BorderSide(color: widget.borderColor) : BorderSide.none,
      bottom: bottom ? BorderSide(color: widget.borderColor) : BorderSide.none,
      verticalInside: verticalInside
          ? BorderSide(color: widget.borderColor)
          : BorderSide.none,
    );
  }

  Widget _buildFixedCol() => DataTable(
        border: _buildBorder(right: true),
        horizontalMargin: widget.cellMargin,
        columnSpacing: widget.cellSpacing,
        headingRowHeight: widget.cellHeight,
        dataRowHeight: widget.cellHeight,
        columns: [
          DataColumn(
            label:
                _buildChild(widget.fixedColWidth, widget.fixedColCells.first),
          ),
        ],
        rows: widget.fixedColCells
            .map(
              (c) => DataRow(
                cells: [
                  DataCell(
                    _buildChild(widget.fixedColWidth, c),
                  ),
                ],
              ),
            )
            .toList(),
      );

  Widget _buildFixedRow() => DataTable(
        border: _buildBorder(verticalInside: true, bottom: true),
        horizontalMargin: widget.cellMargin,
        columnSpacing: widget.cellSpacing,
        headingRowHeight: widget.cellHeight,
        dataRowHeight: widget.cellHeight,
        columns: widget.fixedRowCells
            .map(
              (c) => DataColumn(
                label: _buildChild(widget.cellWidth, c),
              ),
            )
            .toList(),
        rows: const [],
      );

  Widget _buildSubTable() => Material(
        color: Colors.white,
        child: DataTable(
          border: _buildBorder(verticalInside: true),
          horizontalMargin: widget.cellMargin,
          columnSpacing: widget.cellSpacing,
          headingRowHeight: widget.cellHeight,
          dataRowHeight: widget.cellHeight,
          columns: widget.rowsCells.first
              .map(
                (c) => DataColumn(
                  label: _buildChild(widget.cellWidth, c),
                ),
              )
              .toList(),
          rows: widget.rowsCells
              .map(
                (row) => DataRow(
                    cells: row
                        .map(
                          (c) => DataCell(
                            _buildChild(widget.cellWidth, c),
                          ),
                        )
                        .toList()),
              )
              .toList(),
        ),
      );

  Widget _buildCornerCell() => DataTable(
        border: _buildBorder(bottom: true, right: true),
        horizontalMargin: widget.cellMargin,
        columnSpacing: widget.cellSpacing,
        headingRowHeight: widget.cellHeight,
        dataRowHeight: widget.cellHeight,
        columns: [
          DataColumn(
            label: _buildChild(
              widget.fixedColWidth,
              widget.fixedCornerCell,
            ),
          ),
        ],
        rows: const [],
      );

  @override
  void initState() {
    super.initState();
    _subTableXController.addListener(
      () {
        _rowController.jumpTo(_subTableXController.position.pixels);
      },
    );
    _subTableYController.addListener(
      () {
        _columnController.jumpTo(_subTableYController.position.pixels);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: widget.borderColor),
        ),
        child: Column(
          children: [
            Row(
              children: [
                _buildCornerCell(),
                Flexible(
                  child: SingleChildScrollView(
                    controller: _rowController,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: _buildFixedRow(),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  SingleChildScrollView(
                    controller: _columnController,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    child: _buildFixedCol(),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      controller: _subTableXController,
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        controller: _subTableYController,
                        scrollDirection: Axis.vertical,
                        child: _buildSubTable(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
