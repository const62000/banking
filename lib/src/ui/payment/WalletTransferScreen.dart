import 'package:alok/src/models/User.dart';
import 'package:flutter/material.dart';


class WalletTransferScreen extends StatefulWidget {
  final User sender;
  final List<User> recipients;

  WalletTransferScreen({ this.sender,  this.recipients});

  @override
  _WalletTransferScreenState createState() => _WalletTransferScreenState();
}

class _WalletTransferScreenState extends State<WalletTransferScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _recipientController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    final amount = double.tryParse(value);
                    if (amount == null || amount <= 0) {
                      return 'Please enter a valid amount';
                    }
                    if (amount > widget.sender.balance) {
                      return 'Insufficient balance';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: DropdownButtonFormField<User>(
                  value: null,
                  items: widget.recipients.map((user) {
                    return DropdownMenuItem(
                      value: user ,
                      child: Text(user.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    _recipientController.text = value.id;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Recipient',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a recipient';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    final amount = double.parse(_amountController.text);
                    final recipientId = _recipientController.text;
                    final recipient =
                    widget.recipients.firstWhere((user) => user.id == recipientId);
                    final sender = widget.sender;
                    // sender.balance -= amount;
                    // recipient.balance += amount;
                    // TODO: Update balances and save transaction
                    Navigator.pop(context);
                  }
                },
                child: const Text('Transfer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
