import 'package:flutter/material.dart';

class Image03 extends StatelessWidget{
  const Image03({super.key});
  @override  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            buildImageCard('assets/906945_370892279691576_1349359897_o.jpg',Colors.red),
            buildImageCard('assets/Gambar-kucing-7.jpg',Colors.green),
            buildImageCard('assets/Gambar-Kucing-Lucu-dan-Imut-300x300.jpg',Colors.blue),
            buildImageCard('assets/kucing.jpg',Colors.yellow),
            buildImageCard('assets/kucing5-onhits.jpg',Colors.orange),
            buildImageCard('assets/th?id=OIP.3lAsEAvCELCH2DzkfJi_IwHaEo&pid=Api&P=0&h=180.jpg', Colors.purple),
            
          ],
        ),
      ),
    );
  }
  Widget buildImageCard(String imagePath,Color color){
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius:BorderRadius.circular(10),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        height: 150.0,
        width:double.infinity,
      ),
    ),
    );
  }
  }