import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';

class WeeklyCalendarCard extends StatelessWidget {
  WeeklyCalendarCard(
      {Key? key,
      required this.listDate,
      required this.indexSelected,
      required this.onChange,
      required this.onSwipe})
      : super(key: key);

  final List<DateTime> listDate;
  final int indexSelected;
  final Function(int _) onChange;

  ///[onSwipe] return true is swipe right and false is swipe left
  final Function(bool _) onSwipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Row(
          children: listDate.asMap().entries.map((dateTimeEntries) {
            var date = dateTimeEntries.value;
            final now = DateTime.now();
            bool isToday = DateTime(date.year, date.month, date.day)
                    .difference(DateTime(now.year, now.month, now.day))
                    .inDays ==
                0;
            return Expanded(
              flex: 1,
              child: InkWell(
                onTap: () => onChange(dateTimeEntries.key),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        funBlueColor,
                        dateTimeEntries.key == indexSelected
                            ? pictonBlueColor
                            : funBlueColor
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isToday
                            ? 'Today'
                            : DateFormat('E').format(dateTimeEntries.value),
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        DateFormat('MM/dd').format(dateTimeEntries.value),
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        onHorizontalDragUpdate: (details) {
          // Note: Sensitivity is integer used when you don't want to mess up vertical drag
          int sensitivity = 5;
          if (details.delta.dx > sensitivity) {
            // Right Swipe
            onSwipe(true);
          } else if (details.delta.dx < -sensitivity) {
            //Left Swipe
            onSwipe(false);
          }
        });
  }
}
