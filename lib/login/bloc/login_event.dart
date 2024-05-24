part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LogInWithGoogle extends LoginEvent {
  const LogInWithGoogle();
}

final class LogInWithCredentials extends LoginEvent {
  const LogInWithCredentials();
}
