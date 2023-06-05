import 'package:flutter/material.dart';

class AvailableCarTable extends StatefulWidget {

  const AvailableCarTable({super.key, required this.data});

  final data;

  @override
  State<AvailableCarTable> createState() => _AvailableCarTableState();
}

class _AvailableCarTableState extends State<AvailableCarTable> {

  @override
  Widget build(BuildContext context) {
    var carList = widget.data['car'];

    return SizedBox(
      child: Table(
        border: TableBorder.all(
            color: Colors.black.withOpacity(0.4)),
        defaultVerticalAlignment:
        TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
            ),
            children: [
              const TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("Nomor Mobil"),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("Supir"),
                ),
              ),
            ],
          ),
          for(int i = 0; i < carList.length; i++)
            TableRow(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      carList[i]["code"]
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                        carList[i]["driver"]
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}