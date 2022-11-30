import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

// una interfaz muy sencilla en la que podemos crear los tres usuarios (signup)
// y después logearse (login) con cualquiera de las tres

class AuthenticationPage extends StatelessWidget {
  AuthenticationPage({Key? key}) : super(key: key);
  final AuthenticationController authenticationController = Get.find();

  void signIn() async {
    // aquí creamos los tres usuarios
    await authenticationController.signup('alfredo@uninorte.edu.co', '123456','https://picsum.photos/100/100?image=602',);
    await authenticationController.signup('camilo@uninorte.edu.co', '123456','https://picsum.photos/100/100?image=447',);
    await authenticationController.signup('edgar@uninorte.edu.co', '123456','https://picsum.photos/100/100?image=331',);
    await authenticationController.signup('john@uninorte.edu.co', '123456','https://picsum.photos/100/100?image=334',);
    await authenticationController.signup('miguel@uninorte.edu.co', '123456','https://picsum.photos/100/100?image=349',);
  }

  void login(String user) {
    // método usado para login
    authenticationController.login(user, '123456');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ChatApp - MisionTic - Grupo 12")),
      body:  SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: signIn,
                          child: const Text("Crear usuarios"),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Antes de crear los usuarios, borrar todos los usuarios del sistema de autenticación y la base de datos de tiempo real de firebase',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                    ]),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () => login('alfredo@uninorte.edu.co'),
                                child: const Text("Ingresar con usuario Alfredo")),
                            ElevatedButton(
                                onPressed: () => login('camilo@uninorte.edu.co'),
                                child: const Text("Ingresar con usuario Camilo")),
                            ElevatedButton(
                                onPressed: () => login('edgar@uninorte.edu.co'),
                                child: const Text("Ingresar con usuario Edgar")),
                            ElevatedButton(
                                onPressed: () => login('john@uninorte.edu.co'),
                                child: const Text("Ingresar con usuario John")),
                            ElevatedButton(
                                onPressed: () => login('miguel@uninorte.edu.co'),
                                child: const Text("Ingresar con usuario Miguel")),
                          ]
                        ),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
