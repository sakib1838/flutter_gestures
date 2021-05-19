import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Gestures'),
          backgroundColor: Colors.blue,
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: GestureDetector(
          onTap: (){
            print('Box Clicked');
          },
          child: Container(
            height: 60.0,
            width: 120.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child:Text('Click Me'),
            ),
          ),
        ),
    );
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(

      gestures: {
        AllowMultipleGestureRecognizer:GestureRecognizerFactoryWithHandlers<AllowMultipleGestureRecognizer>(
            ()=>AllowMultipleGestureRecognizer(),(AllowMultipleGestureRecognizer instance){
              instance.onTap=()=>print('It is the parent gesture');
        },
        )
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: Colors.green,
        child: Center(
          child: RawGestureDetector(

            gestures: {
              AllowMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<AllowMultipleGestureRecognizer>(
                  ()=>AllowMultipleGestureRecognizer(),(AllowMultipleGestureRecognizer instance){
                    instance.onTap = () => print('It is the nested container');
              },
              )
            },
            child: Container(
              color: Colors.red,
              width: 100.0,
              height: 100.0,
            ),

          ),
        ),
      ),

    );
  }
}

class AllowMultipleGestureRecognizer extends TapGestureRecognizer{
  void rejectGesture(int pointer){
    acceptGesture(pointer);
  }
}



