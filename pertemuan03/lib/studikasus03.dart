import 'package:flutter/material.dart';

class StudiKasus03 extends StatefulWidget {
  @override
  _StudiKasus03State createState() => _StudiKasus03State();
}

class _StudiKasus03State extends State<StudiKasus03> {
  // List item Dropdown
  final List<String> _hokageList = ['Hokage 1', 'Hokage 2', 'Hokage 3', 'Hokage 4', 'Hokage 5'];
  // URL gambar sesuai pilihan
  final Map<String, String> _hokageImages = {
    'Hokage 1': 'asset/gambar1.jpeg',
    'Hokage 2': 'asset/gambar2.jpeg',
    'Hokage 3': 'asset/gambar3.jpeg',
    'Hokage 4': 'asset/gambar4.jpeg',
    'Hokage 5': 'asset/gambar5.jpeg',
  };

  String? _selectedHokage; // Variabel untuk menampung pilihan
  String? _imageUrl; // Variabel untuk menampung URL gambar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studi Kasus 03'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Dropdown untuk memilih Hokage
            DropdownButton<String>(
              value: _selectedHokage,
              hint: const Text('Pilih Hokage'),
              isExpanded: true,
              items: _hokageList.map((hokage) {
                return DropdownMenuItem<String>(
                  value: hokage,
                  child: Text(hokage),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedHokage = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            // Tombol untuk memuat gambar
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _imageUrl = _hokageImages[_selectedHokage];
                });
              },
              child: const Text('Tampilkan Gambar'),
            ),
            const SizedBox(height: 16.0),
            // Menampilkan gambar jika URL tersedia
            if (_imageUrl != null)
              Expanded(
                child: Image.network(
                  _imageUrl!,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return const Center(child: Text('Gagal memuat gambar'));
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}