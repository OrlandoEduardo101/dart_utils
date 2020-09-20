import 'package:sqljocky5/connection/connection.dart';
import 'package:sqljocky5/connection/settings.dart';
//import 'package:mysql1/mysql1.dart';

createConnection() async {
    var s = ConnectionSettings(
    user: "root",
    password: "root",
    host: "172.17.0.2",
    port: 3306,
    db: "dart",
  );
    return await MySqlConnection.connect(s);
}
//var conn = await MySqlConnection.connect(s);


