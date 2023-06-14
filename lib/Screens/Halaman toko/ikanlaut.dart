import "package:flutter/material.dart";

class ikanlaut extends StatefulWidget {
  const ikanlaut({super.key});

  @override
  State<ikanlaut> createState() => _ikanlautState();
}

class _ikanlautState extends State<ikanlaut> {
  List<String> listItems = [
    "Ikan Badut (Nemo)",
    "Ikan Botana Blue Tang",
    "Ikan Yellow Tang",
    "Ikan Butterfly Fish",
    "Ikan Blue Devil",
    "Ikan Clown Fish",
    "Ikan Watchman Gobies",
    "Ikan Angelfish",
    "Ikan Firefish",
    "Ikan Dottyback",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ikan Air Laut"),
        backgroundColor: Color.fromARGB(255, 12, 202, 223),
      ),
      body: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              // tileColor: Colors.greenAccent,
              leading: Image.asset("assets/icons/shark.png"),
              title: Text(
                listItems[index],
              ),
              subtitle: Text('subtitle $index'),
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
