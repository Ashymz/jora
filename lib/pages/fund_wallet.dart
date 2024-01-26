import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_app/pages/add_card.dart';
import 'package:jora_app/utils/media.dart';
import 'package:jora_app/widgets/button.dart';

class FundWallet extends StatefulWidget {
  const FundWallet({super.key});

  @override
  State<FundWallet> createState() => _FundWalletState();
}

class _FundWalletState extends State<FundWallet> {
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
              'Fund Wallet',
            ),
          ),
          body: Container(
              height: height,
              width: width,
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(),
                            child: ListTile(
                              onTap: () {
                              
                              },
                              leading: Radio(
                                activeColor: Colors.red,
                                splashRadius: 20,
                                value: false,
                                groupValue: false,
                                onChanged: (bool? value) {},
                              ),
                              title: Row(
                                children: [
                                
                                  Image.asset(
                                    'assets/visacard.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  SizedBox(
                                      width: 10), 
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                    
                                      Text(
                                        '**** **** **** 1234',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                     
                                      Text(
                                        'Expiry: 12/24',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 24,
                                ),
                                onPressed: () {
                                  // Handle delete
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.symmetric(),
                            child: ListTile(
                              onTap: () {
                              
                              },
                              leading: Radio(
                                activeColor: Colors.red,
                                splashRadius: 20,
                                value: true,
                                groupValue: true,
                                onChanged: (bool? value) {},
                              ),
                              title: Row(
                                children: [
                                  
                                  Image.asset(
                                    'assets/mastercard.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  SizedBox(
                                      width: 10), 
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      
                                      Text(
                                        '**** **** **** 1234',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      
                                      Text(
                                        'Expiry: 12/24',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 24,
                                ),
                                onPressed: () {
                               
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25, left: 20, right: 20),
                            child: Image.asset('assets/Line.png'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(const AddCard());
                            },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: myColor,
                                  ),
                                  Text(
                                    'Add Card',
                                    style: TextStyle(color: myColor),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: GestureDetector(
                            onTap: () {},
                            child: Custombutton.button(myColor, 'Fund')),
                      ))
                ],
              )),
        ));
  }
}
