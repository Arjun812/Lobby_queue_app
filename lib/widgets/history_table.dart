import 'package:flutter/material.dart';
import 'package:webtest/demo/data_table_model.dart';
import 'package:webtest/utils/styles.dart';

class HistoryTable extends StatefulWidget {
  const HistoryTable({Key? key}) : super(key: key);

  @override
  State<HistoryTable> createState() => _HistoryTableState();
}

class _HistoryTableState extends State<HistoryTable> {
  int? _currentSortColumn;
  bool isAscending = false;
  List<TableData> tableData = queueList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: Decorations.mainDecoration,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DataTable(
            sortAscending: isAscending,
            sortColumnIndex: _currentSortColumn,
            columns: [
              DataColumn(
                onSort: onSort,
                label: const Expanded(
                  child: Text(
                    'Date',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              const DataColumn(
                label: Expanded(
                  child: Text(
                    'Vehicle Number',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              const DataColumn(
                label: Expanded(
                  child: Text(
                    'Student Name',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              const DataColumn(
                
                label: Expanded(
                  child: Text(
                    'Class',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              const DataColumn(
                label: Expanded(
                  child: Text(
                    'Parents Name',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              const DataColumn(
                label: Expanded(
                  child: Text(
                    'Entry time',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows: getRow(tableData)!
          ),
        ),
      ),
    );
  }

  List<DataRow>? getRow(List<TableData>? queue) =>
      queue!.map((TableData table) {
        final cell = [
          table.date,
          table.vNo,
          table.studentName,
          table.className,
          table.parentsName,
          table.entryTime
        ];
        return DataRow(cells: dataCell(cell)!);
      }).toList();

  List<DataCell>? dataCell(List<dynamic> cell) =>
      cell.map((data) => DataCell(Text('$data'))).toList();

  onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      tableData.sort((a,b)
      =>a.date!.compareTo(b.date!));
    }
    setState(() {
      _currentSortColumn = columnIndex;
      ascending == true ? false : true;
      isAscending = ascending;
    });
  }
}
