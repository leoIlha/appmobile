import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'aa.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE USUARIO (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, senha TEXT)');
      db.execute('CREATE TABLE TAREFA (id_tarefa INTEGER PRIMARY KEY AUTOINCREMENT, descricao TEXT, dataHora TEXT, contexto TEXT, status TEXT)');
    },
    version: 1,
  );
}