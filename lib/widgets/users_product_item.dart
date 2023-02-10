import 'package:flutter/material.dart';

class UsersProductItems extends StatelessWidget {
  final String title;
  final String imageUrl;
  const UsersProductItems(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(title),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit_note,
                    color: Colors.teal,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
