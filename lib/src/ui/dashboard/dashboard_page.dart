
import 'package:alok/src/ui/investment/investment_screen.dart';
import 'package:alok/src/ui/payment/WalletTransferScreen.dart';
import 'package:alok/src/ui/payment/bills_screen.dart';
import 'package:alok/src/ui/payment/payment_screen.dart';
import 'package:alok/src/ui/payment/transfer_page.dart';
import 'package:alok/src/ui/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:alok/res.dart';
import 'package:alok/src/models/DashboardModel.dart';
import 'package:alok/src/models/LoginResponse.dart';
import 'package:alok/src/network/service.dart';
import 'package:alok/src/ui/agent/kyc_request.dart';
import 'package:alok/src/ui/dashboard/components.dart';
import 'package:alok/src/ui/user/CreateAccountPage.dart';

class DashBoardScreen extends StatefulWidget {

   DashBoardScreen({Key key, this.user}) : super(key: key);

  final LoginResponse user;

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
   LoginResponse user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  int numberOfAccounts = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final categories = Reposit.getCategories();
    final agentCategories = Reposit.getAgentCategories();
    final username = "${user.firstName}";
    final depositBalance = user.noOfDepositRequest.toDouble();
    final availBalance = user.availableBalance.toDouble();
    print('availBalance: $availBalance');

    void _showBottomSheet() {
      showModalBottomSheet(
          context: context,
          builder: (context) =>
              Container(
                  width: 375,
                  height: 454,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          child: Text(
                              'What do you want \nto pay for?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'AnybodyBold'
                              )
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(),
                              ),
                            );
                          },
                          child: Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 15.0),
                                    child: Icon(
                                      Icons.credit_card_sharp,
                                      size: 30,
                                    )
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: Colors.black, fontSize: 16, height: 1.5),
                                    children: <TextSpan>[
                                      TextSpan(text: 'Pay your contribution  \n'),
                                      TextSpan(text: 'Your daily payment for your contribution ', style: TextStyle(color: Colors.black26, fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30,
                                )
                              ]
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 1,
                          width: 335,
                          color: Colors.blue.shade300,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => CameraScreen(),
                            //   ),
                            // );
                          },
                          child: Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 15.0),
                                    child: Icon(
                                      Icons.card_membership,
                                      size: 30,
                                    )
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: Colors.black, fontSize: 16, height: 1.5),
                                    children: <TextSpan>[
                                      TextSpan(text: 'Pay for an investment plan  \n'),
                                      TextSpan(text: 'Make a one time payment for investment ', style: TextStyle(color: Colors.black26, fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30,
                                )
                              ]
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 1,
                          width: 335,
                          color: Colors.blue.shade300,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateNewAccountPage(),
                              ),
                            );
                          },
                          child: Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 15.0),
                                    child: Icon(
                                      Icons.account_balance,
                                      size: 30,
                                    )
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: Colors.black, fontSize: 16, height: 1.5),
                                    children: <TextSpan>[
                                      TextSpan(text: 'Create an account  \n'),
                                      TextSpan(text: 'Create multiple accounts for contribution ', style: TextStyle(color: Colors.black26, fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30,
                                )
                              ]
                          ),
                        ),
                      ],
                    ),
                  )
              )
      );
    }

    return Scaffold(
      backgroundColor: Res.primaryColor,
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            // container appbar
            renderActionbar(context, username),
            buildAccountStrip(context, availBalance, depositBalance),

            SizedBox(height: 20),
            buildExpanded(categories, agentCategories),


          ],
        ),
      ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.transfer_within_a_station),
              label: 'Transfer',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: 'Bills',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              label: 'Investments',
            ),
          ],
          // currentIndex: 0,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              if (index == 2) {
                _showBottomSheet();
              } else if(index == 1) {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  TransferPage()),
                );
              } else if (index == 3) {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  PayBillsPage()),
                );
              }else if (index == 4) {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  InvestmentScreen()),
                );
              }
            });
          },
        ),
    );


  }



  Expanded buildExpanded(
      List<CatModel> categories, List<CatModel> agentCategories) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children:  [
                Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
              itemCount: 11,
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: Icon(
                    Icons.keyboard_double_arrow_down_rounded
                  ),
                  title: Text('Transaction Nindex'),
                  subtitle: Text('Details of Transaction Nindex'),
                  trailing: Text('\N100'),
                );
              },
            ),
          ),
          ),
        ],
      ),

      // child: user.role == 'user'
      //     ? listView(user.role, categories)
      //     : listView(user.role, agentCategories),
    ));
  }

  Container buildAccountStrip(context, availBalance, depositBalance) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: double.infinity,
        child: user.role == 'user'
            ? buildUserColumn(context, depositBalance, availBalance)
            : buildAgentColumn(context),
      ),
    );
  }

  Column buildAgentColumn(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => KYCRequestPage())),
          child: Text(
            'KYC request : ${user.noOfDepositRequest}',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => KYCRequestPage()));
          },
          child: Text(
            'View Details',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  Column buildUserColumn(context, depositBalance, availBalance) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // user.isAccountCreated == 0
             Row(
               children: [
                 Text(
                    'Wallet balance \n $availBalance',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                 Spacer(),
                 Text(
                    'Available Deposit \n $depositBalance',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
               ],
             ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WalletTransferScreen(),
                  ),
                );
              },
              child: ElevatedButton(
                child: Text(
                  'Withdraw',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black
                  ),
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: ElevatedButton(
                child: Text(
                  'Withdraw',
                  style: TextStyle(
                      fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child:   Column(
            children: [
              Text(
                'Number of accounts',
                style: TextStyle(
                    fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                '0',
                style: TextStyle(
                    fontSize: 19
                ),
              ),
              Visibility(
                visible: numberOfAccounts >= 0,
                child: ElevatedButton(onPressed: () {
                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CreateNewAccountPage(),
                                  ),
                                );
                },
                    child: Text(
                      'Create an account'
                    ),
                ),
              )
            ],
          ),
        ),

        // SizedBox(height: 20),
        // user.isAccountCreated == 0
        //     ? GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => CreateNewAccountPage(),
        //             ),
        //           );
        //         },
        //         child: btnCardView(titleTitle: "Create Account"))
        //     : Text('$availBalance',
        //         style: TextStyle(
        //           fontSize: 14,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.black,
        //         )),
      ],
    );
  }


}
