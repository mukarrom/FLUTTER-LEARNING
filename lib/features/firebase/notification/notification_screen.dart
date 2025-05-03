import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<int> ids = [3, 4, 5, 9];
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xff32383D) : Colors.white,
      appBar: AppBar(
        title: Text("Notification"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, size: 24)),
        ],
      ),
      body: ListView.separated(
        itemCount: 15,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            tileColor:
                ids.contains(index)
                    ? Color(0xffDEEAFF)
                    : isDarkMode
                    ? Color(0xff32383D)
                    : null,
            leading: CircleAvatar(
              radius: 22,
              // image form unsplash
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
              ),
            ),
            title: Text(
              "Notification $index",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color:
                    !ids.contains(index) && isDarkMode
                        ? Color(0xffEBEBEB)
                        : Color(0xff333333),
              ),
            ),
            subtitle: Text(
              "10 min Ago",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff8D8D8D),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 8);
        },
      ),
    );
  }
}
