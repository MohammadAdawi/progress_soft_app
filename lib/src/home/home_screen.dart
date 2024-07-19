import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft_app/shared/local/theme/theme.dart';
import 'package:progress_soft_app/src/home/cubit.dart';
import 'package:progress_soft_app/src/home/states.dart';
import 'package:progress_soft_app/src/home/widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => HomeCubit()..getPosts(),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppTheme.whiteTextColor ,

          ),

                    child: TextField(
                                          controller: cubit.searchController,
                    
                      onChanged: (value) {
                      },
                      decoration: InputDecoration(
                        fillColor:AppTheme.whiteTextColor ,

                        hintText: 'Search',
                        suffixIcon: InkWell(
                          onTap: () {
                          cubit.isSearch  =!cubit.isSearch;
                            if(cubit.isSearch){cubit.filterResults();}else {
                              cubit.  removeFilter();
                            }
                          },
                          onDoubleTap: () {
                            
                          },
                          child: Icon(cubit.isSearch?Icons.close:Icons.search)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.postModel.length,
                    itemBuilder: (context, index) {
                      return PostCard(post: cubit.postModel[index]);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
