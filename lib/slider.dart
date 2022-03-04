import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                showText(
                  "From",
                  minTextController,
                  onC: (value) {
                    late double val;
                    if (double.tryParse(value) != null) {
                      val = double.parse(value);
                    } else if (int.tryParse(value) != null) {
                      val = int.parse(value).toDouble();
                    } else {
                      val = 1.0;
                    }
                    if (val >= rang.end) return;
                    rang = RangeValues(val, rang.end);
                    setState(() {});
                  },
                ),
                const Spacer(flex: 1),
                showText("To", maxTextController, onC: (value) {
                  late double val;
                  if (double.tryParse(value) != null) {
                    val = double.parse(value);
                  } else if (int.tryParse(value) != null) {
                    val = int.parse(value).toDouble();
                  } else {
                    val = 1.0;
                  }

                  if (val <= rang.start) return;
                  rang = RangeValues(rang.start, val);
                  setState(() {});
                  if (val > 120) {
                    rang = RangeValues(rang.start, val);
                  }
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget showText(String title, TextEditingController controller,
      {Function(String)? onC}) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          TextField(
            controller: controller,
            onChanged: onC,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
