import 'package:context_holder/context_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:penjualan_app/app/product/bloc/product_bloc.dart';
import 'package:penjualan_app/app/product/product_screen.dart';
import 'package:penjualan_app/models/helper.dart';
import 'package:penjualan_app/models/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    BuildContext context = ContextHolder.currentContext;
    on<Login>((event, emit) async {
      bool loginSuccess =
          await isGranted(username: event.username, password: event.password);
      if (loginSuccess && context.mounted) {
        emit(LoginSuccess());
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider<ProductBloc>(
                      create: (context) => ProductBloc(),
                      child: const ProductScreen(),
                    )));
      } else {
        emit(LoginError());
      }
    });
  }

  Future<bool> isGranted(
      {required String username, required String password}) async {
    User? user = await DBHelper.getUser(Objectbox.store_, username);
    return user == null ? false : true;
  }
}
