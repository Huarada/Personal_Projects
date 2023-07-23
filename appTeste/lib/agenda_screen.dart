import 'package:flutter/material.dart';

class AgendaScreen extends StatefulWidget {
  @override
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  List<List<TextEditingController>> controllers = [];
  List<List<String>> data = [
    ['Hour', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday','Saturday','Sunday'],
    ['0:00 AM', '', '', '', '', '','',''],
    ['1:00 AM', '', '', '', '', '','',''],
    ['2:00 AM', '', '', '', '', '','',''],
    ['3:00 AM', '', '', '', '', '','',''],
    ['4:00 AM', '', '', '', '', '','',''],
    ['5:00 AM', '', '', '', '', '','',''],
    ['6:00 AM', '', '', '', '', '','',''],
    ['7:00 AM', '', '', '', '', '','',''],
    ['8:00 AM', '', '', '', '', '','',''],
    ['9:00 AM', '', '', '', '', '','',''],
    ['10:00 AM', '', '', '', '', '','',''],
    ['11:00 AM', '', '', '', '', '','',''],
    ['12:00 AM', '', '', '', '', '','',''],
    ['1:00 PM', '', '', '', '', '','',''],
    ['2:00 PM', '', '', '', '', '','',''],
    ['3:00 PM', '', '', '', '', '','',''],
    ['4:00 PM', '', '', '', '', '','',''],
    ['5:00 PM', '', '', '', '', '','',''],
    ['6:00 PM', '', '', '', '', '','',''],
    ['7:00 PM', '', '', '', '', '','',''],
    ['8:00 PM', '', '', '', '', '','',''],
    ['9:00 PM', '', '', '', '', '','',''],
    ['10:00 PM', '', '', '', '', '','',''],
    ['11:00 PM', '', '', '', '', '','',''],
    // Adicione mais linhas e horários conforme necessário
  ];

  @override
  void initState() {
    super.initState();
    controllers = List.generate(data.length, (row) => List.generate(data[0].length, (col) => TextEditingController()));
    // Inicializa os controladores de texto com os valores existentes na tabela
    for (int row = 1; row < data.length; row++) {
      for (int col = 1; col < data[row].length; col++) {
        controllers[row][col].text = data[row][col];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Schedule'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Table(
            border: TableBorder.all(),
            children: _buildRows(),
          ),
        ),
      ),
    );
  }

  List<TableRow> _buildRows() {
    return data.map((row) {
      return TableRow(
        children: row.map((cell) {
          if (data.indexOf(row) == 0 || row.indexOf(cell) == 0) {
            // Células de cabeçalho não são editáveis
            return TableCell(child: Center(child: Text(cell)));
          } else {
            // Células de conteúdo são editáveis
            int rowIndex = data.indexOf(row);
            int colIndex = row.indexOf(cell);
            return TableCell(
              child: TextField(
                controller: controllers[rowIndex][colIndex],
                onChanged: (text) {
                  // Atualiza o valor na matriz de dados
                  data[rowIndex][colIndex] = text;
                },
              ),
            );
          }
        }).toList(),
      );
    }).toList();
  }

  @override
  void dispose() {
    // Libera os controladores de texto ao sair da tela para evitar vazamentos de memória
    for (int row = 1; row < controllers.length; row++) {
      for (int col = 1; col < controllers[row].length; col++) {
        controllers[row][col].dispose();
      }
    }
    super.dispose();
  }
}