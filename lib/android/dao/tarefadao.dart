

import 'dart:convert';


import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

import '../model/Tarefa.dart';

import 'openDataBase.dart';

class Tarefadao {
  // adicionar(Tarefa tarefa) async{
  //   final Database aa = await getDataBase();
  //   aa.insert('Tarefa',tarefa.toMap());
  // }
  Future<void> adicionar(Tarefa tarefa) async {
    final db = await getDataBase();
    final id = await db.insert(
      'Tarefa',
      tarefa.toMap()..['id_tarefa'] = null,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    tarefa.id_task = id;
  }

  Future<List<Tarefa>> getTarefas() async {
    final db = await getDataBase();
    final List<Map<String, dynamic>> maps = await db.query('Tarefa');

    return List.generate(maps.length, (index) {
      return Tarefa(
        maps[index]['descricao'],
        maps[index]['dataHora'],
        maps[index]['contexto'],
        maps[index]['status'],
      )..id_task = maps[index]['id_tarefa'];
    });
  }

  Future<void> att(Tarefa tarefa) async {
    // Get a reference to the database.
    final db = await getDataBase();
    // Update the given Dog.
    await db.update(
      'Tarefa',
      tarefa.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id_tarefa = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [tarefa.id_task],
    );
  }

  Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    final db = await getDataBase();

    // Remove the Dog from the database.
    await db.delete(
      'Tarefa',
      // Use a `where` clause to delete a specific dog.
      where: 'id_tarefa = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }





  Future<void> deleteDatabase(String s) async {
    await deleteDatabase(s);
  }
}

