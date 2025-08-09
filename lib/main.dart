import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    home: MyWidget(),
    );

  }
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Blinding Lights')),
        body : Center(
          child: Stack(
            children: [
              Container(
                width: 120,
                height:300,
                decoration: BoxDecoration(
                    color : Colors.black,borderRadius: BorderRadius.circular(20)),
              ),
              Positioned(
                top:20,
                left:20,
                child:Container(
                  height: 80,
                  width: 80,
                  decoration:
                      BoxDecoration(
                        color: Colors.redAccent,
                        shape:BoxShape.circle
                  ),
                )
              ),
              Positioned(
                top:110,
                left:20,
                child:Container(
                  height: 80,
                  width: 80,
                  decoration:
                      BoxDecoration(
                        color: Colors.greenAccent,
                        shape:BoxShape.circle
                  ),
                )
              ),
              Positioned(
                top:200,
                left:20,
                child:Container(
                  height: 80,
                  width: 80,
                  decoration:
                      BoxDecoration(
                        color: Colors.yellowAccent ,
                        shape:BoxShape.circle
              ),
            )
          ),          
         ],
        )
      )
    );
  }
}



