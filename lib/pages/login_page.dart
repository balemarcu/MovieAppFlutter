import 'package:demo1/pages/home_screen.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE41F2D),
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
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          errorText: 'Error message',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide:
                                  BorderSide(width: 5, color: Colors.white)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 48, right: 48, bottom: 60, top: 16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          errorText: 'Error message',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide:
                                  BorderSide(width: 5, color: Colors.white)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: ElevatedButton(
                        // style: ElevatedButton.styleFrom(
                        //     backgroundColor: Color.fromARGB(255, 247, 192, 74)),
                        child: const Text('Login'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
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
