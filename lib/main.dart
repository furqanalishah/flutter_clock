import 'package:flutter/material.dart';
import 'package:flutter_clock/clock_view.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildMenuButton("Clock", "assets/clock_icon.png"),
              buildMenuButton("Alarm", "assets/alarm_icon.png"),
              buildMenuButton("Timer", "assets/timer_icon.png"),
              buildMenuButton("Stopwatch", "assets/stopwatch_icon.png"),
            ],
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
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
                                style: TextStyle(
                                    fontFamily: 'avenir', color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildMenuButton(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextButton(
        onPressed: () {},
        child: Column(
          children: [
            Image.asset(
              image,
              scale: 1.5,
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(fontFamily: 'avenir', color: Colors.white, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
