import 'package:flutter/material.dart';
import 'package:simple_todo_flutter/todo_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = "", _password = "";
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  bottom: 50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      key: const Key('email'),
                      autofillHints: const [
                        AutofillHints.email,
                        AutofillHints.username
                      ],
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'E-mail ou Nome de Usuário',
                      ),
                      onChanged: (value) => _email = value,
                    ),
                    TextFormField(
                      key: const Key('password'),
                      keyboardType: TextInputType.visiblePassword,
                      autofillHints: const [AutofillHints.password],
                      decoration: InputDecoration(
                          labelText: 'Senha',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ))),
                      obscureText: !_isPasswordVisible,
                      onChanged: (value) => _password = value,
                    ),
                  ],
                ),
              ),
              FilledButton(
                key: const Key('login'),
                child: const Text('Login'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_email == "admin" && _password == "admin") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TodoPage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Usuário ou senha incorretos'),
                        ),
                      );
                    }
                  }
                },
              ),
              OutlinedButton(
                child: const Text('Crie sua conta'),
                onPressed: () {
                  // TODO: Navigate to the registration page
                },
              ),
              TextButton(
                child: const Text('Entrar sem login'),
                onPressed: () {
                  // TODO: Navigate to the guest page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
