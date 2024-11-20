import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  final String departureStation;
  final String arrivalStation;

  const SeatPage({
    Key? key,
    required this.departureStation,
    required this.arrivalStation,
  }) : super(key: key);

  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedSeat; // 선택된 좌석 번호

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 출발역과 도착역 표시
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.departureStation, // 출발역
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                Icon(Icons.arrow_forward, size: 30),
                Text(
                  widget.arrivalStation, // 도착역
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // 좌석 상태 안내 레이블
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem('선택됨', Colors.purple),
                SizedBox(width: 20),
                _buildLegendItem('선택 안됨', Colors.grey[300]!),
              ],
            ),
            SizedBox(height: 20),
            // 열 헤더 (A, B, C, D)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                4,
                (index) => Text(
                  String.fromCharCode(65 + index), // A, B, C, D 생성
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // 좌석 리스트 (행 헤더와 좌석)
            Expanded(
              child: ListView.builder(
                itemCount: 10, // 총 10개의 행
                itemBuilder: (context, rowIndex) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 행 번호 (1, 2, 3, ...)
                      Container(
                        width: 40,
                        alignment: Alignment.center, // 행 번호 가운데 정렬
                        child: Text(
                          '${rowIndex + 1}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // 좌석 리스트 (A, B, C, D 열)
                      ...List.generate(4, (colIndex) {
                        final seatIndex = rowIndex * 4 + colIndex; // 좌석 번호
                        final isSelected = selectedSeat == seatIndex;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSeat = seatIndex; // 선택된 좌석 업데이트
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.purple
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                '${seatIndex + 1}', // 좌석 번호 표시
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // 예매 하기 버튼
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedSeat != null
                    ? () {
                        _showBookingDialog(context); // 다이얼로그 호출
                      }
                    : null, // 좌석 선택이 없으면 비활성화
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  disabledBackgroundColor: Colors.purple.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  '예매 하기',
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
      backgroundColor: Colors.grey[100], // 배경색 설정
    );
  }

  // 좌석 상태 안내 레이블 생성
  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  // 예매 확인 다이얼로그
  void _showBookingDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('예매 확인'),
        content: Text('좌석 ${selectedSeat! + 1}번을 선택했습니다.'),
        actions: [
          CupertinoDialogAction(
            child: Text('취소'),
            onPressed: () => Navigator.pop(context), // 다이얼로그 닫기
          ),
          CupertinoDialogAction(
            child: Text('확인'),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/')); // 홈으로 이동
            },
          ),
        ],
      ),
    );
  }
}