import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'navbar.dart';
import 'dart:convert' as convert;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

var user_name, email_id, phone, city;
int dataAccessLevel= 2;
  // void getData() async {
  //   await Future.delayed(Duration(seconds: 3), (){
  //     priprofilent("Response after 3 second");
  //   });
  //
  //   print("Within getData ...after Future Delayed");
  //
  // }

  void getData() async {

    var url = Uri.https('jsonplaceholder.typicode.com', '/users/1');
    Response response = await get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      setState(() {
        user_name = jsonResponse['name'];
        email_id = jsonResponse['email'];
        phone = jsonResponse['phone'];
        city = jsonResponse['city'];

      });
      print(user_name);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      user_name = "";
      email_id = "";
      phone = "";
      city = "";

    }
  }
  
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Within Init State Function");
    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Within Dispose Function");
  }

  @override
  Widget build(BuildContext context) {
    print("Within Build Function");

    return   Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text("Profile Card"),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Center(
            //     child: CircleAvatar(
            //       radius: 50.0,
            //
            //       backgroundImage: AssetImage('assets/image/profile/male_profile.png'),
            //     )
            // ),
            SizedBox(height: 20.0,),
            Divider(
              color: Colors.red[850],
              height: 30.0,
              thickness: 2.0,
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.account_circle_sharp,
                ),
                SizedBox(width: 20.0,),
                Text("Name", style:TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
                ),
              ],
            ),
            Text("$user_name", style:TextStyle(
              fontSize: 25.0,
              color: Colors.blue[800],
            ),
            ),
// Replicated

            SizedBox(height: 20.0,),
            Row(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.phone,

                ),
                SizedBox(width: 20.0,),
                Text("Phone", style:TextStyle(                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
                ),
              ],
            ),
            Text("$phone", style:TextStyle(
              fontSize: 25.0,
              color: Colors.blue[800],
            ),
            ),

            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.email,
                ),
                SizedBox(width: 20.0,),
                Text("Email", style:TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
                ),
              ],
            ),
            Text("$email_id", style:TextStyle(
              fontSize: 25.0,
              color: Colors.blue[800],
            ),
            ),

            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.desktop_windows,
                ),
                SizedBox(width: 20.0,),
                Text("Data Access Level", style:TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
                ),
              ],
            ),
            Text("$dataAccessLevel", style:TextStyle(
              fontSize: 25.0,
              color: Colors.blue[800],
            ),
            ),
            Center(
            child: ElevatedButton(
              onPressed:(){
                Navigator.pushReplacementNamed(
                    context,
                    '/dashboard',
                    arguments: {
                  'name': "$user_name",
                      'id': "$user_name",
                    });
              } ,
              child: Text("Next"),
            ),
            ),

          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            dataAccessLevel +=  1;
          });
        },
        child: Text("+"),
      ),

    );
  }
}
