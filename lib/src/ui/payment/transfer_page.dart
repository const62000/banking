import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedAccountType;
  String _selectedBank;
  String _selectedWallet;
  double _amount;

  final List<String> _accountTypes = [
    'Account',
    'Pocket+ Wallet',
  ];

  final List<String> _banks = [
    'Access Bank',
    'First Bank',
    'GT Bank',
    'UBA',
    // add more banks here
  ];

  final List<String> _wallets = [
    'Pocket+ Paytag',
    // add more wallets here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // show menu here
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            DropdownButtonFormField<String>(
              value: _selectedAccountType,
              decoration: InputDecoration(
                labelText: 'Account type',
              ),
              items: _accountTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedAccountType = value;
                });
              },
            ),
            if (_selectedAccountType == 'Account')
              DropdownButtonFormField<String>(
                value: _selectedBank,
                decoration: InputDecoration(
                  labelText: 'Bank',
                ),
                items: _banks.map((bank) {
                  return DropdownMenuItem(
                    value: bank,
                    child: Text(bank),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedBank = value;
                  });
                },
              ),
            if (_selectedAccountType == 'Pocket+ Wallet')
              DropdownButtonFormField<String>(
                value: _selectedWallet,
                decoration: InputDecoration(
                  labelText: 'Wallet',
                ),
                items: _wallets.map((wallet) {
                  return DropdownMenuItem(
                    value: wallet,
                    child: Text(wallet),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedWallet = value;
                  });
                },
              ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter an amount';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid amount';
                }
                if (double.parse(value) <= 0) {
                  return 'Amount must be greater than zero';
                }
                return null;
              },
              onSaved: (value) {
                _amount = double.parse(value);
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Transfer'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  // perform transfer here
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}