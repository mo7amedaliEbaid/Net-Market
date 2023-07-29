import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/providers/store_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../app_widgets/app_bar.dart';

class OrderTimeScreen extends StatefulWidget {
  const OrderTimeScreen({Key? key}) : super(key: key);

  @override
  State<OrderTimeScreen> createState() => _OrderTimeScreenState();
}

class _OrderTimeScreenState extends State<OrderTimeScreen> {
  bool scheduleSelected = false;
  bool nightTimeSelected = false;
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(builder: (context, data, _) {
      Size size = MediaQuery.of(context).size;
      return Scaffold(
        appBar: MyAppBar(context, data.store.name!,true,false),
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "delivery Time".toUpperCase(),
                style: lightThemetitleStyle,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          scheduleSelected = false;
                        });
                      },
                      child: Icon(
                        scheduleSelected
                            ? Icons.circle_outlined
                            : Icons.check_circle_outline,
                        color: !scheduleSelected
                            ? Colors.greenAccent
                            : Colors.blue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "As Soon As Possible",
                        style: lightThemenormalStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          scheduleSelected = true;
                        });
                      },
                      child: Icon(
                        !scheduleSelected
                            ? Icons.circle_outlined
                            : Icons.check_circle_outline,
                        color:
                            scheduleSelected ? Colors.greenAccent : Colors.blue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Schedule Order",
                        style: lightThemenormalStyle,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              !scheduleSelected
                  ? Container()
                  : SfDateRangePicker(
                      selectionColor: Colors.green,
                      onSelectionChanged: _onSelectionChanged,
                      selectionMode: DateRangePickerSelectionMode.single,
                      initialSelectedRange: PickerDateRange(
                          DateTime.now().subtract(const Duration(days: 4)),
                          DateTime.now().add(const Duration(days: 3))),
                    ),
              //Text(_selectedDate)
              !scheduleSelected?Container():
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // width: size.width * .3,
                    height: size.height * .06,
                    // margin: EdgeInsets.fromLTRB(30, 50, 30, 5),
                    decoration: BoxDecoration(
                        color: nightTimeSelected ? Colors.white : Colors.green,
                        borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue,width: 1)),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            nightTimeSelected = false;
                          });
                        },
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "4:00 AM - 10:00 AM",
                            style: nightTimeSelected
                                ? lightThemenormalStyle
                                : normalwhite,
                          ),
                        ))),
                  ),
                  Container(
                    // width: size.width * .3,
                    height: size.height * .06,
                    // margin: EdgeInsets.fromLTRB(30, 50, 30, 5),
                    decoration: BoxDecoration(
                        color: !nightTimeSelected ? Colors.white : Colors.green,
                        borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue,width: 1)),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            nightTimeSelected = true;
                          });
                        },
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                          "1:00 PM - 6:00 PM",
                          style: !nightTimeSelected
                                ? lightThemenormalStyle
                                : normalwhite,
                        ),
                            ))),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
