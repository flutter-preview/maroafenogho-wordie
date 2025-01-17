import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordie/src/features/auth/presentation/controllers/current_user.dart';
import 'package:wordie/src/features/auth/presentation/screens/login_screen.dart';
import 'package:wordie/src/features/home/presentation/screens/home.dart';

class Wrapper extends ConsumerWidget {
  static const routeName = '/auth_wrapper';
  const Wrapper({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    return currentUser.when(
      data: (user) {
        return user == null ? LoginScreen() : const HomeScreen();
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => LoginScreen(),
    );
  }
}
