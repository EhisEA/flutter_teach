import 'package:flutter/material.dart';

class SliderRan extends StatefulWidget {
  const SliderRan({Key? key}) : super(key: key);

  @override
  State<SliderRan> createState() => _SliderRanState();
}

class _SliderRanState extends State<SliderRan> {
  TextEditingController minTextController = TextEditingController(text: "20");
  TextEditingController maxTextController = TextEditingController(text: "89");
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
                minTextController.text = value.start.toString();
                maxTextController.text = value.end.toString();
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                showText("From", minTextController),
                const Spacer(flex: 1),
                showText("To", maxTextController),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget showText(String title, TextEditingController controller) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
