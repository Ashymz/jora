import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_app/pages/wallet_bal.dart';
import 'package:jora_app/utils/media.dart';
import 'package:jora_app/widgets/button.dart';
import 'dart:math';

import 'package:jora_app/widgets/notify.dart';

class CreateWallet extends StatefulWidget {
  const CreateWallet({super.key});

  @override
  State<CreateWallet> createState() => _CreateWalletState();
}

class _CreateWalletState extends State<CreateWallet> {
  TextEditingController walletIdController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    walletIdController.text = generateWalletId();
  }

  String generateWalletId() {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();

   
    String randomSuffix = generateRandomSuffix(2);

    String walletId = '$timestamp$randomSuffix';

    return walletId;
  }

  String generateRandomSuffix(int maxLength) {
    const alphanumeric = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Random random = Random();
    int length = min(
        maxLength, alphanumeric.length); 
    String result = '';

    for (int i = 0; i < length; i++) {
      result += alphanumeric[random.nextInt(alphanumeric.length)];
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color.fromARGB(255, 124, 12, 180);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(0.85)),
        child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back)),
            title: const Text(
              'Create Wallet',
            ),
          ),
          body: Container(
              height: height,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'Select Card to fund your wallet',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(22, 0, 0, 10),
                            child: Text(
                              'Name on Card',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextField(
                              controller: nameController,
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: height / 50,
                                  color: Colors.black,
                                  fontFamily: ''),
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                // filled: true,
                                fillColor: Colors.transparent,
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: height / 45,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(22, 0, 0, 10),
                            child: Text(
                              'Card Number',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextField(
                              controller: walletIdController,
                              readOnly: true,
                              autofocus: false,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontSize: height / 50,
                                  color: Colors.black,
                                  fontFamily: ''),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
                                // filled: true,
                                fillColor: Colors.transparent,
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: height / 45,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: GestureDetector(
                            onTap: () {
                              String enteredName = nameController.text.trim();

                              if (enteredName.isNotEmpty) {
                                Get.to(const WalletBalance());
                              } else {
                                alert(context, 'error',
                                    'Name is empty. Please enter a valid name!');
                                print(
                                    'Name is empty. Please enter a valid name.');
                              }
                            },
                            child:
                                Custombutton.button(myColor, 'Create Wallet')),
                      ))
                ],
              )),
        ));
  }
}
