import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ludo_flutter/constant/asset_constant.dart';
import 'package:ludo_flutter/constant/color_const.dart';
import 'package:ludo_flutter/constant/string_constant.dart';
import 'package:ludo_flutter/providers/ludo_provider.dart';
import 'package:ludo_flutter/widgets/board_widget.dart';
import 'package:ludo_flutter/widgets/dice_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    // Temporary test: simulate winners after 1 second
    // Future.delayed(Duration(seconds: 2), () {
    //   // ignore: use_build_context_synchronously
    //   var provider = context.read<LudoProvider>();
    //   provider.winners.addAll(const [
    //     LudoPlayerType.green,
    //     LudoPlayerType.yellow,
    //     LudoPlayerType.blue,
    //   ]);
    //   provider.notifyListeners();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          height: Device.height,
          width: Device.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ludoBg),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BounceInDown(child: BoardWidget()),
                  SizedBox(height: 2.5.h),
                  Center(
                    child: SizedBox(
                      width: 6.5.h,
                      height: 6.5.h,
                      child: BounceInUp(child: DiceWidget()),
                    ),
                  ),
                ],
              ),
              Consumer<LudoProvider>(
                builder: (context, value, child) {
                  if (value.winners.length != 3) return const SizedBox.shrink();
                  return Container(
                    height: Device.height,
                    width: Device.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ludoBg),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: ZoomIn(
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.amber.shade900,
                              width: 1,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 6),
                                blurRadius: 15,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SvgPicture.asset(
                                  winSvg,
                                  height: 22.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 2.5.h),
                              // 🏆 Title
                              Text(
                                congratulations,
                                style: TextStyle(
                                  color: black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 1.5.h),
                              Text(
                                "$winners ${value.winners.map((e) => e.name.toUpperCase()).join(", ")}",
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 3.h),
                              ElevatedButton.icon(
                                onPressed: () {
                                  value.resetGame();
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 50,
                                    vertical: 16,
                                  ),
                                  backgroundColor: Colors.green.shade700,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  elevation: 8,
                                ),
                                icon: const Icon(Icons.refresh, color: white),
                                label: Text(
                                  playAgain,
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    color: white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
