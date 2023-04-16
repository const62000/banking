import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPaymentSource = 'Card'; // Default to Card
  bool _showSubmitButton = false;

  final TextEditingController _amountController = TextEditingController();


  void _onPaymentSourceChanged(String newValue) {
    setState(() {
      _selectedPaymentSource = newValue;
      _showSubmitButton = true;
    });
  }


  void _onSubmitButtonPressed() {
    if (_selectedPaymentSource == 'Card' ||
        _selectedPaymentSource == 'Transfer' ||
        _selectedPaymentSource == 'USSD') {
      var amount;
      Navigator.push(
        context,
        MaterialPageRoute(
          // builder: (context) => PayStack(),
        ),
      );
    } else if (_selectedPaymentSource == 'Wallet') {
      // Perform wallet payment logic here
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make Payment'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount to Pay',
                hintText: 'Enter Amount',
                border: OutlineInputBorder(),
              ),
              controller: _amountController,
            ),
            const SizedBox(height: 16),
            const Text('Select Payment Source'),
            DropdownButton<String>(
              value: _selectedPaymentSource,
              items: <String>['Card', 'Transfer', 'USSD', 'Wallet']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: _onPaymentSourceChanged,
            ),
            const SizedBox(height: 16),
            if (_showSubmitButton)
              ElevatedButton(
                onPressed: _onSubmitButtonPressed,
                child: const Text('Pay'),
              ),
          ],
        ),
      ),
    );
  }
}
