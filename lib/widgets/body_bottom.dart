import 'package:flutter/material.dart';

class BodyBottom extends StatefulWidget {
  const BodyBottom({super.key});

  @override
  State<BodyBottom> createState() => _BodyBottomState();
}

class _BodyBottomState extends State<BodyBottom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white30,
              )
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Humidity',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Text(
                  '70%',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Wind',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Text(
                  '10',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Pressure',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Text(
                  '40',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
