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
    await authenticationController.signup('persona1@mt2022.com', '123456','https://drive.google.com/file/d/1UX5ddRdU1T_ikzaopVrRadQAlDBZj66t/view?usp=share_link',);
    await authenticationController.signup('persona2@mt2022.com', '123456','https://drive.google.com/file/d/1bWAaK8pvGt6b7Ju3oXrr_A8xOikiVGOi/view?usp=share_link',);
    await authenticationController.signup('persona3@mt2022.com', '123456','https://drive.google.com/file/d/143Bb7F6DiewlCclBHqZj-9nX-_wkkNRS/view?usp=share_link',);
  }

  void login(String user) {
    // método usado para login
    authenticationController.login(user, '123456');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ChatApp - MisionTic - Grupo 12")),
      body: SafeArea(
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
                          child: const Text("Crear tres usuarios"),
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
                                onPressed: () => login('persona1@mt2022.com'),
                                child: const Text("Ingresar con usuario Persona 1")),
                            ElevatedButton(
                                onPressed: () => login('persona2@mt2022.com'),
                                child: const Text("Ingresar con usuario Persona 2")),
                            ElevatedButton(
                                onPressed: () => login('persona3@mt2022.com'),
                                child: const Text("Ingresar con usuario Persona 3")),
                          ]),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
