import 'package:small_project/core/storage/db_model/identity_model.dart';
import 'package:small_project/core/storage/db_tables.dart';
import 'package:sqflite/sqlite_api.dart';

class IdentityHelper {
  static final IdentityHelper _instance = IdentityHelper.internal();

  factory IdentityHelper() => _instance;

  IdentityHelper.internal();

  final DatabaseTables _db = DatabaseTables();

  getMyIdentity() async {
    Database? db = await _db.createDb();
    List<MyIdentity>? identity;

    var res = await db!.query("myIdentity");
    identity = res.isNotEmpty
        ? res.map((chat) => MyIdentity.fromMap(chat)).toList()
        : [];
    return identity;
  }

  getTokenFromMyIdentity() async {
    Database? db = await _db.createDb();
    List<MyIdentity>? identity;

    var res = await db!.query("myIdentity");
    identity = res.isNotEmpty
        ? res.map((chat) => MyIdentity.fromMap(chat)).toList()
        : [];
    return identity.first.token;
  }

  getImageFromMyIdentity() async {
    Database? db = await _db.createDb();
    List<MyIdentity>? identity;

    var res = await db!.query("myIdentity");
    identity = res.isNotEmpty
        ? res.map((chat) => MyIdentity.fromMap(chat)).toList()
        : [];
    return identity.first.token;
  }

  getServerIdFromMyIdentity() async {
    Database? db = await _db.createDb();
    List<MyIdentity>? identity;

    var res = await db!.query("myIdentity");
    identity = res.isNotEmpty
        ? res.map((chat) => MyIdentity.fromMap(chat)).toList()
        : [];
    return identity.first.serverId;
  }

  insertMyIdentity(MyIdentity identity) async {
    Database? db = await _db.createDb();
    await db!.insert('myIdentity', identity.toMap());
  }

  updateMyIdentity(MyIdentity identity) async {
    Database? db = await _db.createDb();
    List<MyIdentity> myIdentity = [];
    myIdentity = await getMyIdentity();
    if (myIdentity.isNotEmpty) {
      await db!.update(
          'myIdentity',
          myIdentity.first
              .copyWith(
                  serverId: identity.serverId,
                  email: identity.email,
                  name: identity.name,
                  token: identity.token,
                  imageUrl: identity.imageUrl,
                  phoneNumber: identity.phoneNumber)
              .toMap(),
          where: "id=?",
          whereArgs: [myIdentity.first.id]);
    } else {
      await insertMyIdentity(identity);
    }
  }
}
