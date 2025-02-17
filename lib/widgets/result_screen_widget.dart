import 'package:flutter/material.dart';

class ResultScreenWidget extends StatelessWidget {
  const ResultScreenWidget({
    super.key,
    required this.screenWidth,
    required this.displayText,
    required this.expression,
  });


  final double screenWidth;
  final String displayText;
  final String expression;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.bottomRight,
      width: screenWidth * .92,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.deepPurpleAccent.shade200),
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                expression,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                displayText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
