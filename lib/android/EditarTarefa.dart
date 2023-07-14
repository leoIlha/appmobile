import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'dao/tarefadao.dart';
import 'model/Tarefa.dart';

class EditarTarefa extends StatefulWidget {
  final Tarefa tarefa;

  EditarTarefa({required this.tarefa});

  @override
  _EditarTarefaState createState() => _EditarTarefaState();
}

class _EditarTarefaState extends State<EditarTarefa> {
  final TextEditingController _descricaoController = TextEditingController();
  String _contextoSelecionado = 'Lazer';
  String _statusSelecionado = 'Prioridade Máxima';
  DateTime _dataHora = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Preenche os campos com os valores da tarefa
    _descricaoController.text = widget.tarefa.description;
    _contextoSelecionado = widget.tarefa.context;
    _statusSelecionado = widget.tarefa.status;
    _dataHora = DateTime.parse(widget.tarefa.dataHora);
  }

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
        title: Text('Editar Tarefa - ID: ${widget.tarefa.id_task}'),
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
                  String dataHora = _dataHora.toIso8601String();
                  String contexto = _contextoSelecionado;
                  String status = _statusSelecionado;

                  print(descricao);
                  print(dataHora);
                  print(contexto);
                  print(status);
                  Tarefa t = Tarefa(descricao, dataHora, contexto, status);

                  t.id_task=widget.tarefa.id_task;
                  print(t.id_task);
                  Tarefadao().att(t); // Atualiza a tarefa no banco de dados

                  Navigator.pop(context); // Retorna à tela anterior
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
