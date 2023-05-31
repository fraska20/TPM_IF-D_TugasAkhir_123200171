import 'package:flutter/material.dart';

class CurrencyConvertPage extends StatefulWidget {
  @override
  _CurrencyConvertPageState createState() => _CurrencyConvertPageState();
}

class _CurrencyConvertPageState extends State<CurrencyConvertPage> {
  double amount = 0.0;
  double convertedAmount = 0.0;
  String selectedCurrency = 'IDR';

  final Map<String, double> conversionRates = {
    'IDR': 1, // 1 IDR = 1 IDR
    'USD': 0.000070, // 1 USD = 0.000070 IDR
    'SAR': 0.00026, // 1 SAR = 0.00026 IDR
    'CNY': 0.00046, // 1 CNY = 0.00046 IDR
  };

  void convertCurrency() {
    setState(() {
      convertedAmount = amount * conversionRates[selectedCurrency];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.red,
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Currency Converter',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 16.0),
              TextField(
                style: TextStyle(fontSize: 16, color: Colors.white),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    amount = double.tryParse(value) ?? 0.0;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor:
                      Colors.grey, // Dark mode text field background color
                ),
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.grey[900],
                style: TextStyle(fontSize: 20, color: Colors.white),
                value: selectedCurrency,
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value;
                  });
                },
                items: conversionRates.keys
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Currency',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[900],
                  // Dark mode dropdown background color
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: convertCurrency,
                child: Text('Convert'),
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.blue[400], // Ubah warna latar belakang di sini
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Converted Amount: ${convertedAmount.toStringAsFixed(2)} ${selectedCurrency.toUpperCase()}',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
