import 'package:flutter/material.dart';
import 'navbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(

        title: Text("Home"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
       child: ElevatedButton(
          onPressed:(){
            Navigator.pushNamed(context, '/profile');
          } ,
          child: Text("Click here"),
        ),
      )
    );
  }
}
