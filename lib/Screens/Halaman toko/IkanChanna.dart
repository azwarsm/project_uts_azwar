import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class IkanChanna extends StatefulWidget {
  const IkanChanna({super.key});

  @override
  State<IkanChanna> createState() => _IkanChanna();
}

class _IkanChanna extends State<IkanChanna> {
  List<String> listItems = [
    "Ikan Channa Limbata",
    "Ikan Toman",
    "Ikan Oscar",
    "Ikan Arwana",
    "Ikan Aligator",
    "Ikan Arapaima",
    "Ikan Red Devil",
    "Ikan Guppy",
    "Ikan Cupang",
    "Ikan Koi Kohaku",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ikan Air Tawar"),
        backgroundColor: Color.fromARGB(255, 12, 202, 223),
      ),
      body: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              // tileColor: Colors.greenAccent,
              leading: Image.asset("assets/icons/channa_1.png"),
              title: Text(
                listItems[index],
              ),
              subtitle: Text('Ini adalah ikan $index'),
            );
          }),
    );
  }

  build_listView() {
    return ListView(scrollDirection: Axis.horizontal, children: [
      Text(
        '1',
        style: TextStyle(fontSize: 20),
      ),
      Text(
        '2',
        style: TextStyle(fontSize: 20),
      ),
      Text(
        '3',
        style: TextStyle(fontSize: 20),
      ),
      Text(
        '4',
        style: TextStyle(fontSize: 20),
      ),
      Text(
        '5',
        style: TextStyle(fontSize: 20),
      ),
    ]);
  }

  build_ListView_separated() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Text(
            listItems[index],
            style: TextStyle(fontSize: 20),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: listItems.length);
  }
}
