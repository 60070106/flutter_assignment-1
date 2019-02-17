import 'package:flutter/material.dart';

class RegisterForm {
  String username;
  String password;
  String confirmPassword;
}

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  RegisterForm registerForm = new RegisterForm();

  void _submitForm() {
    final form = _formKey.currentState;
    form.save();

    if (registerForm.username == '' ||
        registerForm.password == '' ||
        registerForm.confirmPassword == '') {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('กรุณาระบุข้อมูลให้ครบถ้วน'),
      ));

      return;
    }

    if (registerForm.username == 'admin') {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('User นี้มีอยู่ในระบบแล้ว'),
      ));

      return;
    }

    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    TextFormField emailTextField = TextFormField(
      decoration: const InputDecoration(
        icon: const Icon(Icons.person),
        hintText: 'E-mail Address',
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => registerForm.username = value,
    );

    TextFormField passwordTextField = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        icon: const Icon(Icons.lock),
        hintText: 'Password',
      ),
      onSaved: (value) => registerForm.password = value,
    );

    TextFormField confirmPasswordTextField = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        icon: const Icon(Icons.lock),
        hintText: 'Confirm Password',
      ),
      onSaved: (value) => registerForm.confirmPassword = value,
    );

    RaisedButton registerButton = RaisedButton(
      child: const Text('CONTINUE'),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: _submitForm,
    );

    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          children: <Widget>[
            emailTextField,
            SizedBox(height: 24.0),
            passwordTextField,
            SizedBox(height: 24.0),
            confirmPasswordTextField,
            SizedBox(height: 24.0),
            registerButton,
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('REGISTER'),
        centerTitle: true,
      ),
    );
  }
}
