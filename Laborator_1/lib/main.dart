import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(LoanCalculatorApp());
}

class LoanCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoanCalculator(),
    );
  }
}

class LoanCalculator extends StatefulWidget {
  @override
  _LoanCalculatorState createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  double _amount = 0;
  int _months = 1;
  double _interestRate = 0;
  double _monthlyPayment = 0;

  void _calculateMonthlyPayment() {
    if (_interestRate > 0) {
      double monthlyInterest = _interestRate / 100;
      _monthlyPayment =
          _amount * monthlyInterest / (1 - pow(1 + monthlyInterest, -_months));
    } else {
      _monthlyPayment = _amount / _months;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Calculator'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Enter amount',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Amount'),
              onChanged: (value) {
                setState(() {
                  _amount = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Enter number of months',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              min: 1,
              max: 60,
              divisions: 59,
              label: '$_months luni',
              value: _months.toDouble(),
              onChanged: (value) {
                setState(() {
                  _months = value.toInt();
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Enter % per month',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Percent'),
              onChanged: (value) {
                setState(() {
                  _interestRate = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'You will pay the approximate amount monthly:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${_monthlyPayment.toStringAsFixed(2)}€',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Folosește backgroundColor în loc de primary
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              onPressed: _calculateMonthlyPayment,
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
