import 'package:flutter/material.dart';
import 'package:progress_soft_app/shared/local/helpers/router/app_router.dart';

import '../../local/theme/theme.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => AppRouter.pop(),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppTheme.primaryColor,
      ),
    );
  }
}
