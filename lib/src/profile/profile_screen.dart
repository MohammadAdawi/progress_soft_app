import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_soft_app/shared/local/preference_utils/preference_utils.dart';
import 'package:progress_soft_app/shared/local/theme/theme.dart';
import 'package:progress_soft_app/src/profile/cubit.dart';
import 'package:progress_soft_app/src/profile/states.dart';


class ProfileScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit(),
        child: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ProfileCubit.get(context);
            return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                   CircleAvatar(
                    radius: 50.sp,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: AppTheme.primaryColor,
                      child: IconButton(
                        icon: const Icon(Icons.edit, size: 15),
                        color: Colors.white,
                        onPressed: () {
                         
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
             Text(
              PreferenceUtils.getString(
                                          "fullName"),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ProfileItem(
              icon: Icons.cake,
              label: 'Age',
              value: PreferenceUtils.getString(
                                          "age"), 
            ),
            ProfileItem(
              icon: Icons.wc,
              label: 'Gender',
              value:  PreferenceUtils.getString(
                                          "age")=="1"?"Male":"Female", 
            ),
            ProfileItem(
              icon: Icons.phone,
              label: 'Phone Number',
              value: PreferenceUtils.getString(
                                          "phoneNumber"), 
            ),
          ],
        ),
      );
  
          },
        ),
      ),
    );
  }
}
class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  ProfileItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}