import 'package:flutter/material.dart';

class Team extends StatefulWidget {
  const Team({super.key});

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: PreferredSize(
        
        preferredSize: Size.fromHeight(45),
        child: AppBar(
          
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.menu,
            color: Color.fromRGBO(75, 69, 79, 1),
          ),
          
          title: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
              hintStyle: TextStyle(color: Color.fromRGBO(75, 69, 79, 1),),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Color.fromRGBO(75, 69, 79, 1),
              ),
              onPressed: () {},
            ),
            
          ],
        ),
      ),
      body: Center(
        child: Text('Team Page Content'),
      ),
    );
  }
}
