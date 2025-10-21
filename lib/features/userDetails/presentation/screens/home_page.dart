import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/get_users_cubit.dart';
import '../widgets/shimmer.dart';
import '../widgets/users_list.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // fetch initial
    context.read<GetUsersCubit>().fetchInitialUsers();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 50) {
        // near bottom
        context.read<GetUsersCubit>().fetchMoreUsers();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users'),automaticallyImplyLeading: false,),
      body: BlocBuilder<GetUsersCubit, GetUsersState>(
        builder: (context, state) {
          if (state is GetUsersLoading) {
            return shimmerList();
          } else if (state is GetUsersLoaded) {
            return userList(state.users, state.hasMore, _scrollController);
          } else if (state is GetUsersError) {
            return Center(child: Text(state.message));
          } else {
            // initial
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
