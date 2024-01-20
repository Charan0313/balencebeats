import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  PageIndicator({required this.currentPage, required this.pageCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => _buildDot(index),
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == index ? Colors.white : Colors.grey,
      ),
    );
  }
}
