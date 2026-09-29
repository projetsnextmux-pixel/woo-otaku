// import 'package:flutter/material.dart';
// import 'package:woo/core/widgets/annonce_publicitaire.dart';
// import 'package:woo/core/widgets/barre_recherche.dart';
// import 'package:woo/core/widgets/formfield.dart';
// import 'package:woo/core/widgets/notification.dart';
// import 'package:woo/core/widgets/notificationpage.dart';
// import 'package:woo/core/widgets/chat.dart';
// import 'package:woo/core/widgets/publication.dart';
// import 'package:woo/core/widgets/hashtag_widget.dart'; // Importation de HashtagWidget

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Accueil'),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Ajout de padding global
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Intégration de Rechercher
//                   Rechercher(
//                     controller: TextEditingController(),
//                     hintText: "Rechercher...",
//                     onPressed: () {
//                       // Action à effectuer lors du clic sur l'icône de recherche
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               const Chat(name: 'Discussion avec Alice'),
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 20),

//                   // Affichage du widget HashtagWidget
//                   HashtagWidget(),  // Ajouter le widget des hashtags ici

//                   const SizedBox(height: 20),

//                   // Bouton pour afficher une notification
//                   ElevatedButton(
//                     onPressed: () {
//                       NotificationService.showNotification(
//                         context,
//                         'Ceci est une notification!',
//                       );
//                     },
//                     child: const Text('Afficher une Notification'),
//                   ),
//                   const SizedBox(height: 20),

//                   // Affichage d'une notification simulée
//                   NotificationPage(
//                     name: 'Nouvelle Notification',
//                     message: 'Vous avez reçu un nouveau message.',
//                     backgroundColor: Colors.blueAccent,
//                     onTap: () {
//                       print('Notification 1 cliquée');
//                     },
//                     imageUrl: const AssetImage("images/96x96.png"),
//                     message3: 'Il y a 2h',
//                   ),
//                   const SizedBox(height: 10),
//                 ],
//               ),
//             ),

//             // Suppression du padding global pour AdCard
//             AdCard(
//               imageUrl: const AssetImage('images/96x96.png'),
//               adText: 'Découvrez nos offres incroyables dès maintenant !',
//               onTap: () {
//                 print('Annonce publicitaire cliquée');
//               },
//             ),
//             const SizedBox(height: 20),

//             // Ajout de padding global pour les widgets suivants
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Bouton pour naviguer vers le chat
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               const Chat(name: 'Discussion avec Alice'),
//                         ),
//                       );
//                     },
//                     child: const Text('Aller au Chat'),
//                   ),
//                   const SizedBox(height: 20),

//                   // Formulaire
//                   const Text(
//                     "Formulaire d'Exemple",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   FormFieldWidget(
//                     labelContent: 'nom',
//                     maxLengtText: 20,
//                     prefixIconWidget: const Icon(Icons.person),
//                     suffixIconVisible: const Icon(Icons.visibility),
//                     suffixIconHidden: const Icon(Icons.visibility_off),
//                     onTap: () {
//                       print('Champ de formulaire tapé.');
//                     },
//                   ),
//                   const SizedBox(height: 20),

//                   // Affichage de la publication
//                   Publication(
//                     likesCount: '123',
//                     commentsCount: '45',
//                     imageUrl: const AssetImage('images/96x96.png'),
//                     onTap: () {
//                       print('Publication tapée');
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SearchPage extends StatelessWidget {
//   const SearchPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Page de Recherche'),
//       ),
//       body: Center(
//         child: Text('Effectuer votre recherche ici...'),
//       ),
//     );
//   }
// }
