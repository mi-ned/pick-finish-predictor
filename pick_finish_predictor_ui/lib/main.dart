import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'PickPredict',
      debugShowCheckedModeBanner: false,
      home: PredictorView(),
    );
  }
}