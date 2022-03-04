import 'package:flu_cu_001/home.dart';
import 'package:flu_cu_001/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    print("her....");
    checkLogin();
    super.initState();
  }

  checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? user = pref.getString("user");
    await Future.delayed(const Duration(seconds: 3));
    if (user == null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child:
            //Icon(Icons.ac_unit_outlined)
            Text("Splanshn......"),
      ),
    );
  }
}
