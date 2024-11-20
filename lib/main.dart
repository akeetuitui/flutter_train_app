import 'package:flutter/material.dart';
import 'package:flutter_train_booking_app_skj/pages/home_page.dart' as home;
import 'package:flutter_train_booking_app_skj/pages/seat_page.dart' as seat;
import 'package:flutter_train_booking_app_skj/pages/station_list_page.dart'; // 역 선택 페이지 추가

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Train Booking App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => home.HomePage(), // 홈 페이지
        '/stations': (context) => StationListPage(), // 기차역 선택 페이지
        '/seat': (context) => seat.SeatPage(
              departureStation: '서울',
              arrivalStation: '부산',
            ), // 좌석 선택 페이지
      },
    );
  }
}