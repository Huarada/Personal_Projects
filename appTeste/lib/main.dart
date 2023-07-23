import 'package:flutter/material.dart';
import 'agenda_screen.dart'; // Importe a classe AgendaScreen corretamente.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text('CS50 Schedule Manager'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent
      ),


      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AgendaScreen()), // Use AgendaScreen ao invés de AgendaScreen()
            );
          },
          child: Text('Manage Schedule'),
        ),
      ),
    );
  }
}