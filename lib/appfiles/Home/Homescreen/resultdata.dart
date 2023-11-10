
import 'dart:convert';


import 'package:final_project/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../customWidget/customAppBar.dart';

class ResultData extends StatefulWidget {
  const ResultData({
    Key? key,
  }) : super(key: key);

  @override
  _ResultDataState createState() => _ResultDataState();
}

class _ResultDataState extends State<ResultData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(isLeading: false, title: 'Result Data'),
        body: SafeArea(
          child: FutureBuilder(
            future: getProductDataSource(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return snapshot.hasData
                  ? SfDataGrid(source: snapshot.data, columns: getColumns())
                  : const Center(
                      child: CircularProgressIndicator(
                        color: iconColor,
                        strokeWidth: 2,
                      ),
                    );
            },
          ),
        ));
  }

  Future<ProductDataGridSource> getProductDataSource() async {
    var productList = await generateProductList();
    return ProductDataGridSource(productList);
  }

  Future<List<Result>> generateProductList() async {
    var response = await http.get(Uri.parse(
        'http://10.0.2.2/project_db/public/api/results'));
    var decodedProducts =
        json.decode(response.body).cast<Map<String, dynamic>>();
    List<Result> resultList = await decodedProducts
        .map<Result>((json) => Result.fromJson(json))
        .toList();
    return resultList;
  }
}

List<GridColumn> getColumns() {
  return <GridColumn>[
    GridColumn(
        columnName: 'race_id',
        width: 120.w,
        columnWidthMode: ColumnWidthMode.fill,
        label: Container(
            alignment: Alignment.center,
            child: const Text(
              'Race',
              style: TextStyle(color: textColor),
            ))),
    GridColumn(
      columnName: 'stable',
      width: 120.w,
      columnWidthMode: ColumnWidthMode.fill,
      label: Container(
          alignment: Alignment.center,
          child: const Text('Stable', style: TextStyle(color: textColor))),
    ),
    GridColumn(
        columnName: 'horse',
        width: 120.w,
        columnWidthMode: ColumnWidthMode.fill,
        label: Container(
            alignment: Alignment.center,
            child: const Text('Horse', style: TextStyle(color: textColor)))),
    GridColumn(
        columnName: 'rider',
        width: 120.w,
        columnWidthMode: ColumnWidthMode.fill,
        label: Container(
            alignment: Alignment.center,
            child: const Text('Rider', style: TextStyle(color: textColor)))),
    GridColumn(
        columnName: 'trainer',
        width: 120.w,
        columnWidthMode: ColumnWidthMode.fill,
        label: Container(
            alignment: Alignment.center,
            child: const Text('Trainer', style: TextStyle(color: textColor)))),
    GridColumn(
        columnName: 'stage',
        width: 120.w,
        columnWidthMode: ColumnWidthMode.fill,
        label: Container(
            alignment: Alignment.center,
            child: const Text('Stage', style: TextStyle(color: textColor)))),
    GridColumn(
        columnName: 'score',
        width: 120.w,
        columnWidthMode: ColumnWidthMode.fill,
        label: Container(
            alignment: Alignment.center,
            child: const Text('Score', style: TextStyle(color: textColor)))),
  ];
}

class ProductDataGridSource extends DataGridSource {
  ProductDataGridSource(this.productList) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<Result> productList;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                row.getCells()[0].value,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          row.getCells()[1].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        child: Text(
          row.getCells()[2].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        child: Text(
          row.getCells()[3].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        child: Text(
          row.getCells()[4].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        child: Text(
          row.getCells()[5].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.centerRight,
          child: Text(
            row.getCells()[6].value,
            overflow: TextOverflow.ellipsis,
          ))
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    dataGridRows = productList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'race', value: dataGridRow.race_name),
        DataGridCell<String>(columnName: 'stable', value: dataGridRow.stable),
        DataGridCell<String>(columnName: 'horse', value: dataGridRow.horse),
        DataGridCell<String>(columnName: 'rider', value: dataGridRow.rider),
        DataGridCell<String>(columnName: 'trainer', value: dataGridRow.trainer),
        DataGridCell<String>(columnName: 'stage', value: dataGridRow.stage),
        DataGridCell<String>(columnName: 'score', value: dataGridRow.score),
      ]);
    }).toList(growable: false);
  }
}

class Result {
  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      race_name: json["race_name"],
      stable: json['stable'],
      horse: json['horse'],
      rider: json['rider'],
      trainer: json['trainer'],
      stage: json['stage'],
      score: json['score'],
    );
  }
  Result({
    required this.race_name,
    required this.stable,
    required this.horse,
    required this.rider,
    required this.trainer,
    required this.stage,
    required this.score,
  });
  final String? race_name;
  final String? stable;
  final String? horse;
  final String? rider;
  final String? trainer;
  final String? stage;
  final String? score;
}
