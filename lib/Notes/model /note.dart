//for creating table
final String tableNotes = 'notes';
//notes is the name of our table

class NoteFields {
  static final List<String> values = [
    //adding all field
    id, isImportant, number, title, description, createdTime,
  ];
  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String createdTime = 'createdtime';
}

class Note {
  //fields which we later want to use in database directory
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Note(
      {required this.id,
      required this.isImportant,
      required this.number,
      required this.title,
      required this.description,
      required this.createdTime});

  Note copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Note(
          id: this.id,
          isImportant: this.isImportant,
          number: this.number,
          title: this.title,
          description: this.description,
          createdTime: this.createdTime);

  static Note fromJson(Map<String, Object?> json) => Note(
      id: json[NoteFields.id] as int?,
      isImportant: json[NoteFields.isImportant] == 1,
      number: json[NoteFields.number] as int,
      title: json[NoteFields.title] as String,
      description: json[NoteFields.description] as String,
      createdTime: DateTime.parse(json[NoteFields.createdTime] as String));

  Map<String, Object?> toJson() => {
        //defining map of keyvalue
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.isImportant: isImportant ? 1 : 0,
        NoteFields.number: number,
        NoteFields.description: description,
        NoteFields.createdTime: createdTime.toIso8601String(),
      };
}
