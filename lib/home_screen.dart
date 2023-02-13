import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_getx_post/login_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //injecting getx
  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx Tutorials'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.emailController.value, //.value
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextFormField(
              controller: controller.passwordController.value, //.value
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Obx(
              () {
                return InkWell(
                  onTap: () {
                    controller.loginApi();
                  },
                  child: controller.loading.value
                      ? CircularProgressIndicator()
                      : Container(
                          child: Center(
                            child: Text('Login'),
                          ),
                        ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
