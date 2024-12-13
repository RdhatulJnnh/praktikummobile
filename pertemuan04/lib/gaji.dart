import 'package:flutter/material.dart';

class Gaji extends StatefulWidget {
  @override
  _GajiState createState() => _GajiState();
}

class _GajiState extends State<Gaji> {
  // Properti untuk menyimpan data input
  String? npm;
  String? nama;
  String? pilihanGolongan;
  String? pilihanStatus;
  int masaKerja = 0;

  int calculateTunjangan() {
    int tunjangan = 0;

    if (pilihanGolongan == "I") {
      tunjangan = 2500000;
    } else if (pilihanGolongan == "II") {
      tunjangan = 3000000;
    } else if (pilihanGolongan == "III") {
      tunjangan = 3500000;
    } else {
      tunjangan = 400000;
    }

    return tunjangan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hitung Tunjangan Gaji"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pilih Golongan:", style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: pilihanGolongan,
              hint: Text("Pilih Golongan"),
              items: ["I", "II", "III", "IV"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  pilihanGolongan = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text("Pilih Status:", style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: pilihanStatus,
              hint: Text("Pilih Status"),
              items: ["Menikah", "Belum Menikah"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  pilihanStatus = value;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "Masa Kerja (tahun)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  masaKerja = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final tunjangan = calculateTunjangan();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Hasil Tunjangan"),
                      content: Text("Tunjangan Gaji Pokok: Rp $tunjangan"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Hitung Tunjangan"),
            ),
          ],
        ),
      ),
    );
  }
}
