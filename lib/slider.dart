import 'package:flutter/material.dart';

class SliderRan extends StatefulWidget {
  const SliderRan({Key? key}) : super(key: key);

  @override
  State<SliderRan> createState() => _SliderRanState();
}

class _SliderRanState extends State<SliderRan> {
  RangeValues rang = RangeValues(20, 89);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RangeSlider(
            min: 0,
            max: 120,
            values: rang,
            onChanged: (RangeValues value) {
              setState(() {
                rang = value;
              });
            },
          )
        ],
      ),
    );
  }
}
