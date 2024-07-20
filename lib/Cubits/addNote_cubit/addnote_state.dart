part of 'addnote_cubit.dart';

@immutable
sealed class AddnoteState {}

final class AddnoteInitial extends AddnoteState {}

final class AddnoteLoading extends AddnoteState {}

final class AddnoteSucsses extends AddnoteState {}

final class AddnoteFailure extends AddnoteState {
  final String errmassage;

  AddnoteFailure(this.errmassage);
}
