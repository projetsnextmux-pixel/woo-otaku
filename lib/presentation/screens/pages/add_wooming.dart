import 'package:flutter/material.dart';
// Assurez-vous que ce chemin est correct pour votre fichier de couleurs
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/popUp.dart';
import 'package:woo/presentation/screens/pages/creat_event.dart';
import 'package:woo/presentation/screens/pages/event.dart';

class AddWoomingPage extends StatefulWidget {
  const AddWoomingPage({super.key});

  @override
  State<AddWoomingPage> createState() => _AddWoomingPageState();
}

class _AddWoomingPageState extends State<AddWoomingPage> {
  // Données factices pour les Woomings
  final List<Map<String, String>> myWoomings = [
    {
      'name': 'Nom du wooming',
      'date_time': 'Date et heure de diffusion',
      'audience': 'Audience',
      'action': 'Supprimer',
      'type': 'my',
    },
    {
      'name': 'Nom du wooming',
      'date_time': 'Date et heure de diffusion',
      'audience': 'Audience',
      'action': 'Démarrer',
      'type': 'my',
    },
  ];

  final List<Map<String, String>> moreWoomings = [
    {
      'name': 'Nom du wooming',
      'date_time': 'Date et heure de diffusion',
      'author': '@pseudo',
      'action': 'Suivre',
      'type': 'more',
    },
    {
      'name': 'Nom du wooming',
      'date_time': 'Date et heure de diffusion',
      'author': '@pseudo',
      'action': 'rocket', // Icône fusée
      'type': 'more',
    },
    {
      'name': 'Nom du wooming',
      'date_time': 'Date et heure de diffusion',
      'author': '@pseudo',
      'action': 'rocket',
      'type': 'more',
    },
  ];

  // Données factices pour les Événements
  final List<Map<String, String>> myEvents = [
    {
      'name': 'Nom de l\'événement',
      'date_time': 'Date et heure',
      'action': 'Annuler',
      'type': 'my',
    },
    {
      'name': 'Nom de l\'événement',
      'date_time': 'Date et heure',
      'action': 'Annuler',
      'type': 'my',
    },
  ];

  final List<Map<String, String>> moreEvents = [
    {
      'name': 'Nom de l\'événement',
      'date_time': 'Date et heure',
      'author': '@pseudo',
      'action': 'En savoir plus',
      'type': 'more',
    },
    {
      'name': 'Nom de l\'événement',
      'date_time': 'Date et heure',
      'author': '@pseudo',
      'action': 'rocket',
      'type': 'more',
    },
    {
      'name': 'Nom de l\'événement',
      'date_time': 'Date et heure',
      'author': '@pseudo',
      'action': 'rocket',
      'type': 'more',
    },
  ];

  @override
  Widget build(BuildContext context) {
        final colorScheme = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 2, // Deux onglets : Wooming et Events
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.primary, // couleur de l’AppBar
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: colorScheme.surface),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Wooming & événements',
            style: TextStyle(color: colorScheme.surface, fontSize: 18),
          ),
          centerTitle: true,

          // On remplace directement le TabBar par un PreferredSize
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              color: colorScheme.surface, // <-- couleur de fond du TabBar
              child: TabBar(
                labelColor: AppColors.primary,
                indicatorColor: AppColors.primary,
                indicator: BoxDecoration(
                  color: colorScheme.surface, // couleur de l’indicateur
                  border: Border(
                    bottom: BorderSide(color: AppColors.primary, width: 4.0),
                  ),
                ),
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 3,
                dividerColor: Colors.grey[200],
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [Tab(text: 'Wooming'), Tab(text: 'Events')],
              ),
            ),
          ),
        ),

        body: TabBarView(
          children: [
            // Onglet Wooming
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mes wooming',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ...myWoomings.map(_buildWoomingCard),
                  const SizedBox(height: 24),
                  const Text(
                    'Plus de wooming',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ...moreWoomings.map(_buildWoomingCard),
                ],
              ),
            ),

            // Onglet Events
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mes événements',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ...myEvents.map(_buildEventCard),
                  const SizedBox(height: 24),

                  // Bouton "Créer un événement"
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 24),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => CreatEvent()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Créer un événement',
                        style: TextStyle(
                          color: colorScheme.surface,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const Text(
                    'Plus d\'événements',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ...moreEvents.map(_buildEventCard),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWoomingCard(Map<String, String> w) {
        final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorScheme.surface,
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(
        // borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColors.primary, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  w['name']!,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  w['date_time']!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                if (w['type'] == 'my')
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      w['audience']!,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                if (w['type'] == 'more')
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Par ${w['author']!}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
              ],
            ),
            _buildActionButton(w['action']!),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(Map<String, String> e) {
        final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorScheme.surface,
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(
        // borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColors.primary, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e['name']!,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  e['date_time']!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                if (e['type'] == 'more')
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Par ${e['author']!}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
              ],
            ),
            _buildActionButton(e['action']!),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String action) {
        final colorScheme = Theme.of(context).colorScheme;
    if (action == 'rocket') {
      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.push_pin, color: colorScheme.surface, size: 24),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          // Logique action bouton

          if (action == 'suprimer') {
            showDeleteDialog(context);
          } else if (action == 'Démarrer') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CreatEvent()),
            );
          }else if (action == 'Annuler') {
            showAnnulerDialog(context);
          }else if (action == 'En savoir plus') {
                        Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Event()),
            );
          }
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          minimumSize: Size.zero,
        ),
        child: Text(
          action,
          style: TextStyle(color: colorScheme.surface, fontSize: 14),
        ),
      );
    }
  }
}
