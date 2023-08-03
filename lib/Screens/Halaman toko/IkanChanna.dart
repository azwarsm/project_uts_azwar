import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class IkanChanna extends StatefulWidget {
  const IkanChanna({super.key});

  @override
  State<IkanChanna> createState() => _IkanChanna();
}

class _IkanChanna extends State<IkanChanna> {
  final idController = TextEditingController();
  final jenis_ikanController = TextEditingController();
  final deskripsiController = TextEditingController();
  final fotoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  var datajson;
  int totalData = 0;

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:1337/api/ikantawars'),
      );

      if (response.statusCode == 200) {
        setState(() {
          datajson = jsonDecode(response.body);
          totalData = datajson["meta"]["pagination"]["total"];
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<void> addData() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final response =
        await http.post(Uri.parse('http://localhost:1337/api/ikantawars'),
            headers: headers,
            body: jsonEncode({
              'data': {
                'jenis_ikan': jenis_ikanController.text,
                'deskripsi': deskripsiController.text,
                'foto': fotoController.text
              }
            }));

    if (response.statusCode == 200) {
      fetchData();
      idController.clear();
      jenis_ikanController.clear();
      deskripsiController.clear();

      fotoController.clear();
    } else {
      throw Exception('Failed to add data');
    }
  }

  Future<void> deleteData(String id) async {
    final response = await http
        .delete(Uri.parse('http://localhost:1337/api/ikantawars/$id'));

    if (response.statusCode == 200) {
      fetchData();
    } else {
      throw Exception('Failed to delete data');
    }
  }

  Future<void> updateData(String id) async {
    final response = await http.put(
      Uri.parse('http://localhost:1337/api/ikantawars/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'data': {
          'jenis_ikan': jenis_ikanController.text,
          'deskripsi': deskripsiController.text,
          'foto': fotoController.text
        }
      }),
    );

    if (response.statusCode == 200) {
      fetchData();
      idController.clear();
      jenis_ikanController.clear();
      deskripsiController.clear();
    } else {
      throw Exception('Failed to update data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ikan Air Tawar"),
        backgroundColor: Color.fromARGB(255, 12, 202, 223),
      ),
      body: ListView.builder(
          itemCount: totalData,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Update'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: jenis_ikanController,
                            decoration: InputDecoration(
                              labelText: 'Nama',
                            ),
                          ),
                          TextField(
                            controller: deskripsiController,
                            decoration: InputDecoration(
                              labelText: 'Deskripsi',
                            ),
                          ),
                          TextField(
                            controller: fotoController,
                            decoration: InputDecoration(
                              labelText: 'Link Foto',
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Update'),
                          onPressed: () {
                            updateData(
                                datajson['data'][index]['id'].toString());
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },

              // tileColor: Colors.greenAccent,
              leading: Image.network(
                datajson['data'][index]['attributes']['foto'],
                height: 50,
                width: 50,
              ),
              title: Text(
                datajson['data'][index]['attributes']['jenis_ikan'],
              ),
              subtitle:
                  Text(datajson['data'][index]['attributes']['deskripsi']),
              trailing: TextButton(
                  onPressed: () {
                    deleteData(datajson['data'][index]['id'].toString());
                    //                             Navigator.of(context).pop();
                  },
                  child: Text("Hapus")),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add Data'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: jenis_ikanController,
                      decoration: InputDecoration(
                        labelText: 'Nama',
                      ),
                    ),
                    TextField(
                      controller: deskripsiController,
                      decoration: InputDecoration(
                        labelText: 'Deskripsi',
                      ),
                    ),
                    TextField(
                      controller: fotoController,
                      decoration: InputDecoration(
                        labelText: 'Link Foto',
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      addData();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
