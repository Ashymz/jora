import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_app/pages/create_wallet.dart';
import 'package:jora_app/utils/media.dart';
import 'package:jora_app/widgets/button.dart';

class EmptyWallet extends StatefulWidget {
  const EmptyWallet({super.key});

  @override
  State<EmptyWallet> createState() => _EmptyWalletState();
}

class _EmptyWalletState extends State<EmptyWallet> {
  @override
  Widget build(BuildContext context) {
    Color myColor = const Color.fromARGB(255, 124, 12, 180);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(0.85)),
        child: WillPopScope(
          onWillPop: () async{
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              leading: const Icon(Icons.arrow_back),
              title: const Text(
                'Wallet',
              ),
            ),
            body: Center(
                child: Column(
            
              children: [
                const SizedBox(height: 165),
                const Text('No Wallet Account',
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                const Text('You do not have a Wallet account yet',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal)),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: GestureDetector(
                      onTap: () {
                        Get.to(const CreateWallet());
                      },
                      child: Custombutton.button(myColor, 'Create Wallet')),
                )
              ],
            )),
          ),
        ));
  }
}
