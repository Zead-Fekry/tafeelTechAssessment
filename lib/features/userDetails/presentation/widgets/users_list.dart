import 'package:flutter/material.dart';
 import '../../../users/presentation/screens/user_details.dart';
import '../../domain/entities/user_entity.dart';

Widget userList(List<UserEntity> users, bool hasMore, ScrollController scrollController) {
  return ListView.builder(
    controller: scrollController,
    itemCount: users.length + (hasMore ? 1 : 0),
    itemBuilder: (context, index) {
      if (index < users.length) {
        final user = users[index];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => UserDetailsScreen(userId: user.id, heroTag: 'avatar_${user.id}'),
              ),
            );
          },
          leading: Hero(
            tag: 'avatar_${user.id}',
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
            ),
          ),
          title: Text('${user.firstName} ${user.lastName}'),
          subtitle: Text(user.email),
        );
      } else {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Center(child: CircularProgressIndicator()),
        );
      }
    },
  );
}
