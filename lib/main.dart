import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

    http.Response response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: hearders,
      body: json.encode(body),
    );

    //Respostas de sucesso (200-299),

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);

      // List result = json.decode(response.body);

      // for (var item in result) {
      //   print(item['title']);
      // }
    } else {
      print('aconteceu um erro: ${response.statusCode}');
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
