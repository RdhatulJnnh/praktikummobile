import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Controller untuk input angka
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();

  // Variabel untuk menyimpan hasil
  double? result;

  // Fungsi untuk menghitung berdasarkan operasi
  void calculate(String operation) {
    double num1 = double.tryParse(_firstNumberController.text) ?? 0.0;
    double num2 = double.tryParse(_secondNumberController.text) ?? 0.0;

    setState(() {
      if (operation == "+") {
        result = num1 + num2;
      } else if (operation == "-") {
        result = num1 - num2;
      } else if (operation == "*") {
        result = num1 * num2;
      } else if (operation == "/") {
        if (num2 != 0) {
          result = num1 / num2;
        } else {
          result = double.nan; // Tidak bisa membagi dengan nol
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pemilihan Perhitungan"),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNumberController,
              decoration: InputDecoration(
                labelText: "Masukkan Angka Pertama",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _secondNumberController,
              decoration: InputDecoration(
                labelText: "Masukkan Angka Kedua",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => calculate("+"),
                  child: Text("+"),
                ),
                ElevatedButton(
                  onPressed: () => calculate("-"),
                  child: Text("-"),
                ),
                ElevatedButton(
                  onPressed: () => calculate("*"),
                  child: Text("×"),
                ),
                ElevatedButton(
                  onPressed: () => calculate("/"),
                  child: Text("÷"),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              result == null
                  ? "Hasil: "
                  : "Hasil: ${result!.isNaN ? "Tidak dapat membagi dengan nol" : result}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}