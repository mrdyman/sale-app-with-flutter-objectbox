import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:penjualan_app/app/login/bloc/login_bloc.dart';
import 'package:penjualan_app/models/helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    DBHelper.truncateData(Objectbox.store_);
    DBHelper.putUser(Objectbox.store_);
    DBHelper.putProduct(Objectbox.store_);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'LOGIN',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Visibility(
                  visible: state is LoginError,
                  child: const Text(
                    'Wrong Username / Password',
                    style: TextStyle(color: Colors.redAccent),
                  ));
            },
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: state.usernameTEC,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: state.passwordTEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: () => bloc.add(SignIn(
                    username: bloc.state.usernameTEC.text,
                    password: bloc.state.passwordTEC.text)),
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 18),
                ),
              ))
        ]),
      ),
    );
  }
}
