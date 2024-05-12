import 'package:login/pages/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController textcontroller, textcontroller2;

  String? user, pass;
  bool? fail;

  _login( user, pass) {

    if (user == "Crys" && pass == "123"){
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    }
    else{      
      setState(() {
        fail = true;        
      });
        print(fail);
    }    
  }


  @override
  void initState() {
    fail = false;
    textcontroller = TextEditingController();
    textcontroller2 = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('coins'),),
      body: Align(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 250,
            width: 300,
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Login"),
                  controller: textcontroller,
                  onChanged: (value) {
                    setState(() {
                      user = textcontroller.text;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Senha"),
                  controller: textcontroller2,
                  onChanged: (value) {
                    setState(() {
                      pass = textcontroller2.text;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                //Botão Login
                TextButton(
                  onPressed: () => _login( user, pass ),
                  child: const Text("Login"),
                ),
                const SizedBox(
                  height: 5,
                ),
                // Botão Esqueci Senha
                TextButton(
                    onPressed: () {}, child: const Text("Esqueci minha senha")
                    ),
                fail == true ? const Text("Erro ao logar") : const Text("")

              ],
            ),
          )
        ]),
      ),
    );
  }
}
