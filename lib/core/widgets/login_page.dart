import 'package:demo1/auth/presentation/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

import '../injector.dart';

// import '../../core/injector/injector.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          backgroundColor: Color(0xffE41F2D),
          brightness: Brightness.dark,
          primarySwatch: Colors.grey),
      child: const LoginContent(),
    );
  }
}

class LoginContent extends StatefulWidget {
  const LoginContent({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  late final TextEditingController userNameController, passwordController;
  late final LoginViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();

    viewModel = getIt<LoginViewModel>();
    when((_) => viewModel.succesLogin, () {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        //context becomes "active"
        context.goNamed('homescreen');
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderComponent(),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: TextFormField(
                        controller: userNameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 48, right: 48, bottom: 60, top: 16),
                      child: TextFormField(
                        controller: passwordController,
                        style: const TextStyle(color: Color(0xffb3b3b3)),
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          suffixIcon: Icon(
                            Icons.remove_red_eye_outlined,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfff7c04a),
                        ),
                        child: const Text('Login'),
                        onPressed: () {
                          viewModel.logIn(
                              userNameController.text, passwordController.text);
                          //context.goNamed('homescreen');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //const Spacer(flex: 2),

              // const Spacer(
              //   flex: 1,
              // )
            ]),
      ),
    );
  }
}

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      //fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Image.asset('lib/images/background1_login_screen.png',
            width: double.infinity, fit: BoxFit.fill),
        Image.asset('lib/icons/login_logo_full.png')
      ],
    );
  }
}
