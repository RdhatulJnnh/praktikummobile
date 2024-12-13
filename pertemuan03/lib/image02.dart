import 'package:flutter/material.dart';

class Image02 extends StatelessWidget{
  const Image02({super.key});
  @override  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Image.asset('assets/906945_370892279691576_1349359897_o.jpg'),
            Image.asset('assets/Gambar-kucing-7.jpg'),
            Image.asset('assets/Gambar-Kucing-Lucu-dan-Imut-300x300.jpg'),
            Image.asset('assets/kucing.jpg'),
            Image.asset('assets/kucing5-onhits.jpg'),
            Image.asset('assets/gambar6.jpg'),
          ],
        )
      ),
    );
  }
  }