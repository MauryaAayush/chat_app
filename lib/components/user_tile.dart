import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  // final String textnum;
  final void Function()? onTap;

  const UserTile(
      {super.key,
      required this.text,
      required this.onTap,
      // required this.textnum

      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            //   icon
            const Icon(Icons.person),

            const SizedBox(
              width: 20,
            ),
            //   user name

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text),
                // Text(textnum),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
