import 'package:alok/src/ui/investment/investment_details_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class InvestmentScreen extends StatelessWidget {
  final List<InvestmentPlan> plans = [
    InvestmentPlan(
      name: 'Standard Plan',
      duration: '12 months',
      amount: '\$10,000',
      interest: '12%',
    ),
    InvestmentPlan(
      name: 'Gold Plan',
      duration: '24 months',
      amount: '\$25,000',
      interest: '15%',
    ),
    InvestmentPlan(
      name: 'Platinum Plan',
      duration: '36 months',
      amount: '\$50,000',
      interest: '18%',
    ),
    InvestmentPlan(
      name: 'Diamond Plan',
      duration: '48 months',
      amount: '\$100,000',
      interest: '20%',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investment Plans'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: plans.map((plan) {
          return InvestmentPlanCard(
            plan: plan,
            onTap: () {
              // TODO: Navigate to master page to subscribe or purchase plan
            },
          );
        }).toList(),
      ),
    );
  }
}

class InvestmentPlan {
  final String name;
  final String duration;
  final String amount;
  final String interest;

  InvestmentPlan({
     this.name,
     this.duration,
     this.amount,
     this.interest,
  });
}

class InvestmentPlanCard extends StatelessWidget {
  final InvestmentPlan plan;
  final VoidCallback onTap;

  InvestmentPlanCard({
     this.plan,
     this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => InvestmentPlanDetailPage(),
        )
        );
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              plan.name,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Duration: ${plan.duration}',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Amount: ${plan.amount}',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Interest: ${plan.interest}',
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}

