import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operaciones Matemáticas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MathOperationsPage(),
    );
  }
}

class MathOperationsPage extends StatefulWidget {
  const MathOperationsPage({super.key});

  @override
  State<MathOperationsPage> createState() => _MathOperationsPageState();
}

class _MathOperationsPageState extends State<MathOperationsPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _num3Controller = TextEditingController();

  String _result = '';

  void _findLargestNumber() {
    int num1 = int.parse(_num1Controller.text);
    int num2 = int.parse(_num2Controller.text);
    int num3 = int.parse(_num3Controller.text);

    int largest = [num1, num2, num3].reduce((a, b) => a > b ? a : b);

    setState(() {
      _result = 'El número mayor es: $largest';
    });
  }

  void _findSmallestNumber() {
    int num1 = int.parse(_num1Controller.text);
    int num2 = int.parse(_num2Controller.text);
    int num3 = int.parse(_num3Controller.text);

    int smallest = [num1, num2, num3].reduce((a, b) => a < b ? a : b);

    setState(() {
      _result = 'El número menor es: $smallest';
    });
  }

  void _calculateSquare() {
    int num1 = int.parse(_num1Controller.text);
    int square = num1 * num1;

    setState(() {
      _result = 'El cuadrado de $num1 es: $square';
    });
  }

  void _calculateCube() {
    int num1 = int.parse(_num1Controller.text);
    int cube = num1 * num1 * num1;

    setState(() {
      _result = 'El cubo de $num1 es: $cube';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Operaciones Matemáticas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 1'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 2'),
            ),
            TextField(
              controller: _num3Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 3'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _findLargestNumber,
              child: const Text('Número Mayor'),
            ),
            ElevatedButton(
              onPressed: _findSmallestNumber,
              child: const Text('Número Menor'),
            ),
            ElevatedButton(
              onPressed: _calculateSquare,
              child: const Text('Cuadrado del Número 1'),
            ),
            ElevatedButton(
              onPressed: _calculateCube,
              child: const Text('Cubo del Número 1'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
