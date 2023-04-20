// import 'package:flutter/material.dart';

// class NotificationPage extends StatelessWidget {
//   final String name;
//   final List<String> messages;

//     NotificationPage({required this.name, required this.messages});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notification'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               '$name has exceeded the limit of 100!',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 32),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Dismiss'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// class NotificationPage extends StatelessWidget {
//   final String name;
//   final List<String> messages;

//   NotificationPage({required this.name, required this.messages});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notifications for $name'),
//       ),
//       body: ListView.builder(
//         itemCount: messages.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text(messages[index]),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class NotificationPage extends StatelessWidget {
//   final String name;
//   final List<String> messages;

//   const NotificationPage({required this.name, required this.messages});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notifications'),
//       ),
//       body: ListView.builder(
//         itemCount: messages.length,
//         itemBuilder: (context, index) {
//           final message = messages[index];
//           return ListTile(
//             title: Text(message),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final String name;
  final List<String> messages;

  const NotificationPage({required this.name, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return ListTile(
            title: Text(message),
            subtitle: Text(
              message.length > 100 ? 'Message name has exceeded 100' : '',
              style: TextStyle(color: Colors.red),
            ),
            leading: Icon(Icons.forward_to_inbox),
            trailing: Icon(Icons.security_update_warning_sharp),
            onTap: () {
              // navigate to message detail page
            },
          );
        },
      ),
    );
  }
}
