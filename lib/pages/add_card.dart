import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_app/pages/wallet_bal.dart';
import 'package:jora_app/utils/media.dart';
import 'package:jora_app/widgets/button.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    Color myColor = const Color.fromARGB(255, 124, 12, 180);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    bool value1 = false;
    bool switchValue = true;

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
              'Add Card',
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
                                'Add Card to fund your wallet',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
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
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                              child: TextField(
                                
                                autofocus: false,
                                keyboardType: TextInputType.name,
                                style: TextStyle(
                                    fontSize: height / 50,
                                    color: Colors.black,
                                    fontFamily: ''),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  
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
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                              child: TextField(
                              
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
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 10),
                                          child: Text(
                                            'Expiry Date',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        TextField(
                                          keyboardType: TextInputType.datetime,
                                          autofocus: false,
                                          style: TextStyle(
                                            fontSize: height / 50,
                                            color: Colors.black,
                                            fontFamily: '',
                                          ),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            fillColor: Colors.transparent,
                                            hintText: '',
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: height / 45,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 10),
                                          child: Text(
                                            'CVV',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        TextField(
                                          maxLength: 3,
                                          buildCounter: (BuildContext context,
                                                  {int? currentLength,
                                                  int? maxLength,
                                                  bool? isFocused}) =>
                                              null,
                                          readOnly: false,
                                          autofocus: false,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                            fontSize: height / 50,
                                            color: Colors.black,
                                            fontFamily: '',
                                          ),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            fillColor: Colors.transparent,
                                            hintText: '',
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: height / 45,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(22, 20, 0, 10),
                              child: Text(
                                'Card Pin',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextField(
                                
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
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  const Text(
                                    "Save Card",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Transform.scale(
                                    scale: 0.7,
                                    child: Switch(
                                      value: switchValue,
                                      activeColor: Colors.red,
                                      inactiveTrackColor: Colors.grey.shade300,
                                      inactiveThumbColor: Colors.white,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.padded,
                                      trackOutlineColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.transparent),
                                      overlayColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.transparent),
                                      onChanged: (value1) {
                                        setState(() {
                                          switchValue = value1;
                                        });
                                        print(value1);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: GestureDetector(
                            onTap: () {
                              Get.to(const WalletBalance());
                            },
                            child:
                                Custombutton.button(myColor, 'Create Wallet')),
                      ))
                ],
              )),
        ));
  }
}
