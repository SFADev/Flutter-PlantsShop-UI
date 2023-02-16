import 'package:flutter/material.dart';
import 'package:plant_app_ui/screens/screens_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // backgroundImage
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'assets/background.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
              ),
              // AppTitle
              const Positioned(
                top: 320,
                child: Text(
                  'Find Plants',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontFamily: 'PoppinsSemiBold',
                  ),
                ),
              ),
              // SubTitle
              const Positioned(
                top: 450,
                child: SizedBox(
                  height: 66,
                  width: 209,
                  child: Text(
                    'Find your favorite plants on our shop',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'PoppinsSemiBold',
                    ),
                  ),
                ),
              ),
              // Button
              Positioned(
                bottom: 28,
                child: Container(
                  width: 277,
                  height: 67,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff193E46),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'PoppinsSemiBold',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
