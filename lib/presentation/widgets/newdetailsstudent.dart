import 'package:flutter/material.dart';



class NewsViewStudent extends StatelessWidget {
  final String news;
  
  const NewsViewStudent({super.key, required this.news});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Center(
        child: Text('Detalles de la noticia: $news'),
      ),
    );
  }
}