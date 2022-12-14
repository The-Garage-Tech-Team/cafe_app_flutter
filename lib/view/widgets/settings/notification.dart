
import 'package:flutter/material.dart';

import '../textUtils.dart';




class NotificationWidget extends StatelessWidget {
  NotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextUtils(
          fointSize: 12,
          fontWeight: FontWeight.w300,
          text: "Notification",
          color: Colors.black,
        ),
        Switch(
          activeTrackColor: Colors.green,
          activeColor: Colors.green,
          value: false,
          onChanged: (_) {},
        ),
      ],
    );
  }
}