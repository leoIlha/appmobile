import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


import 'TelaPrincipal.dart';
import 'api/firebase_api.dart';
import 'dao/tarefadao.dart';
import 'model/Tarefa.dart';

class CadastroTarefa extends StatefulWidget {
  @override
  _CadastroTarefaState createState() => _CadastroTarefaState();
}

class _CadastroTarefaState extends State<CadastroTarefa> {
  final TextEditingController _descricaoController = TextEditingController();
  String _contextoSelecionado = 'Lazer';
  String _statusSelecionado = 'Prioridade Máxima';
  DateTime _dataHora = DateTime.now();

  Future<void> _selectDateTime(BuildContext context) async {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      onChanged: (date) {
        print('Selecionado: $date');
        setState(() {
          _dataHora = date;
        });
      },
      onConfirm: (date) {
        print('Confirmado: $date');
        setState(() {
          _dataHora = date;
        });
      },
      currentTime: _dataHora,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Tarefa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField<String>(
                value: _contextoSelecionado,
                onChanged: (newValue) {
                  setState(() {
                    _contextoSelecionado = newValue!;
                  });
                },
                items: ['Lazer', 'Trabalho', 'Saúde'].map((contexto) {
                  return DropdownMenuItem<String>(
                    value: contexto,
                    child: Text(contexto),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Contexto',
                ),
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  _selectDateTime(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 8.0),
                      Text(
                        'Selecionar Data e Hora',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _statusSelecionado,
                onChanged: (newValue) {
                  setState(() {
                    _statusSelecionado = newValue!;
                  });
                },
                items: ['Prioridade Máxima', 'Prioridade Média', 'Prioridade Baixa'].map((status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Status',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _descricaoController,
                decoration: InputDecoration(
                  labelText: 'Descrição da Tarefa',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String descricao = _descricaoController.text;
                  String dataHora= _dataHora.toIso8601String();
                  String contexto =_contextoSelecionado;
                  String status=_statusSelecionado;

                  print(descricao);
                  print(dataHora);
                  print(contexto);
                  print(status);
                  Tarefa t = new Tarefa(descricao,dataHora, contexto, status);
                  new Tarefadao().adicionar(t);
                 FirebaseApi().enviarNotificacaoFirebase(t);
                 // FirebaseApi().agendarNotificacao(t);



                  // Criar objeto de tarefa com os dados preenchidos
                  // final novaTarefa = Tarefa(
                  //
                  //   _dataHora,
                  //   _contextoSelecionado,
                  //   _statusSelecionado,
                  // );

                Navigator.pop(context); // Retornar a nova tarefa para a tela anterior
                },
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

