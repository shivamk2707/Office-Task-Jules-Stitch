import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import 'dart:convert';

abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  SignInEvent(this.email, this.password);
}

class SignOutEvent extends AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthAuthenticated extends AuthState {
  final User user;
  AuthAuthenticated(this.user);
}
class AuthUnauthenticated extends AuthState {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckAuthEvent>((event, emit) async {
      emit(AuthLoading());
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('user');
      if (userJson != null) {
        emit(AuthAuthenticated(User.fromJson(jsonDecode(userJson))));
      } else {
        emit(AuthUnauthenticated());
      }
    });

    on<SignInEvent>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 1)); // simulate network
      final mockUser = User(id: '1', name: 'Julian', email: event.email);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(mockUser.toJson()));
      emit(AuthAuthenticated(mockUser));
    });

    on<SignOutEvent>((event, emit) async {
      emit(AuthLoading());
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user');
      emit(AuthUnauthenticated());
    });
  }
}
