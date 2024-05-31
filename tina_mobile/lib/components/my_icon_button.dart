// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyIconButton extends StatefulWidget {
  const MyIconButton({
    Key? key,
    required this.text,
    required this.icon,
    this.widget,
    this.onPressed, this.iconColor, this.background
  });

  final VoidCallback? onPressed;

  final String text;
  final IconData icon;
  final Color? iconColor;
  final Color? background;

  final Widget? widget;

  @override
  State<MyIconButton> createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: widget.onPressed ?? () {},
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: widget.background ??Color(
                0xFF2F1933,
              ),
              borderRadius: BorderRadius.circular(1000),
            ),
            child: widget.widget ?? Icon(widget.icon, color: widget.iconColor),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
