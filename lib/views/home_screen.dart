import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'sceand_page.dart';

class homepage2 extends StatelessWidget {
  const homepage2({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final TextEditingController emailController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'first page',
            style: TextStyle(color: Color.fromARGB(255, 53, 188, 197)),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 34, 36, 161),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      label: Text('email'),
                    ),
                    validator: (value) {
                      if (value!.contains("a")) {
                        return null;
                      } else {
                        return "not vaild";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text('password'),
                    ),
                    validator: (value) {
                      if (value!.length < 6) {
                        return "password should be more than 6";
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 100,
                  color: Color.fromARGB(255, 75, 146, 212),
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        saveEmail(emailController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  secondpage(email: emailController.text)),
                        );
                      }
                    },
                    child: Text(
                      'login',
                      style:
                          TextStyle(color: Color.fromARGB(255, 122, 175, 199)),
                    ),
                  ),
                )
              ],
            )));
  }

  saveEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }
}




/*backgroundColor: const Color.fromARGB(255, 61, 142, 153),
      body: SafeArea(
        child: Container(
          child: Text('eman atta',
          style: TextStyle(
            fontSize: 20,
        
          ),),
          color: const Color.fromARGB(255, 240, 228, 228),
          margin: EdgeInsets.all(25),
          width: 90,
          height: 80,
          
          
        ),
      ),
       */

/*
backgroundColor: Color.fromARGB(255, 123, 144, 163),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 161, 166, 168),
        title:Text('home page',
        style: TextStyle(
          color: Color.fromARGB(255, 108, 85, 194)
        ),) ,
      ),
      body: Column(children: [
        Text('hellow',
        style: TextStyle(
          backgroundColor: Color.fromARGB(255, 109, 98, 199),
          color: Colors.black,
          fontSize: 25,
          
        ),),

        Container(
          width:300,
          height: 200,
          padding: EdgeInsets.only(top: 120,left: 70),
          child: Image.asset('assets/ff.png'),

        )

      ],),
*/ 