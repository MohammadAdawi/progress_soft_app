import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ReloadApi extends StatelessWidget {
  final VoidCallback onPressed;
  const ReloadApi({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("something went wrong"),
          const Gap(8),
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh_outlined),
            label: const Text("try again"),
          ),
        ],
      ),
    );
  }
}
