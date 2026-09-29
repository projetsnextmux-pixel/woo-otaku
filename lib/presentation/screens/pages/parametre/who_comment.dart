import 'package:flutter/material.dart';
import 'package:woo/core/widgets/font.dart';
import 'package:woo/core/widgets/color.dart';

class WhoCommente extends StatefulWidget {
  const WhoCommente({super.key});

  @override
  State<WhoCommente> createState() => _WhoCommenteState();
}

class _WhoCommenteState extends State<WhoCommente> {
  String selectedOption = "Public"; // Option sélectionnée par défaut
  final List<String> options = ["Public", "Abonnés"]; // Liste des options

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: AppColors.white,
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                "Qui peut commenter tes publications",
                style: AppTextStyles.poppinsRegular.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              height: 1.5,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           
            // Liste des options
            Column(
              children: options.map((String option) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOption = option;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                   
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          option,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 15,
                          ),
                        ),
                        if (option == selectedOption)
                          const Icon(Icons.check, color: AppColors.primary),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
