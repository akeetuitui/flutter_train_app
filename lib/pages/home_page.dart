import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? departureStation;
  String? arrivalStation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '기차 예매',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true, // 제목 중앙 정렬
        backgroundColor: Colors.white, // 앱바 배경 흰색
        elevation: 0, // 그림자 제거
        foregroundColor: Colors.black, // 아이콘 색상
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 출발역/도착역 선택 박스
            Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // 출발역
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '출발역',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextButton(
                          onPressed: () async {
                            final selectedStation = await Navigator.pushNamed(
                              context,
                              '/stations',
                              arguments: '출발역',
                            );
                            if (selectedStation != null) {
                              setState(() {
                                departureStation = selectedStation as String;
                              });
                            }
                          },
                          child: Text(
                            departureStation ?? '선택',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 세로 구분선
                  Container(
                    width: 2,
                    height: 50,
                    color: Colors.grey[300],
                  ),
                  // 도착역
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '도착역',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextButton(
                          onPressed: () async {
                            final selectedStation = await Navigator.pushNamed(
                              context,
                              '/stations',
                              arguments: '도착역',
                            );
                            if (selectedStation != null) {
                              setState(() {
                                arrivalStation = selectedStation as String;
                              });
                            }
                          },
                          child: Text(
                            arrivalStation ?? '선택',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // 좌석 선택 버튼
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: departureStation != null && arrivalStation != null
                    ? () {
                        Navigator.pushNamed(context, '/seat', arguments: {
                          'departureStation': departureStation,
                          'arrivalStation': arrivalStation,
                        });
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  disabledBackgroundColor: Colors.purple.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  '좌석 선택',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200], // 배경색 설정
    );
  }
}