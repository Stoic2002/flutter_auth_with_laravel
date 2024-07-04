// import 'package:flutter/material.dart';
// import '../models/user_model.dart';

// class UserHomeScreen extends StatelessWidget {
//   final User user;

//   const UserHomeScreen({Key? key, required this.user}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User Home'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.exit_to_app),
//             onPressed: () {
//               // Implement logout logic here
//               Navigator.of(context).pushReplacementNamed('/login');
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Welcome, ${user.name}!',
//                 style: const TextStyle(fontSize: 24)),
//             const SizedBox(height: 20),
//             Text('Role: ${user.role}', style: const TextStyle(fontSize: 18)),
//             const SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: () {
//                 // Add user-specific functionality here
//               },
//               child: const Text('User Action'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
