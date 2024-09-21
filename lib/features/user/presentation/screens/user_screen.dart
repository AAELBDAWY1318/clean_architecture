import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:male_app/features/user/presentation/cubit/user_cubit.dart';
import 'package:male_app/features/user/presentation/cubit/user_states.dart';
import 'package:male_app/features/user/presentation/widgets/custom_landing.dart';
import 'package:male_app/features/user/presentation/widgets/custom_search_bar.dart';
import 'package:male_app/features/user/presentation/widgets/user_data.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: state is GetUserSuccessfully
              ? ListView(
                  children: [
                    const LandingWidget(),
                    UserData(user: state.user),
                    const CustomSearchBar(),
                  ],
                )
              : state is GetUserFailure
                  ? Text(state.errMessage)
                  : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
