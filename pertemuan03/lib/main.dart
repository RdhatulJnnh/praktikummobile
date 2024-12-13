import 'package:flutter/material.dart';
import 'image04.dart';

void main() {
  runApp(const Myapp());
}
class Myapp extends StatelessWidget{
  const Myapp({super.key});
  @override  
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'Praktikum 03',
      home:Image04(),
    );
  }
}