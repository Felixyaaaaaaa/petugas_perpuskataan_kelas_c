import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.usenameController,
                    decoration: InputDecoration(
                      hintText: "Masukan Username",
                    ),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "username tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    // obscureText: true,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      hintText: "Masukan Password",
                    ),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "password tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  Obx(() => controller.loading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            controller.login();
                          },
                          child: Text('Login'))),
                ],
              ))),
    );
  }
}
