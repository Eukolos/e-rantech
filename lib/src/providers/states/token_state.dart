import 'package:equatable/equatable.dart';

class TokenState extends Equatable {
  const TokenState();

  @override
  List<Object> get props => [];

}

class TokenStateInitial extends TokenState {
  const TokenStateInitial();

  @override
  List<Object> get props => [];
}
class TokenStateLoading extends TokenState {
  const TokenStateLoading();

  @override
  List<Object> get props => [];
}
class TokenStateSuccess extends TokenState {
  const TokenStateSuccess();

  @override
  List<Object> get props => [];
}
class TokenStateError extends TokenState {
  final String error;

  const TokenStateError(this.error);

  @override
  List<Object> get props => [error];
}