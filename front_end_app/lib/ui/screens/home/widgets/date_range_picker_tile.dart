import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

final today = DateUtils.dateOnly(DateTime.now());


class DateRangePickerWidget extends StatefulWidget {
  final Function(DateTime, DateTime) onDateRangeSelected;
  const DateRangePickerWidget({Key? key, required this.onDateRangeSelected}) : super(key: key);

  @override
  State<DateRangePickerWidget> createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> with TickerProviderStateMixin{
  bool hasBottomNotch = false;
  bool itemClicked = false;
  int isItemSelected = 0;

  late TabController tabController;

  final DateRangePickerController _datePickerController = DateRangePickerController();

  List<DateTime> _blackoutDates = <DateTime>[];
  late final int firstDayOfWeek;
  DateTime rangeStartDate = DateTime.now();
  DateTime rangeEndDate = DateTime.now().add(const Duration(days: 2));


  void viewChanged(DateRangePickerViewChangedArgs args){
    // ignore: no_leading_underscores_for_local_identifiers
    List<DateTime> _blackoutDateCollection = <DateTime>[];
    final DateTime visibleStartDate = args.visibleDateRange.startDate!;
    _blackoutDateCollection.add(visibleStartDate);
    for (int i = 1; i <= today.day - 2; i++) {
      _blackoutDateCollection.add(visibleStartDate.add(Duration(days: i)));
    }
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _blackoutDates = _blackoutDateCollection;
      });
    });
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args){
    if (args.value is PickerDateRange) {
      rangeStartDate = args.value.startDate;
      rangeEndDate = args.value.endDate;
      widget.onDateRangeSelected.call(rangeStartDate, rangeEndDate);
    }
  }

  @override
  initState() {
    tabController = TabController(length: 3, vsync: this);
    _datePickerController.view = DateRangePickerView.month;
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final bool hasTopNotch = MediaQuery.of(context).padding.top > 24.0;
    final maxHeight = MediaQuery.of(context).size.height * (0.82);

    return Container(
      padding: EdgeInsets.only(
        top: hasTopNotch ? 20 : 8),
      height:maxHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20)
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: const Column(
              children: [
                SizedBox(height: 20),
                AppText(
                  title: 'When does your trip take place?',
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.visible,
                ),
                SizedBox(height: 15),
                
              ]
            )
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TabBar(
                      labelColor: Colors.black,
                      indicatorColor: Colors.white,
                      indicatorWeight: 1,
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      controller: tabController,
                      tabs: const [
                        Tab(
                          text: 'Day',
                          height: 30,
                        ),
                        Tab(
                          text: 'Month',
                          height: 30,
                        ),
                        Tab(
                          text: 'Flexible',
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                        ),
                        height: 100,
                        child: SfDateRangePicker(
                          todayHighlightColor: Colors.black87,
                          backgroundColor: Colors.white,
                          monthFormat: 'MMM',
                          selectionMode: DateRangePickerSelectionMode.range,
                          selectionTextStyle: const TextStyle(color: Colors.white),
                          selectionColor: Colors.grey.shade700,
                          startRangeSelectionColor: Colors.black,
                          endRangeSelectionColor: Colors.black,
                          rangeSelectionColor: Colors.grey.shade300,
                          controller: _datePickerController,
                          navigationDirection: DateRangePickerNavigationDirection.vertical,
                          navigationMode: DateRangePickerNavigationMode.scroll,
                          minDate: DateTime(today.year, today.month, today.day-1),
                          maxDate: DateTime(today.year, today.month + 2, today.day),
                          headerStyle: const DateRangePickerHeaderStyle(
                            backgroundColor: Colors.transparent,
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            )),
                          monthViewSettings: DateRangePickerMonthViewSettings(
                            firstDayOfWeek: 1,
                            dayFormat: 'E',
                            blackoutDates: _blackoutDates,
                            viewHeaderStyle: const DateRangePickerViewHeaderStyle(
                              textStyle: TextStyle(color: Colors.grey)
                            )),
                          monthCellStyle: const DateRangePickerMonthCellStyle(
                            textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                            todayTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                            blackoutDateTextStyle: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough
                            )),
                          onViewChanged: viewChanged,
                          onSelectionChanged: _onSelectionChanged                   
                        ),
                      ),
                      Center(child: Text("Tab 2")),
                      Center(child: Text("Tab 3")),
                    ],
                  ),
                ),
              ],
            )
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: 55,
            decoration: const BoxDecoration(
              color:  Color(0xFFFFFFFF),
              border: Border(
                top: BorderSide(width: 1.0, color: Color.fromARGB(255, 201, 201, 201)),
              ),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var i = 0; i < dataDates.length; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isItemSelected = i;
                      });
                    },
                    child: ScrollDay(
                      title: dataDates[i]['title'] ?? '',
                      isSelected: isItemSelected == i ? true : false,
                    ),
                  )
              ],
            )
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            height: hasBottomNotch ? 80 : 70,
            decoration: const BoxDecoration(
              color:  Color(0xFFFFFFFF),
              border: Border(
                top: BorderSide(width: 1.0, color: Color.fromARGB(255, 201, 201, 201)),
              ),
            ),
            // height: 100,
            // color: Colors.amberAccent,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    return Navigator.of(context).pop();
                  },
                  child: const AppText(title: "Skip", fontSize: 16, fontWeight: FontWeight.w500, textDecoration: TextDecoration.underline),
                ),
                const Spacer(),
                Container(
                  width: 150,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        print('rangeStartDate: $rangeStartDate');
                        print('rangeEndDate: $rangeEndDate');
                        return Navigator.of(context).pop();
                      },
                      child: const AppText(
                        title: "Next",
                        fontSize: 16,
                        lineHeight: 1,
                        titleColor: Color(0xFFFFFFFF),
                      ),
                    )
                  ),
                )
              ],
            ),
          )
        ]
      )
    );
  }
}

const dataDates = [
  {
    "title": "Exact Dates",
  },
  {
    "title": "+/- 1 day",
  },
  {
    "title": "+/- 2 day",
  },
  {
    "title": "+/- 3 day",
  },
  {
    "title": "+/- 7 day",
  },
];

class ScrollDay extends StatelessWidget {
  final String title;
  final bool isSelected;
  const ScrollDay({super.key, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(
        left: 15,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: isSelected? Colors.black : Colors.grey),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Center(child: AppText(title: title, fontSize: 16, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400))
      ),
    );
  }
}