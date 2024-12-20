import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.textColor,
      required this.buttonColor,
      this.pressedColor,
      required this.ontap,
      this.isLoading = false});
  final Function()? ontap;
  final double height;
  final double width;
  final String text;
  final bool isLoading;
  final Color textColor;
  final Color buttonColor;
  final Color? pressedColor; // Optional color for pressed state

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: widget.ontap,
      child: AnimatedScale(
        scale: isPressed ? 0.95 : 1.0,
        duration: Duration(milliseconds: 100),
        child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            decoration: BoxDecoration(
              color: isPressed
                  ? widget.pressedColor ?? widget.buttonColor.withOpacity(0.8)
                  : widget.buttonColor,
              borderRadius: BorderRadius.circular(8.sp),
            ),
            height: widget.height,
            width: widget.width,
            child: Center(
              child: widget.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white, // You can customize this color
                    )
                  : Text(
                      widget.text,
                      style: TextStyle(color: widget.textColor),
                    ),
            )),
      ),
    );
  }
}
