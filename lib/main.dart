import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ludo_flutter/constant/color_const.dart';
import 'package:ludo_flutter/constant/string_constant.dart';
import 'package:ludo_flutter/screens/ludo_home.dart';
import 'package:ludo_flutter/utils/helper.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'providers/ludo_provider.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  setSystemUIOverlayStyle();
  setPreferredOrientation();
  return runApp(
    ChangeNotifierProvider(
      create: (_) => LudoProvider()..startGame(),
      child: const Root(),
    ),
  );
}

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    ///Initialize images and precache it
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.wait([
        precacheImage(const AssetImage("assets/images/board.png"), context),
        precacheImage(
          const AssetImage("assets/images/main_ludo_board.png"),
          context,
        ),
        precacheImage(const AssetImage("assets/images/ludo_bg.png"), context),
        precacheImage(const AssetImage("assets/svgs/win.svg"), context),
        precacheImage(const AssetImage("assets/images/dice/1.png"), context),
        precacheImage(const AssetImage("assets/images/dice/2.png"), context),
        precacheImage(const AssetImage("assets/images/dice/3.png"), context),
        precacheImage(const AssetImage("assets/images/dice/4.png"), context),
        precacheImage(const AssetImage("assets/images/dice/5.png"), context),
        precacheImage(const AssetImage("assets/images/dice/6.png"), context),
        precacheImage(const AssetImage("assets/images/dice/draw.gif"), context),
        precacheImage(const AssetImage("assets/images/crown/1st.png"), context),
        precacheImage(const AssetImage("assets/images/crown/2nd.png"), context),
        precacheImage(const AssetImage("assets/images/crown/3rd.png"), context),
      ]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          color: white,
          title: appName,
          home: LudoHomeScreen(),
        );
      },
    );
  }
}
