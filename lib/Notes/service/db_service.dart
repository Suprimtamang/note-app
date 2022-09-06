import 'package:sqflite/sqflite.dart';
// Helpers for insert/query/update/delete queries
//provides classes and function to interact with a sql db.
import '../model /note.dart';
import 'package:path/path.dart';
//provides path

class Storehouse {
  //global field instance which calls our constructor
  static final Storehouse instance = Storehouse.init();

//field  for our db which comes from sql package
  static Database? _database;

  //private constructor
  Storehouse.init();

  //opening db
  Future<Database> get database async {
    if (_database != null) return _database!;
    //file where our db is stored
    _database = await _initDB('notes.db');
    return _database!;
  }

  //initialize db

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  //create table for db
  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';

    //calling db execute method

    await db.execute('''
    //structure of table 
    CREATE TABLE $tableNotes(
        ${NoteFields.id} $idType,
         ${NoteFields.isImportant} $boolType,
        ${NoteFields.number} $integerType,
        ${NoteFields.title} $textType,
        ${NoteFields.description} $textType,
         ${NoteFields.createdTime} $textType,
    )
''');
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;
    final id = await db.insert(tableNotes, note.toJson());
    return note.copy(id: id);
  }

//from this we can read a single note
  Future<Note> readNote(int id) async {
    //definig db
    final db = await instance.database;
    final maps = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  //to read all notes
  Future<List<Note>> readAllNote() async {
    //definig db
    final db = await instance.database;
    //asc = ascending order
    final orderBy = '${NoteFields.createdTime} ASC';

    final result = await db.query(tableNotes, orderBy: orderBy);
    return result.map((json) => Note.fromJson(json)).toList();
  }

  Future<int> update(Note note) async {
    final db = await instance.database;
    return db.update(tableNotes, note.toJson(),
        where: ' ${NoteFields.id} =?', whereArgs: [note.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableNotes,
      where: ' ${NoteFields.id} =?',
      whereArgs: [id],
    );
  }

  Future close() async {
    //access db again
    final db = await instance.database;
    db.close();
  }
}
