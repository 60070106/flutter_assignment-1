import 'package:flutter/material.dart';

class LoginForm {
  String username;
  String password;
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  LoginForm loginForm = new LoginForm();

  void _submitForm() {
    final FormState form = _formKey.currentState;
    form.save();

    if (loginForm.username == '' || loginForm.password == '') {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // Retrieve the text the user has typed in using our
              // TextEditingController
              content: Text('กรุณาระบุ Username or Password'),
            );
          });
      return;
    }

    if (loginForm.username == 'admin' && loginForm.password == 'admin') {
      Navigator.pushNamed(context, '/home');
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // Retrieve the text the user has typed in using our
              // TextEditingController
              content: Text('Username or Password ไม่ถูกต้อง'),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    var registerButton = FlatButton(
      child: new Text('Register New Account'),
      textColor: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.pushNamed(context, '/register');
      },
    );

    TextFormField usernameTextField = TextFormField(
      decoration: const InputDecoration(
        icon: const Icon(Icons.person),
        hintText: 'Username',
      ),
      onSaved: (value) => loginForm.username = value,
    );

    TextFormField passwordTextField = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        icon: const Icon(Icons.lock),
        hintText: 'Password',
      ),
      onSaved: (value) => loginForm.password = value,
    );

    RaisedButton submitButton = RaisedButton(
      child: const Text('LOGIN'),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: _submitForm,
    );

    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidate: true,
        child: Center(
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              usernameTextField,
              SizedBox(height: 24.0),
              passwordTextField,
              SizedBox(height: 24.0),
              submitButton,
              Container(
                alignment: Alignment.centerRight,
                child: registerButton,
              )
            ],
          ),
        ),
      ),
    );
  }
}
