import 'package:eventview_application_1/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingAccountView extends StatelessWidget {
  const SettingAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return   GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar( 
          backgroundColor: Colors.transparent,
          title: Align(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text( 'Cuenta',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                IconButton(color: Colors.black,
                onPressed: (){
                  context.goNamed('settings');
                }, icon:const Icon(Icons.arrow_back)),
              ],
            ),),
        ),
        body: const Stack(
          children: [
            Center(child: 
            Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            SizedBox(height:  16.0),
            TextFieldCustom(labelText: 'No. Celular',
            hintText: 'lorem ipsum',
              fontSize:  16.0,
              constraints: BoxConstraints(minWidth:  100, maxWidth:  350),
            ),
            SizedBox(height:  16.0),
            TextFieldCustom(labelText: 'Correo',
            hintText: 'lorem ipsum',
              fontSize:  16.0,
              constraints: BoxConstraints(minWidth:  100, maxWidth:  350),
            )
            ],
            ),
          ),  
          ],
        ),
      ),
    );
  }
}