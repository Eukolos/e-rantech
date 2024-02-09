import 'package:equatable/equatable.dart';
import 'package:erantech/src/models/user.dart';

class UserState extends Equatable {
  final User user;

  const UserState(this.user);

  @override
  List<Object> get props => [user];

}

class UserStateInitial extends UserState {
  const UserStateInitial(User user) : super(user);

  @override
  List<Object> get props => [];
}
class UserStateLoading extends UserState {
  const UserStateLoading();

  @override
  List<Object> get props => [];
}
class UserStateSuccess extends UserState {
  const UserStateSuccess();

  @override
  List<Object> get props => [];
}
class UserStateError extends UserState {
  final String error;

  const UserStateError(this.error);

  @override
  List<Object> get props => [error];
}