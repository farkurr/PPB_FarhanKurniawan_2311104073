import 'package:supabase_flutter/supabase_flutter.dart';

void Connection() async {
  await Supabase.initialize(
    url: 'https://uoxncoqzdprtuhtozokv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVveG5jb3F6ZHBydHVodG96b2t2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM0NTQxNTQsImV4cCI6MjA3OTAzMDE1NH0.8HuA5Kx3uiQSy8iowgMVFeTRzkNFQGH8_4AtN6dGdRU',
  );
}

//insert data
final db = Supabase.instance.client;
String table = 'perpustakaan';

Future<void> insertData(Map<String, dynamic> data) async {
  try {
    await db.from(table).insert(data);
    print('Data inserted successfully');
  } catch (e) {
    print('Error inserting data: $e');
  }
}

//read data
Future<List> getData() async {
  final response = await db.from(table).select();
  print(response.toList().toString());
  return response;
}

//update data
Future<void> updateData(Map<String, dynamic> row) async {
  try {
    await db.from(table).update(row).eq('id', row['id']);
    print('Data updated successfully');
  } catch (e) {
    print('Error updating data: $e');
  }
}

//delete data
Future<void> deleteData(String id) async {
  try {
    await db.from(table).delete().eq('id', id);
    print('Data deleted successfully');
  } catch (e) {
    print('Error deleting data: $e');
  }
}
