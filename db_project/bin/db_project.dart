import 'package:db_project/db.dart' as db;
//import 'package:mysql1/mysql1.dart';
import 'package:sqljocky5/connection/connection.dart';
import 'package:sqljocky5/results/results.dart';

Future<void> main(List<String> arguments) async {
  var conn = await db.createConnection();
  await createTable(conn);
  //await insertData(conn);
 //await updateData(conn);
  //await listData(conn);
  //await dropTable(conn);
  //await removeData(conn);
  //await conn.close();


  var trans = await conn.begin();

  try{
    await trans.execute('INSERT INTO people (id, name, email, age) VALUES (1, "Zeze Perrela", "zeze@cruzeiro.com", 44)');
    await trans.execute('INSERT INTO horse (person_id) VALUES (1)');
    await trans.commit();
  }catch(e){
    print(e);
    await trans.rollback();
  }
}

Future<void> insertData(MySqlConnection conn) async {
  print("Insert data...");
  var data = [
    ['Zeze Perrela', 'zeze@cruzeiro', 55],
    ['Zeze Perrela2', 'zeze2@cruzeiro', 55],
    ['Zeze Perrela3', 'zeze3@cruzeiro', 55],
  ];
  await conn.preparedWithAll('INSERT INTO people (name, email, age) VALUES (?, ?, ?)', data);
  print('sucess...');
}

Future<void> updateData(MySqlConnection conn) async {
  print("\n\nUpdate data...");
  await conn.prepared('UPDATE people SET name = ? where id = ?', ['Zeze Perrela', 1]);
  print('sucess...');

}
Future<void> removeData(MySqlConnection conn) async {
  print("\n\nRemove data...");
  await conn.execute('DELETE from people');
  print('sucess...');
}

Future<void> dropTable(MySqlConnection conn) async {
  print("\n\nDelete table...");
  await conn.execute('DROP TABLE people');
  print('sucess...');
}

Future<void> listData(MySqlConnection conn) async {
  print("List data...");
  StreamedResults results = await conn.execute('SELECT * FROM people');
  results.forEach((Row row) => print('ID: ${row[0]}, Nome: ${row[1]}, Idade: ${row[2]}, Email: ${row[3]},'));
  print('sucess...');
}

Future<void> createTable(MySqlConnection conn) async {
  print('Creating table...');
  await conn.execute('CREATE TABLE IF NOT EXISTS people (id INTEGER NOT NULL auto_increment, name VARCHAR(255), age INTEGER, email VARCHAR(255), PRIMARY KEY(id))');
  await conn.execute('CREATE TABLE IF NOT EXISTS horse (id INTEGER NOT NULL auto_increment, person_id INTEGER NOT NULL, PRIMARY KEY(id), FOREIGN KEY (person_id) REFERENCES people(id))');

  print('Successful...');
}