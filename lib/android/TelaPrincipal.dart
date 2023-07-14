

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'CadastroTarefa.dart';
import 'EditarTarefa.dart';
import 'api/firebase_api.dart';
import 'dao/tarefadao.dart';
import 'model/Tarefa.dart';



class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<Tarefa> _tarefas = []; // Lista de tarefas
  final GlobalKey _cadastroTarefaKey = GlobalKey();
  Offset? _cadastroTarefaPosition;

  @override
  void initState() {
    super.initState();
    _carregarTarefas(); // Carrega as tarefas do banco de dados ao iniciar a tela
  }

  Future<void> _carregarTarefas() async {
    List<Tarefa> tarefas = await Tarefadao().getTarefas();
    setState(() {
      _tarefas = tarefas;
    });
  }

  void _excluirTarefa(Tarefa tarefa) async {
    await Tarefadao().deleteDog(tarefa.id_task!);
    _carregarTarefas(); // Atualizar a lista de tarefas após a exclusão
  }

  String formatarData(String dataHora) {
    final formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(DateTime.parse(dataHora));
  }

  void _cadastrarTarefa(Tarefa tarefa) async {
    print('TELA PRINCIPAL TAREFAS');
    print('descricao:'+tarefa.description);
    await Tarefadao().adicionar(tarefa);

    _carregarTarefas(); // Atualizar a lista de tarefas após o cadastro

    // Agendar notificação com base na tarefa cadastrada
  //  FirebaseApi().agendarNotificacao(tarefa);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final RenderBox? appBarBox = _cadastroTarefaKey.currentContext?.findRenderObject() as RenderBox?;
      if (appBarBox != null) {
        final appBarPosition = appBarBox.localToGlobal(Offset.zero);
        setState(() {
          _cadastroTarefaPosition = appBarPosition;
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Principal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _tarefas.length,
          itemBuilder: (context, index) {
            Tarefa tarefa = _tarefas[index];
            return ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${tarefa.id_task}'),
                  Text('Descrição: ${tarefa.description}'),
                  Text('Data/Hora: ${formatarData(tarefa.dataHora)}'),
                  Text('Contexto: ${tarefa.context}'),
                  Text('Status: ${tarefa.status}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navegar para a página de edição passando a tarefa a ser editada
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditarTarefa(tarefa: tarefa),
                        ),
                      ).then((value) {
                        // Atualizar a lista de tarefas ao retornar da página de edição
                        _carregarTarefas();
                      });
                    },
                    child: Icon(Icons.edit),
                  ),
                  SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirmação'),
                            content: Text('Deseja excluir esta tarefa?'),
                            actions: [
                              TextButton(
                                child: Text('Cancelar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Excluir'),
                                onPressed: () {
                                  _excluirTarefa(tarefa);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(Icons.delete),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CadastroTarefa()),
      ).then((value) {
        // Atualizar a lista de tarefas ao retornar da tela de cadastro
        _carregarTarefas();
      });
    },
        child: Icon(Icons.add_alert),
      ),
    );
  }
}
