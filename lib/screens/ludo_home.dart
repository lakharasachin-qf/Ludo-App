import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ludo_flutter/constant/asset_constant.dart';
import 'package:ludo_flutter/constant/color_const.dart';
import 'package:ludo_flutter/constant/string_constant.dart';
import 'package:ludo_flutter/screens/main_screen.dart';
import 'package:sizer/sizer.dart';

class LudoHomeScreen extends StatefulWidget {
  const LudoHomeScreen({super.key});

  @override
  State<LudoHomeScreen> createState() => _LudoHomeScreenState();
}

class _LudoHomeScreenState extends State<LudoHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparent,
      body: Stack(
        children: [
          Container(
            height: Device.height,
            width: Device.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ludoBg),
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Overlay for Start Game Button
          Bounce(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 1.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: green,
                    shadowColor: Colors.black45,
                    elevation: 8,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  },
                  child: Text(
                    startGame,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
