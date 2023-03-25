import 'package:flutter/material.dart';

class CustomCartCounterIcon extends StatelessWidget {
  const CustomCartCounterIcon({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      borderRadius: BorderRadius.circular(36),
      elevation: 4,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: Colors.white,
        ),
        child: IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
