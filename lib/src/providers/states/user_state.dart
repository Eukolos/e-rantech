import 'package:equatable/equatable.dart';
import 'package:erantech/src/models/user.dart';

class UserState extends Equatable {
  final User? user;
  final String? error;
  final bool isLoading;

  const UserState({
    this.user,
    this.error,
    this.isLoading = false,
  });

  UserState copyWith({
    User? user,
    String? error,
    bool? isLoading,
  }) {
    return UserState(
      user: user ?? this.user,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [user, error, isLoading];
}
