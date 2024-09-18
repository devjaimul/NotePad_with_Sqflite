import 'dart:async';


import 'package:flutter/material.dart';
import 'package:notepad/views/home/home_screen.dart';
import 'package:notepad/views/home/navbar/custom_nav_bar.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CustomNavbar(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network('https://imgs.search.brave.com/ArtF_wgvwWqvQt1aO580KN-7DkAsUmAtmh-zOEFKsI8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/bWF3Yml6LmNvbS5i/ZC9hcHBsaWNhdGlv/bi92aWV3cy9tb2R1/bGUvbG9nb19pbWFn/ZS9GYXJpZHB1cl9Q/b2x5dGVjaG5pY19J/bnN0aXR1dGUtTUFX/Yml6X1N1c3RhaW5h/YmxlX0JyYW5kaW5n/Ll8uXy5qcGc',


               ),
              const SizedBox(
                height: 10,
              ),
              const Text('Poly',style: TextStyle(fontSize: 30,)),
              const Text('NotePad App',style: TextStyle(fontSize: 30))
            ],
          ),
        ));
  }
}