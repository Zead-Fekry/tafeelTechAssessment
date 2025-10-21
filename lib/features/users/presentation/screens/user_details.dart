import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../manager/get_user_cubit.dart';
import '../widgets/shimmer_user_details.dart';

class UserDetailsScreen extends StatelessWidget {
  final int userId;
  final String heroTag;

  const UserDetailsScreen({
    Key? key,
    required this.userId,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<GetSingleUserCubit>()..fetchUser(userId),
      child: Scaffold(
        appBar: AppBar(title: const Text('User Details')),
          body: BlocBuilder<GetSingleUserCubit, GetSingleUserState>(
            builder: (context, state) {
              if (state is GetSingleUserLoading) {
                return shimmerUserDetails();
              } else if (state is GetSingleUserLoaded) {
                final user = state.user;
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'avatar_${user.id}',
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(user.avatar),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${user.firstName} ${user.lastName}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(user.email),
                      ],
                    ),
                  ),
                );
              } else if (state is GetSingleUserError) {
                return const Center(child: Text('Something went wrong.'));
              } else {
                return const SizedBox.shrink();
              }
            },
          )

      ),
    );
  }
}
