import 'package:flutter/material.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key, required this.color, required this.text});
  final Color color;
  final Widget text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 17, bottom: 6, top: 8),
      width: MediaQuery.of(context).size.width * 0.272,
      height: MediaQuery.of(context).size.width * 0.095,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38),
        color: color,
      ),
      child: Center(child: TextButton(onPressed: () {}, child: text)),
    );
  }
}
