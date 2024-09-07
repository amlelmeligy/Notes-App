import 'package:flutter/material.dart';
import 'package:pro/constants.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kColor.withOpacity(0.5),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            color: kMainColor,
            icon,
            size: 28,
          ),
        ),
      ),
    );
  }
}
