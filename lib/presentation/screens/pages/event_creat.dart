import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/add_wooming.dart';
// Remplace ce chemin selon la structure de ton projet


class EventCreat extends StatefulWidget {
  const EventCreat({super.key});

  @override
  State<EventCreat> createState() => _EventCreatState();
}

class _EventCreatState extends State<EventCreat> {
  final ValueNotifier<bool> _checked = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checked.value = true;
      // Redirection après animation
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const AddWoomingPage()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _checked.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animation avec ValueListenableBuilder
            ValueListenableBuilder<bool>(
              valueListenable: _checked,
              builder: (context, value, _) {
                return AnimatedScale(
                  scale: value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOutBack,
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 200,
                    color:AppColors.primary,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
           Text(
              'Event programmé',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
