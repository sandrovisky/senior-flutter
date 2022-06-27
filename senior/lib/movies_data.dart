import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:senior/api.dart';
import 'package:senior/appbar.dart';
import 'package:senior/mainColor.dart';

class MoviesData extends StatefulWidget {
  const MoviesData({Key? key, required this.search}) : super(key: key);

  final String search;

  @override
  State<MoviesData> createState() => _MoviesDataState();
}

class _MoviesDataState extends State<MoviesData> {
  int _currentSortColumn = 0;
  bool _isSortCol = true;
  List movies = [];
  bool loading = true;

  Future _getData() async {
    http.Response response =
        await http.get(Uri.parse('$apiBaseUrl?title=${widget.search}'));
    dynamic data = json.decode(response.body);
    setState(() {
      movies = data['moviesByYear'];
      loading = false;
    });
  }

  _buildLoading(width) {
    return Scaffold(
        body: Center(
      child: SpinKitSpinningLines(
        color: mainColor,
        itemCount: 10,
        size: width * 0.5,
        duration: const Duration(milliseconds: 4000),
      ),
    ));
  }

  _buildBackIcon() {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back, color: mainColor),
    );
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: _buildBackIcon(),
        centerTitle: true,
        actions: [seniorAppBarOther()],
      ),
      body: loading
          ? _buildLoading(width)
          : Container(
              color: mainColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Card(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'You searched for: ${widget.search.toUpperCase()}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: _createDataTable()),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _createDataTable() {
    return movies.length != 0
        ? DataTable(
            columns: _createColumns(),
            rows: _createRows(),
            sortColumnIndex: _currentSortColumn,
            sortAscending: _isSortCol,
          )
        : const Center(
            child: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text(
              'No movies found',
              style: TextStyle(fontSize: 24),
            ),
          ));
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: const Text('Year'),
        onSort: (columnIndex, _) {
          setState(() {
            _currentSortColumn = columnIndex;
            if (_isSortCol) {
              movies.sort((a, b) {
                if (b['year'] > a['year']) {
                  return -1;
                } else if (b['year'] < a['year']) {
                  return 1;
                } else {
                  return 0;
                }
              });
            } else {
              movies.sort((a, b) {
                if (a['year'] > b['year']) {
                  return -1;
                } else if (a['year'] < b['year']) {
                  return 1;
                } else {
                  return 0;
                }
              });
            }
            _isSortCol = !_isSortCol;
          });
        },
      ),
      DataColumn(
        label: const Text('Amount'),
        onSort: (columnIndex, _) {
          setState(() {
            _currentSortColumn = columnIndex;
            if (_isSortCol) {
              movies.sort((a, b) {
                if (b['movies'] > a['movies']) {
                  return -1;
                } else if (b['movies'] < a['movies']) {
                  return 1;
                } else {
                  return 0;
                }
              });
            } else {
              movies.sort((a, b) {
                if (a['movies'] > b['movies']) {
                  return -1;
                } else if (a['movies'] < b['movies']) {
                  return 1;
                } else {
                  return 0;
                }
              });
            }
            _isSortCol = !_isSortCol;
          });
        },
      ),
    ];
  }

  List<DataRow> _createRows() {
    return movies
        .map<DataRow>((movie) => DataRow(cells: [
              DataCell(Text(movie['year'].toString())),
              DataCell(Text(movie['movies'].toString())),
            ]))
        .toList();
  }
}
