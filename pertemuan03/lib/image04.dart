import 'package:flutter/material.dart';

class Image04 extends StatelessWidget {
  const Image04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar dari URL'),
      ),
      body: SingleChildScrollView( // Agar konten dapat digulir
        child: Column(
          children: [
            buildImageCard('https://2.bp.blogspot.com/-Fdg_hx-eZoE/V5bOjR7ag2I/AAAAAAAACS0/jQsNVHC7tCUaCs3NpXs3RSDWwiNbigEgwCLcB/s1600/Gambar-kucing-7.JPG'),
            buildImageCard('http://4.bp.blogspot.com/-PEOjR_ZHuzQ/UY8lOuAzLHI/AAAAAAAANV8/lxO62KM_vZ4/s1600/906945_370892279691576_1349359897_o.jpg'),
            buildImageCard('https://3.bp.blogspot.com/-p-OugCKEAA8/WHDE81DF8II/AAAAAAAAABo/OQ1rQYmiWR0vi8JhUitBNfuU0ig5mlhHACLcB/s1600/kucing5-onhits.jpg'),
            buildImageCard('https://1.bp.blogspot.com/-HhlSz3w0mtk/U0DK-pXm8lI/AAAAAAAAEsM/mkA_XaADxwk/s1600/kucing.jpg'),
            buildImageCard('https://1.bp.blogspot.com/-YC9XnvqLmgs/VRJrFORfUNI/AAAAAAAAAGE/odg_SUFiEE8/s1600/Gambar-Kucing-Lucu-dan-Imut-300x300.jpg'),
            ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun kotak gambar
  Widget buildImageCard(String imageUrl) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Sudut melengkung
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Sudut melengkung untuk gambar
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover, // Memastikan gambar penuh di dalam kontainer
          height: 150.0, // Tinggi kontainer
          width: double.infinity, // Lebar penuh
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
            return Center(child: const Text('Gagal memuat gambar'));
          },
        ),
      ),
    );
  }
}