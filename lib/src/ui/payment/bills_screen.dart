import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class PayBillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Payment Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: [
          PaymentServiceBox(
            title: 'Airtime',
            icon: Icons.phone_android,
            onTap: () {
              // TODO: Implement VTPass API for airtime purchase
            },
          ),
          PaymentServiceBox(
            title: 'DSTV',
            icon: Icons.tv,
            onTap: () {
              // TODO: Implement VTPass API for DSTV payment
            },
          ),
          PaymentServiceBox(
            title: 'Electricity',
            icon: Icons.power,
            onTap: () {
              // TODO: Implement VTPass API for electricity bill payment
            },
          ),
          PaymentServiceBox(
            title: 'Data',
            icon: Icons.data_usage,
            onTap: () {
              // TODO: Implement VTPass API for data purchase
            },
          ),
        ],
      ),
    );
  }
}

class PaymentServiceBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  PaymentServiceBox({
     this.title,
     this.icon,
     this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}

