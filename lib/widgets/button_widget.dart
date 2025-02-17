import 'package:flutter/material.dart';
class ButtonWidget extends StatelessWidget {
  final String text;
  final Color ? bgColor;
  final Color ? frColor;
  final VoidCallback onClick;
  const ButtonWidget({
    super.key,
    required this.text, this.bgColor, this.frColor, required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: onClick,
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor ?? Colors.black,
            padding: EdgeInsets.all(26),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(width: 2, color: Colors.deepPurpleAccent)
            ),
          ),
          child: Text(text,
            style: TextStyle(
                color: frColor ?? Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}