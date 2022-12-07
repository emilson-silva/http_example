import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> callBackend() async {
    Map<String, String> hearders = {
      'content-type': 'application/json',
    };

    Map<String, dynamic> body = {
      'title': 'teste',
      'body': 'conteudo',
      'userId': 1,
    };

    final dio = Dio();

    try {
      Response response = await dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(
          headers: hearders,
        ),
        data: body,
      );

      print(response.data);
    } on DioError catch (e) {
      print('Erro na request: ${e.response?.statusCode}');
      //print('Erro generico: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    callBackend();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste HTTP'),
      ),
      body: const Center(
        child: Text(
          'Realizando testes HTTP',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
