import 'package:flutter/material.dart';

class WeatherBody extends StatefulWidget {
  const WeatherBody({super.key});

  @override
  State<WeatherBody> createState() => _WeatherBodyState();
}

class _WeatherBodyState extends State<WeatherBody> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80,),
              Text(
                'Location: Isla Mujeres',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    color: Colors.white
                ),
              ),
              Text(
                'Time: 2.30pm | Description: Sunny',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '30\u2103',
                style: TextStyle(
                    fontSize: 85,
                    fontWeight: FontWeight.w200,
                    color: Colors.white
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.wb_sunny_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Day',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
