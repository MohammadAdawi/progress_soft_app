import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft_app/app/models/posts_model.dart';
import 'package:progress_soft_app/shared/network/dio_client/dio_client.dart';
import 'package:progress_soft_app/shared/network/endpoints/endpoints.dart';
import 'states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());
  static HomeCubit get(context) => BlocProvider.of(context);
  var searchController = TextEditingController();
  List<PostsModel> postModel = List<PostsModel>.empty();
  bool isSearch = false;

  void getPosts() {
    emit(HomeLoadingState());
    DioClient.get(url: EndPoints.posts, queryParams: {}).then((value) {
      if (value.statusCode == 200) {
        List<dynamic> listDynamic = value.data;
        postModel = listDynamic.map((x) => PostsModel.fromJson(x)).toList();
        emit(HomeSuccessState());
        print(value.data.toString());
      } else {
        String errorMessage =
            value.data['errmsg'] ?? "Error message from old API";
        emit(HomeErrorState(
          errorMessage: errorMessage,
        ));
      }
      emit(HomeErrorState());
    }).catchError((error) {
      emit(HomeErrorState(
        errorCode: 9001,
        errorMessage: "Something went wrong",
      ));
    });
  }

  filterResults() {
            emit(HomeLoadingState());

    List<PostsModel> data =List<PostsModel>.empty();
 data=postModel.where((post) =>
        post.title
            .toLowerCase()
            .contains(searchController.text.toLowerCase()) ||
        post.body.toLowerCase().contains(searchController.text.toLowerCase())).toList();
       
   postModel.clear();
postModel.addAll(data);
    emit(HomeSuccessState());

  }

  removeFilter() {
    searchController.clear();
    getPosts();
  }
}
