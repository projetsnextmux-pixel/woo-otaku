import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/achtag.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/create_news2.dart';

class MyFavory extends StatefulWidget {
  const MyFavory({super.key});
  @override
  State<MyFavory> createState() => _MyFavoryState();
}

class _MyFavoryState extends State<MyFavory> {
  int _selectedTabIndex = 0;


  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Mes Favoris",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade500,
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTab("Photos", 0),
              _buildTab("Vidéos", 1),
              _buildTab("Hashtags", 2),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: IndexedStack(
              index: _selectedTabIndex,
              children: [
                _buildPhotoGrid(),
                _buildVideoGrid(),
                _buildHashtag(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Button(
              name: 'Suivant',
              buttonColor: AppColors.primary,
              buttonTextColor: Colors.white,
              buttonWidth: double.infinity,
              buttonFonSize: 15,
              borderbuttonColor: AppColors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePage2()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: Button(
        name: title,
        buttonColor: isSelected ? AppColors.primary : Colors.grey.shade300,
        buttonTextColor:  Colors.white ,
        buttonFonSize: 15,
        onTap: () => _onTabSelected(index),
      ),
    );
  }

  Widget _buildPhotoGrid() {
    final List<String> images = [
      'images/n2.png',
      'images/n3.png',
      'images/n4.png',
      'images/n1.png',
      'images/n3.png',
      'images/logo.png',
    ];

    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: EdgeInsets.all(8.0),
      itemCount: images.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildCameraButton();
        }
        final imagePath = images[index - 1];
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  Widget _buildVideoGrid() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            padding: EdgeInsets.all(10),
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.videocam, size: 40, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  "Enregistrer une vidéo",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('images/n2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCameraButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt, size: 40, color: Colors.white),
            SizedBox(height: 10),
            Text(
              "Utiliser la caméra",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildHashtag() {
  return SizedBox(
    height: 110, // Hauteur définie
    child: Achtag(
        name: 'Pseudo',
        backgroundColor: AppColors.white,
        // simbole:"#",
        message: 'Hello world', 
        iconData: Icons.tag, // ou tout autre IconData, ex. Icons.tag,
        onTap: () { /* … */ },
      ),
  );
}


}