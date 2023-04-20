
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
   final List<String> imageUrls = [    'https://picsum.photos/id/100/200/300',    'https://picsum.photos/id/101/200/300',    'https://picsum.photos/id/102/200/300',    'https://picsum.photos/id/103/200/300',    'https://picsum.photos/id/104/200/300',  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        child:
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 200,
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.all(8.0),
            // padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
               
                imageUrls[index],
                width: 500,
                height: 500,
                // fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      ),
    );
  }
}