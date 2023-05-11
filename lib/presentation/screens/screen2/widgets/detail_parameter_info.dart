// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../styling/colors.dart';

/// this util is used in second screen for showing info about specific data like
/// temperature, humidity etc
/// this is used in [DetailedWeatherInfoCard]
class DetailParameterInfo extends StatelessWidget {
  const DetailParameterInfo({
    Key? key,
    required this.iconData,
    required this.detailLabel,
    required this.detailData,
  }) : super(key: key);

  final IconData iconData;
  final String detailLabel;
  final String detailData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 25,
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              detailLabel,
              style: const TextStyle(
                color: textPrimaryColor,
                fontSize: 20,
              ),
            ),
            Text(
              detailData,
              style: const TextStyle(
                  color: textMiddleColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }
}
