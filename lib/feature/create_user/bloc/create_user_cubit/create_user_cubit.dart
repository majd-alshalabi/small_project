import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit() : super(CreateUserInitial());

  DateTime? enterSelectedTime;
  DateTime? leaveSelectedTime;

  void dispose() {
    enterSelectedTime = null;
    leaveSelectedTime = null;
  }
}
