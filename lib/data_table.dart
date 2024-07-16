

import 'package:flutter/material.dart';

final _rowsCells = [
  [7, 8, 10, 8, 7],
  [10, 10, 9, 6, 6],
  [5, 4, 5, 7, 5],
  [9, 4, 1, 7, 8],
  [7, 8, 10, 8, 7],
  [10, 10, 9, 6, 6],
  [5, 4, 5, 7, 5],
  [9, 4, 1, 7, 8],
  [7, 8, 10, 8, 7],
  [10, 10, 9, 6, 6],
  [5, 4, 5, 7, 5],
  [9, 4, 1, 7, 8],
  [7, 8, 10, 8, 7],
  [10, 10, 9, 6, 6],
  [5, 4, 5, 7, 5],
  [9, 4, 1, 7, 8]
];
final _fixedColCells = [
  "Pablo",
  "Gustavo",
  "John",
  "Jack",
  "Pablo",
  "Gustavo",
  "John",
  "Jack",
  "Pablo",
  "Gustavo",
  "John",
  "Jack",
  "Pablo",
  "Gustavo",
  "John",
  "Jack",
];
final _fixedRowCells = [
  "Math",
  "Informatics",
  "Geography",
  "Physics",
  "Biology"
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
    width: width,
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
            _buildChild(widget.fixedColWidth, widget.fixedColCells.first))
      ],
      rows: widget.fixedColCells
          .map((c) =>
          DataRow(cells: [DataCell(_buildChild(widget.fixedColWidth, c))]))
          .toList());

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
              .map((c) => DataColumn(label: _buildChild(widget.cellWidth, c)))
              .toList(),
          rows: widget.rowsCells
              .map(
                (row) => DataRow(
                cells: row
                    .map((c) => DataCell(_buildChild(widget.cellWidth, c)))
                    .toList()),
          )
              .toList()));

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
      )
    ],
    rows: const [],
  );

  @override
  void initState() {
    super.initState();
    _subTableXController.addListener(() {
      _rowController.jumpTo(_subTableXController.position.pixels);
    });
    _subTableYController.addListener(() {
      _columnController.jumpTo(_subTableYController.position.pixels);
    });
  }

  @override
  Widget build(BuildContext context) {
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