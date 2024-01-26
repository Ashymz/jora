import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_app/pages/empty_wallet.dart';
import 'package:jora_app/widgets/animation_splash.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with WidgetsBindingObserver {
  void launch() {
    Timer(const Duration(seconds: 3), () {
      Get.to(const EmptyWallet());
    });
  }

  @override
  void initState() {
    super.initState();
    launch();
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 0.85),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.transparent,
                    height: height,
                    width: width,
                  ),
                  Center(
                    child: const HeartbeatAnimation(
                      child: Center(
                          child: Text('JORA',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
