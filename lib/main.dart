import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:male_app/core/database/cach/cach_helper.dart';
import 'package:male_app/features/user/presentation/cubit/user_cubit.dart';
import 'package:male_app/features/user/presentation/screens/user_screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
       home: BlocProvider(
        create: (context) => UserCubit()..getFailureOrUser(1),
        child: const UserScreen(),
      ),
    );
  }
}