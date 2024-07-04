import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_with_laravel/models/user_model.dart';
import 'package:flutter_auth_with_laravel/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthInitial()) {
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  void _onCheckAuthStatus(
      CheckAuthStatusEvent event, Emitter<AuthState> emit) async {
    final isLoggedIn = await _authService.isLoggedIn();
    debugPrint('Checking auth status. Is logged in: $isLoggedIn');
    if (isLoggedIn) {
      // You might want to fetch user details here if needed
      emit(AuthAuthenticated(
          User(id: 0, name: '', email: '', phone: '', roles: ''), ''));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  void _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authService.register(
          event.name, event.email, event.password, event.phone);

      emit(AuthUnauthenticated()); // User registered but not logged in
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await _authService.login(event.email, event.password);
      debugPrint('Login successful in AuthBloc. Token: ${result['token']}');
      emit(AuthAuthenticated(result['user'], result['token']));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authService.logout();
      debugPrint('Logout successful in AuthBloc');
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
