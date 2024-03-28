import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_app/database/db.dart';
import 'package:jora_app/pages/fund_wallet.dart';
import 'package:jora_app/utils/functions.dart';
import 'package:jora_app/utils/media.dart';
import 'package:jora_app/widgets/button.dart';
import 'package:jora_app/widgets/notify.dart';

class WalletBalance extends StatefulWidget {
  const WalletBalance({super.key});

  @override
  State<WalletBalance> createState() => _WalletBalanceState();
}

class _WalletBalanceState extends State<WalletBalance> {
  late double savedAmount;

  @override
  void initState() {
    super.initState();
    loadSavedAmount();
  }

  Future<void> loadSavedAmount() async {
    savedAmount = await LocalStorage.getSavedAmount() ?? 0.0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Color myColor = Color.fromARGB(255, 247, 202, 242);
    Color myColor1 = Color.fromARGB(255, 124, 12, 180);
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
              'Wallet',
            ),
          ),
          body: Container(
              height: height,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Card(
                      color: myColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    formatMoney(savedAmount),
                                    style: TextStyle(
                                      color: myColor1,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 31,
                                    ),
                                  ),
                                  const Row(
                                    children: [
                                      Center(
                                        child: Text.rich(
                                          TextSpan(
                                            text: 'Current Balance',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  )
                                ]),
                            ElevatedButton(
                              onPressed: () {
                                _showWalletDialog();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: myColor1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 3),
                                  Text('Fund Wallet',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Transaction History',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            color: Color.fromARGB(196, 246, 236, 236),
                            shadowColor: Colors.transparent,
                            elevation: 0,
                            margin: EdgeInsets.all(16),
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Transaction ID: 12345',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '23/10/2020 | 9:30 AM',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.transparent,
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Icon(
                                            Icons.account_balance_wallet,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 13),
                                      const Column(children: [
                                        Text(
                                          'Top Up',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Credit',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ])
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            'Amount',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            formatMoney(10000),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      Chip(
                                        backgroundColor:
                                            Color.fromARGB(255, 190, 228, 146),
                                        side: BorderSide.none,
                                        label: Text('Successful',
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 60, 145, 63))),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Color.fromARGB(196, 246, 236, 236),
                            shadowColor: Colors.transparent,
                            elevation: 0,
                            margin: EdgeInsets.all(16),
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Transaction ID: 12345',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '23/10/2020 | 9:30 AM',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.transparent,
                                          border: Border.all(
                                            color: Colors.blue,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Icon(
                                            Icons.add_shopping_cart,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 13),
                                      const Column(children: [
                                        Text(
                                          'Pharmacy Purchase',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Debit',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ])
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            'Amount',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            formatMoney(10000),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      Chip(
                                        backgroundColor:
                                            Color.fromARGB(255, 240, 171, 169),
                                        side: BorderSide.none,
                                        label: Text('Failed',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 230, 28, 28))),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }

  Future<void> _showWalletDialog() async {
    Color myColor1 = Color.fromARGB(255, 124, 12, 180);
    final TextEditingController amountController = TextEditingController();

    void saveAmountLocally(double additionalAmount) async {
      double existingAmount = await LocalStorage.getSavedAmount() ?? 0.0;
      double newTotal = existingAmount + additionalAmount;

      await LocalStorage.saveAmount(newTotal);
      print('Amount refunded and saved locally: $additionalAmount');
    }

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 0.85),
            child: WillPopScope(
                onWillPop: () async {
                  return true;
                },
                child: Dialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 4.8,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: height / 2.2,
                    child: Stack(
                      children: [
                        Container(
                          height: height,
                          width: width,
                          color: Colors.transparent,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      height: 60,
                                    ),
                                    SizedBox(
                                      width: width / 20,
                                    ),
                                    // const Spacer(),
                                    Text(
                                      'View Request',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Spacer(),

                                    // SizedBox(
                                    //   width: width / 15,
                                    // ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 420,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Form(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 15, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 7,
                                                      left: 0,
                                                      right: 0),
                                                  child: Image.asset(
                                                      'assets/wallet.png',
                                                      width: 100,
                                                      height: 100))
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 5, 15, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 7,
                                                    left: 0,
                                                    right: 0),
                                                child: Text(
                                                  'Add Money to your wallet',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Gilroy Medium',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 10, 15, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 7,
                                                    left: 0,
                                                    right: 0),
                                                child: Text(
                                                  'Amount',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Gilroy Medium',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            controller: amountController,
                                            autofocus: false,
                                            style: TextStyle(
                                                fontSize: height / 50,
                                                color: Colors.black,
                                                fontFamily: ''),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              // filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: '0.0',
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: height / 45,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(
                                              20,
                                            ))),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 0, 15),
                                      child: GestureDetector(
                                          onTap: () {
                                            String enteredAmountText =
                                                amountController.text.trim();

                                            if (enteredAmountText.isNotEmpty) {
                                              double enteredAmount =
                                                  double.parse(
                                                      enteredAmountText);
                                              saveAmountLocally(enteredAmount);
                                              Get.to(const FundWallet());
                                            } else {
                                              alert(
                                                context,
                                                'error',
                                                'Amount is empty. Please enter a valid amount.',
                                              );
                                              print(
                                                  'Amount is empty. Please enter a valid amount.');
                                            }
                                          },
                                          child: Custombutton.button(
                                              myColor1, 'Continue')),
                                    )),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: -0,
                          right: -0,
                          child: Transform.translate(
                            offset: Offset(0.0, 0),
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.transparent),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 23,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}
