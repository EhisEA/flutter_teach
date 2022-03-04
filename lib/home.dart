import 'package:flu_cu_001/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showFav = true;

  @override
  Widget build(BuildContext context) {
    bool y = true;
    return Scaffold(
      body: InkWell(
        onTap: () async {
          setState(() {
            // await Future.delayed(Duration(seconds: 1));
            showFav = !showFav;
          });
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showFav) Icon(Icons.favorite),
              if (!showFav) Icon(Icons.car_rental),

              //  Icon(showFav ? Icons.favorite : Icons.car_rental)
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    // await Future.delayed(Duration(seconds: 1));
                    showFav = !showFav;
                  });
                },
                child: Text("Change"),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (val) {
                  setState(
                    () {
                      // await Future.delayed(Duration(seconds: 1));
                      showFav = !showFav;
                    },
                  );
                },
              ),

              ElevatedButton(
                onPressed: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.clear();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text("Log out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
