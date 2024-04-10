import 'package:eventview_application_1/presentation/screens.dart';
import 'package:flutter/material.dart';

import '../../../widgets/newdetailsstudent.dart';

class EvenViewStudent extends StatelessWidget {
  const EvenViewStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> newsList = [
      'Noticia  1',
      'Noticia  2',
      'Noticia  3',
      // Agrega más noticias aquí
    ];
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) =>
                 NewsViewStudent(news: newsList[index])
                )
                );
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:[
                    BoxShadow(color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3))
                  ]
                ),
                child: Card(
                  color: const Color.fromRGBO(15, 22, 81, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Asegúrate de que la tarjeta tenga bordes redondeados
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
                        child: Image.network('https://firebasestorage.googleapis.com/v0/b/eventview-app.appspot.com/o/events%2Fevents.jpg?alt=media&token=63b354bf-83ad-4eb2-aeec-f6cbd3e7fa56',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height:   200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                          child: Text(
                            newsList[index],
                            style: const TextStyle(
                              fontSize:  24, // Ajusta el tamaño del texto según sea necesario
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                            
                          ),
                        ),
                      
                    ],
                  ),
                ),
              ),
            );
          },)
      ),
    );
  }
}