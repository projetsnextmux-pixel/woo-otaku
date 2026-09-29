import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/news.dart';

class Break extends StatefulWidget {
  const Break({super.key});
  @override
  State<Break> createState() => _BreakState();
}

class _BreakState extends State<Break> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
            color: AppColors.white,
            ),
          ),
          
          // Contenu principal de la page
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                const SizedBox(height: 100),


              // Image en haut de la page
          


                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Image.asset(
                      'images/404.png',
                      height: 300,
                    ),
                  ),
                ),
                const SizedBox(height: 100),


                Center(
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      "Pas de connexion à internet.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),


                const SizedBox(height: 100),

                Center(
                  child: Container(
                    width: 500,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: AppColors.white,
                        width: 1.0,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsPage()));
                      },
                      child: Text(
                        'Actualiser',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
