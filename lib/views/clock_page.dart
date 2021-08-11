import 'package:flutter/material.dart';
import 'package:flutter_clock/views/clock_view.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatelessWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              style: TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(fontFamily: 'avenir', color: Colors.white, fontSize: 64),
                ),
                Text(
                  formattedDate,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'avenir',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.center,
              child: ClockView(size: MediaQuery.of(context).size.height / 4),
            ),
          ),
          Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Timezone',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'avenir',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.language, color: Colors.white),
                      SizedBox(width: 16),
                      Text(
                        'UTC$offsetSign$timezoneString',
                        style: TextStyle(fontFamily: 'avenir', color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
