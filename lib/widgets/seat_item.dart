import 'package:flutter/material.dart';

class SeatItem extends StatelessWidget {
  final int seatNumber;
  final bool isSelected;
  final VoidCallback onTap;

  const SeatItem({
    required this.seatNumber,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            '$seatNumber',
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}