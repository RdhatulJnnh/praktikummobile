import 'package:flutter/material.dart';

class RadioButtonExample extends StatefulWidget {
  @override
  _RadioButtonExampleState createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<RadioButtonExample> {
  String _selectedHobby = ''; // Menyimpan hobi yang dipilih

  final List<String> _hobbies = ["Bermain Musik", "Olahraga", "Membaca"]; 

  // Menyimpan status checkbox untuk setiap hobi 
  final Map<String, bool> _hobbySelections = { 
    "Bermain Musik": false, 
    "Olahraga": false, 
    "Membaca": false,  
  }; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh RadioButton'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Hobi Anda:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            RadioListTile<String>(
              title: Text('Bermain Musik'),
              value: 'Bermain Musik',
              groupValue: _selectedHobby,
              onChanged: (value) {
                setState(() {
                  _selectedHobby = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Olahraga'),
              value: 'Olahraga',
              groupValue: _selectedHobby,
              onChanged: (value) {
                setState(() {
                  _selectedHobby = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Membaca'),
              value: 'Membaca',
              groupValue: _selectedHobby,
              onChanged: (value) {
                setState(() {
                  _selectedHobby = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Hobi yang dipilih: ${_selectedHobby.isEmpty ? 'Belum dipilih' : _selectedHobby}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}