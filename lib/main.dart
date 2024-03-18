import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'home.dart';

void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyApp(),));


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool passStatus = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.network('https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg?size=338&ext=jpg&ga=GA1.1.735520172.1710633600&semt=ais', height: 100,),
               SizedBox(height: 50,),
                TextField(
                  controller: _username,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder()
                  ),
                ),
              SizedBox(height: 20,),
              TextField(
                controller: _password,
                obscureText: passStatus,
                decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        passStatus = !passStatus;
                      });
                    }, icon: Icon(Icons.remove_red_eye)),
                    labelText: 'Password',
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  color: Colors.cyan,
                  width: double.maxFinite,
                  child: TextButton(onPressed: (){
                    if (_username.text == "admin" && _password.text == "123") {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Homepage()));
                    } else {
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Invalid username or password'),
                          actions: [
                            TextButton(onPressed: (){
                              _password.text = "";
                              _username.text = "";
                              Navigator.pop(context);
                            }, child: Text('Close'))
                          ],
                        );
                      });
                    }
                  }, child: Text('Login', style: TextStyle(color: Colors.white),)))
            ],
          ),
        ),
      ),
    );
  }
}
