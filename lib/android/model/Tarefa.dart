class Tarefa {
  int? id_task; // Campo auto incremental
  String description;
  String dataHora = DateTime.now().toIso8601String();
  String context;
  String status;

  Map<String, dynamic> toMap() {
    return {
      'id_tarefa': id_task,
      'descricao': description,
      'dataHora': dataHora,
      'contexto': context,
      'status': status,
    };
  }

  Tarefa(this.description,this.dataHora, this.context, this.status);

  // factory Tarefa.fromJson(Map<String, dynamic> json) {
  //   return Tarefa(
  //
  //     json['descricao'],
  //     json['dataHora'],
  //     json['contexto'],
  //     json['status']
  //   );
  // }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(

      map['descricao'],
      map['dataHora'],
      map['contexto'],
      map['status'],
    )..id_task = map['id_tarefa'];
  }
}





// class Tarefa {
//   int? id_tarefa; // Campo auto incremental
//   String descricao;
//   String dataHora;
//   String contexto;
//   String status;
//
//   Map<String, dynamic> toMap() {
//     return {
//       'descricao': descricao,
//       'dataHora': dataHora,
//       'contexto': contexto,
//       'status': status,
//     };
//   }
//
//   Tarefa(this.descricao, DateTime dataHora, this.contexto, this.status)
//       : dataHora = dataHora.toIso8601String();
//
//   factory Tarefa.fromJson(Map<String, dynamic> json) {
//     return Tarefa(
//       json['descricao'],
//       DateTime.parse(json['dataHora']),
//       json['contexto'],
//       json['status'],
//     );
//   }
// }
