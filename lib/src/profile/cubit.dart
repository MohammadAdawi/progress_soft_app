import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft_app/app/models/posts_model.dart';
import 'package:progress_soft_app/app/models/users_model.dart';
import 'states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitState());
  static ProfileCubit get(context) => BlocProvider.of(context);
  var searchController = TextEditingController();
  List<PostsModel> postModel = List<PostsModel>.empty();
  bool isSearch = false;

UsersModel? usersModel;
  Future<void> getSystemConfigs() async {
        emit(ProfileLoadingState());
 }


}
enum Gender {
  female,
  male,
}