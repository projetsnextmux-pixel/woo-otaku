import 'package:flutter/material.dart';
import 'package:woo/core/widgets/font.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/button.dart';


class Condition extends StatefulWidget {
  const Condition({super.key});

  @override
  State<Condition> createState() => _ConditionState();
}

class _ConditionState extends State<Condition> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true, // Centrer le titre dans l'AppBar
        title: Text(
          'FAQ WOO',
          style: AppTextStyles.poppinsRegular.copyWith(
            color: colorScheme.surface,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      body: Container(
        color: colorScheme.surface, // Couleur de fond pour tout le body
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(0), // Ajout de marges globales
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Titre principal
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Conditions d'utilisation de WOO - World Of Otaku",
                        style: AppTextStyles.poppinsSemiBold.copyWith(
                          color: AppColors.primary,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5), // Espacement entre les éléments
                    // Dernière mise à jour
                    Container(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Dernière mise à jour : Novembre 2024",
                        style: AppTextStyles.poppinsSemiBold.copyWith(
                          color: AppColors.text,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Paragraphe 1
                    Container(
                      color: AppColors.primary2,
                      padding: const EdgeInsets.all(20.0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Alignement à gauche
                        children: [
                          Text(
                            "Introduction",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "1. Acceptation des conditions d'utilisation",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "2. Définition des termes clés",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "3. Utilisation du service",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "4. Contenu utilisateur",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "5. Interactions entre utilisateurs",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "6. Sécurité et confidentialité des données",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "7. Responsabilités et limitations",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "8. Modifications des conditions d'utilisation",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "9. Résiliation du compte",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "10. Dispositions générales",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Conclusion",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Paragraphe 1
                    Container(
                      color: colorScheme.surface,
                      padding: const EdgeInsets.all(20.0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Alignement à gauche
                        children: [
                          Text(
                            "Introduction",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "Présentation du réseau social WOO - World Of Otaku",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Plongez dans l'univers de l'Otaku avec WOO**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Vous êtes un Otaku ? Vous recherchez un espace en ligne où partager vos intérêts, découvrir de nouveaux contenus et interagir avec une communauté vibrante partageant les mêmes passions que vous ? Ne cherchez pas plus loin, car WOO - World Of Otaku est là pour vous !",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "WOO est bien plus qu'un simple réseau social, c'est un véritable portail vers l'univers riche et diversifié de l'otaku. Que vous soyez un fan de manga, d'anime, de jeux vidéo, de cosplay ou de tout ce qui touche de près ou de loin à la culture japonaise, vous trouverez votre bonheur sur WOOr",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "**Une communauté dynamique et accueillante**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "Sur WOO, vous rejoindrez une communauté dynamique et accueillante, composée de passionnés partageant leurs créations, leurs recommandations, leurs expériences et leurs réflexions sur tout ce qui concerne l'Otaku. Rencontrez des personnes partageant les mêmes centres d'intérêt, faites-vous de nouveaux amis et échangez des idées dans un environnement convivial et respectueux",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "**Découvrez du contenu exclusif**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "En plus de connecter des individus, WOO vous donne accès à une multitude de contenus exclusifs. Explorez une bibliothèque de mangas numériques, regardez des séries et des films d'animation en streaming, participez à des événements en ligne, découvrez des critiques et des analyses approfondies, et bien plus encore. Quels que soient vos goûts et vos intérêts, vous trouverez certainement quelque chose à apprécier sur WOO.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "**Exprimez-vous librement**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "Sur WOO, votre voix compte. Partagez vos créations artistiques, écrivez des critiques, lancez des discussions, créez des groupes thématiques, organisez des événements et engagez-vous avec d'autres membres de la communauté. Laissez libre cours à votre créativité et à votre passion, et découvrez le plaisir de partager vos centres d'intérêt avec des personnes qui les apprécient tout autant que vous",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "**Sécurité et confidentialité avant tout**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "Chez WOO, la sécurité et la confidentialité de nos utilisateurs sont notre priorité absolue. Nous avons mis en place des mesures robustes pour protéger vos données personnelles et assurer un environnement en ligne sûr et sécurisé pour tous lesmembres de notre communauté. Vous pouvez donc profiter de WOO en toute tranquillité d'esprit, en sachant que vos informations sont entre de bonnes mains.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "**Rejoignez-nous dès aujourd'hui !**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "Si vous êtes prêt à plonger dans l'univers fascinant de l'Otaku et à rejoindre une communauté passionnée et engagée, ne tardez plus et rejoignez WOO - World Of Otaku dès aujourd'hui ! L'inscription est rapide, gratuite et ouverte à tous. Rejoigneznous et faites partie d'une expérience inoubliable où vos passions prendront vie comme jamais auparavant",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "7. Responsabilités et limitations",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "=============================================================⇒",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "*********************",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "<==============================================================",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "- Objectif et mission",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "**Découvrez les Objectifs et la Mission de WOO - World Of Otaku : For our passions**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "Depuis sa création, WOO - World Of Otaku s'est engagé à être bien plus qu'un simple réseau social pour les passionnés de la culture Otaku. Notre plateforme a pour mission de créer un espace en ligne dynamique et inclusif où les Otaku du monde entier peuvent se connecter, s'inspirer mutuellement et partager leur amour pour tout ce qui touche à la culture japonaise. Voici un aperçu de nos objectifs et de notre mission :",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "1. Connecter les passionnés",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "WOO a pour objectif premier de connecter les passionnés de la culture Otaku, qu'ils soient novices ou vétérans, de toutes origines et de tous horizons. Nous croyons fermement au pouvoir de la communauté et à la force des liens qui se tissent entre les individus partageant les mêmes intérêts. Sur WOO, vous pouvez rencontrer des personnes qui partagent vos passions, échanger des idées et des expériences, et créer des amitiés durables avec d'autres membres de la communauté.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                          Text(
                            "2. Inspirer la créativité",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Nous croyons que chacun a un artiste qui sommeille en lui, et c'est pourquoi WOO encourage et célèbre la créativité sous toutes ses formes. Que vous soyez un dessinateur talentueux, un cosplayer passionné, un écrivain en herbe ou tout simplement un fan qui aime partager ses idées, vous trouverez sur WOO un espace pour exprimer votre créativité et être inspiré par les réalisations des autres membres de la communauté.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "3. Partager les connaissances et les expériences",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "WOO est un lieu où le savoir et les expériences sont partagés librement. Que vous souhaitiez discuter des dernières tendances dans l'industrie de l'animation japonaise, partager des recommandations de manga à lire, ou simplement échanger des anecdotes sur vos expériences Otaku, vous trouverez toujours quelqu'un sur WOO prêt à vous écouter et à partager ses propres connaissances et expériences.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "4. Promouvoir la diversité et l'inclusion",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Chez WOO, nous croyons en la force de la diversité et de l'inclusion. Notre plateforme est ouverte à tous, quelle que soit votre origine, votre identité de genre, votre orientation sexuelle ou vos croyances. Nous nous efforçons de créer un environnement sûr et accueillant où chacun peut se sentir libre d'être lui-même et de s'exprimer sans crainte de jugement ni de discrimination.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "5. Cultiver une communauté bienveillante",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Enfin, notre mission est de cultiver une communauté bienveillante et respectueuse où chacun se sent valorisé et respecté. Nous encourageons le respect mutuel, la tolérance et l'empathie envers les autres membres de la communauté, et nous mettons tout en œuvre pour promouvoir un environnement positif et constructif sur WOO",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Rejoignez-nous dans notre mission !**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Si vous partagez nos objectifs et notre vision, nous vous invitons à rejoindre la communauté de WOO - World Of Otaku dès aujourd'hui ! Ensemble, nous pouvons créer un espace en ligne dynamique et inclusif où les passionnés de la culture otaku peuvent se connecter, s'inspirer et partager leur amour pour tout ce qui touche à la culture japonaise.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "=============================================================⇒",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "*********************",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "<==============================================================",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Importance de lire et de comprendre les Conditions d'Utilisation de WOO - World Of Otaku",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Lorsque vous vous lancez dans l'aventure d'un nouveau réseau social tel que WOO",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "- World Of Otaku, il est facile de se laisser emporter par l'excitation de découvrir de nouveaux contenus, de rencontrer des personnes partageant les mêmes passions et de partager ses propres créations. Cependant, il est tout aussi crucial de prendrele temps de lire et de comprendre les conditions d'utilisation de la plateforme. Voici pourquoi :",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "1. Connaissance de vos droits et responsabilités",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Les conditions d'utilisation de WOO définissent les règles et les normes qui régissent votre utilisation de la plateforme. Elles précisent vos droits en tant qu'utilisateur ainsi que vos responsabilités envers la communauté. En comprenant ces règles, vous saurez ce qui est autorisé et ce qui est interdit sur WOO, ce qui vous permettra de naviguer sur la plateforme en toute sécurité et de manière responsable.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "2. Protection de votre vie privée et de vos données",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Les conditions d'utilisation de WOO incluent généralement des clauses concernant la confidentialité des données et la sécurité des informations personnelles des utilisateurs. En comprenant ces clauses, vous saurez comment vos données sont collectées, utilisées et protégées sur la plateforme. Cela vous permettra de prendre des décisions éclairées concernant la confidentialité de vos informations personnelles et de mieux protéger votre vie privée en ligne.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "3. Prévention des abus et des comportements inappropriés",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Les conditions d'utilisation de WOO énoncent généralement des règles concernant le comportement des utilisateurs sur la plateforme, telles que l'interdiction du harcèlement, du discours de haine, de la violence et d'autres comportements inappropriés. En comprenant ces règles, vous serez mieux équipé pour reconnaître et signaler les comportements abusifs, ce qui contribue à maintenir un environnement sûr et respectueux pour tous les membres de la communauté.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "4. Acceptation des conditions pour utiliser le service",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En utilisant WOO, vous acceptez automatiquement les conditions d'utilisation de la plateforme. Par conséquent, il est essentiel de les lire et de les comprendre avant de commencer à utiliser le service. Ignorer les conditions d'utilisation peut entraîner des conséquences indésirables, telles que la violation involontaire des règles de la plateforme ou la perte de droits légaux.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "5. Engagement envers la transparence et la confiance",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En fin de compte, la lecture et la compréhension des conditions d'utilisation de WOO démontrent votre engagement envers la transparence et la confiance dans votre utilisation de la plateforme. En comprenant les règles et les normes établies par WOO, vous contribuez à créer un environnement en ligne plus sûr, plus respectueux et plus inclusif pour tous les utilisateurs.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Prendre le temps de lire et de comprendre les conditions d'utilisation de WOO - World Of Otaku est une étape essentielle pour profiter pleinement de votre expérience sur la plateforme. En comprenant vos droits et responsabilités, en protégeant votre vie privée et en contribuant à maintenir un environnement en ligne sûr et respectueux, vous contribuez à créer une communauté Otaku dynamique et épanouissante sur WOO.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "2. Acceptation des conditions d'utilisation",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Déclaration de l'acceptation des conditions d'utilisation en utilisant le service",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Naviguer sur WOO - World Of Otaku : Une Déclaration d'Acceptation des Conditions d'Utilisation**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Lorsque vous embarquez pour l'aventure captivante de WOO - World Of Otaku, vous devenez un membre essentiel de notre communauté Otaku dynamique. Cependant, avant de plonger tête baissée dans ce monde foisonnant de contenus, de créations et de rencontres, il est impératif de reconnaître et de déclarer explicitement votre acceptation des Conditions d'Utilisation de WOO.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Un Engagement Réciproque**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "La déclaration d'acceptation des conditions d'utilisation est bien plus qu'une formalité juridique ; elle symbolise un engagement mutuel entre vous, en tant qu'utilisateur passionné, et nous, en tant que gardiens de l'espace WOO. C'est une promesse de respecter les règles, de contribuer positivement et de créer ensemble une expérience Otaku enrichissante.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**La clé de l'accès complet à WOO**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En déclarant votre acceptation des conditions d'utilisation, vous débloquez l'accès complet aux fonctionnalités de WOO. Cela inclut la possibilité de créer un profil unique, de partager vos créations, de participer à des discussions enrichissantes, et bien sûr, de découvrir un éventail diversifié de contenus liés à la culture Otaku. Cette déclaration est la clé qui ouvre les portes de l'univers WOO.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Comprendre vos droits et vos responsabilités**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Accepter les conditions d'utilisation de WOO signifie que vous comprenez et acceptez les droits et les responsabilités qui vous incombent en tant qu'utilisateur. Cela implique le respect des autres membres de la communauté, l'adhésion auxrègles de conduite énoncées et la contribution à la création d'un espace en ligne positif et respectueux.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Protéger votre vie privée avec connaissance**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "La déclaration d'acceptation des conditions d'utilisation comprend également votre accord pour la protection de votre vie privée. En comprenant ces termes, vous vous assurez que vos informations personnelles sont traitées de manière responsable et sécurisée. Votre déclaration est une étape cruciale pour créer un environnement où chaque membre se sent en sécurité et respecté.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Un pas vers une Communauté Otaku Épanouissante**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Votre déclaration d'acceptation n'est pas simplement une formalité administrative, mais un pas concret vers la construction d'une communauté Otaku épanouissante sur WOO. En proclamant votre accord, vous rejoignez des milliers d'autres passionnés qui contribuent à faire de WOO un espace vibrant où la créativité, le partage et la camaraderie Otaku prospèrent.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Comment déclarer votre acceptation**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "La déclaration d'acceptation des conditions d'utilisation se fait lors de votre inscription sur WOO. Avant de plonger dans les trésors de notre communauté Otaku, prenez un moment pour lire attentivement les conditions d'utilisation et déclarez votre accord. C'est une étape simple mais significative qui marque le début de votre voyage sur WOO - World Of Otaku.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En acceptant nos conditions, vous devenez un membre actif de notre communauté, façonnant l'avenir de WOO avec votre passion, votre créativité et votre respect envers vos pairs Otaku. Bienvenue sur WOO, là où la culture Otaku prend vie, et où votre déclaration d'acceptation contribue à forger une communauté unique et dynamique.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "=============================================================⇒",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "*********************",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "<==============================================================",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Conditions d'utilisation contraignantes pour tous les Otaku sur WOO - World Of Otaku**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Bienvenue sur WOO - World Of Otaku, un espace dédié à la passion Otaku ! Avant de plonger dans les profondeurs de notre communauté, il est essentiel de reconnaître et d'accepter les Conditions d'Utilisation contraignantes qui définissent le cadre de votre expérience sur WOO. Ces règles s'appliquent à tous les utilisateurs, novicescomme vétérans, et sont conçues pour créer un environnement en ligne positif, sûr et respectueux.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Engagement et respect mutuel**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En utilisant WOO, vous acceptez de respecter les autres membres de la communauté Otaku. L'engagement envers le respect mutuel est la pierre angulaire de notre plateforme. Que vous partagiez vos créations, discutiez de vos passions ou interagissiez avec d'autres membres, la courtoisie et le respect sont essentiels.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Contribution à un environnement positif**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Les Conditions d'Utilisation de WOO exigent que chaque utilisateur contribue à créer un environnement positif. Cela signifie éviter le harcèlement, le discours de haine, la violence, et tout comportement inapproprié. Votre contribution est essentielle pour faire de WOO un lieu où chacun peut s'exprimer librement sans craindre de jugement ou de discrimination.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Respect de la propriété intellectuelle**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "La créativité et l'originalité sont célébrées sur WOO, mais cela va de pair avec le respect de la propriété intellectuelle. Les Conditions d'Utilisation exigent que vous respectiez les droits d'auteur et les droits de propriété intellectuelle. Partagez vos créations tout en honorant le travail des autres membres de la communauté.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Utilisation conforme aux lois et règlements**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En tant qu'utilisateur de WOO, vous vous engagez à utiliser la plateforme conformément aux lois et règlements en vigueur. Cela inclut le respect des droits légaux d'autrui, la conformité aux lois sur la vie privée et la modération de tout contenu illégal ou inapproprié.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Connaissance et acceptation des modifications**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Les Conditions d'Utilisation de WOO peuvent être mises à jour périodiquement pour refléter les évolutions de la plateforme. En acceptant ces conditions, vous vous engagez à être informé des modifications et à les accepter. Il est de votre responsabilité de consulter régulièrement les conditions d'utilisation pour rester informé des éventuelles mises à jour.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Conséquences en cas de non-respect**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Le non-respect des Conditions d'Utilisation peut entraîner des conséquences, y compris la résiliation de votre compte. Il est donc essentiel de les comprendre pleinement et de les respecter pour garantir une expérience positive et enrichissante sur WOO - World Of Otaku.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En acceptant ces conditions nécessaires, vous devenez un acteur clé de la préservation de l'intégrité et de la positivité de notre communauté Otaku. Bienvenue sur WOO, où votre engagement envers ces règles contribue à faire de notre plateforme un lieu dynamique où la passion otaku peut s'épanouir librement.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "3. Définition des termes clés",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Clarification des termes utilisés dans les Conditions d'Utilisation de WOO - World Of Otaku**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Lorsque vous parcourez les Conditions d'Utilisation de WOO - World Of Otaku, il est essentiel de comprendre pleinement les termes utilisés afin de naviguer sur la plateforme en toute confiance et en toute clarté. Cette section vise à clarifier certains des termes clés que vous rencontrerez dans nos conditions d'utilisation :",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "1. Utilisateur : Dans le contexte de WOO, un utilisateur fait référence à toute personne qui crée un compte sur la plateforme et accède à ses fonctionnalités.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "2. Contenu : Le contenu désigne tout matériel, information, données, texte, images, vidéos, ou autres éléments partagés, publiés ou affichés sur WOO par les utilisateurs.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "3. Propriété Intellectuelle : Ce terme englobe les droits d'auteur, les marques de commerce, les brevets, les droits de base de données, les droits moraux, et tout autre droit de propriété intellectuelle protégé par la loi",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "4. Modération : La modération se réfère au processus de surveillance et de gestion du contenu sur WOO afin de garantir qu'il respecte les règles de la plateforme en matière de comportement, de légalité et de respect des autres utilisateurs.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "5. Signalement : Les utilisateurs de WOO ont la possibilité de signaler tout contenu ou comportement qu'ils estiment être inapproprié, illégal ou contraire aux conditions d'utilisation de la plateforme.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "6. Résiliation de compte : La résiliation de compte fait référence à la cessation de l'accès d'un utilisateur à son compte sur WOO, soit à la demande de l'utilisateur luimême, soit en raison d'un non-respect des conditions d'utilisation.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "7. Confidentialité : La confidentialité concerne la protection des informations personnelles des utilisateurs sur WOO et les mesures prises pour garantir que ces informations ne sont pas divulguées ou utilisées de manière inappropriée.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "8. Conditions d'Utilisation : Les conditions d'utilisation sont les règles et les normes établies par WOO qui régissent l'utilisation de la plateforme par les utilisateurs. Elles définissent les droits, les responsabilités et les obligations des utilisateurs lorsqu'ils accèdent à WOO.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "3. Prévention des abus et des comportements inappropriés",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "9. Politique de Confidentialité : La politique de confidentialité de WOO explique comment les données personnelles des utilisateurs sont collectées, utilisées, stockées et partagées sur la plateforme, et quelles mesures sont prises pour garantir leur sécurité.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "10. Mise à Jour : Une mise à jour désigne toute modification, ajout ou suppression apportée aux conditions d'utilisation de WOO. Les utilisateurs sont tenus de prendre connaissance des mises à jour et de les accepter pour continuer à utiliser la plateforme.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En comprenant ces termes clés, vous serez mieux équipé pour naviguer sur WOO - World Of Otaku et pour tirer le meilleur parti de votre expérience sur notre plateforme dédiée à la passion Otaku.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "4. Utilisation du service",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "==============================================================⇒",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "*********************",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "<==============================================================",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Conditions d'Inscription et de Création de Compte**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Bienvenue sur notre réseau social dédié aux Otakus, où les passionnés de la culture japonaise peuvent se réunir, échanger et partager leur amour pour l'anime, le manga, les jeux vidéo et bien plus encore. Avant de plonger dans cette communauté dynamique, il est important de comprendre et d'accepter nos conditions d'inscription et de création de compte.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "1. Eligibilité : Pour créer un compte sur notre plateforme, vous devez être âgé d'au moins 13 ans.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "2. Informations d'inscription : Lors de votre inscription, vous devez fournir des informations précises et complètes, y compris un pseudonyme et toute autre information requise. Vous êtes responsable de maintenir l'exactitude de ces informations et de mettre à jour votre profil en cas de changement.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "3. Confidentialité du compte : Vous êtes entièrement responsable de la confidentialité de votre compte et de votre mot de passe. Vous ne devez pas partager votre mot de passe avec d'autres personnes ni autoriser quiconque à accéder à votre compte. Vous êtes également responsable de toutes les activités qui se déroulent sous votre compte.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "4. Utilisation multiple : Chaque utilisateur est autorisé à créer et à utiliser le nombre de compte qu'il souhaite dans les limites du plan d’abonnement choisi",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "5. Respect des droits de propriété intellectuelle : En créant un compte sur WOO, vous acceptez de respecter les droits de propriété intellectuelle des autres utilisateurs et de ne pas violer les droits d'auteur, les marques déposées ou tout autre droit de propriété intellectuelle.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "=============================================================⇒",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "*********************",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "<==============================================================",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Responsabilités des utilisateurs concernant la confidentialité de leur compte et de leurs informations personnelles**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "La confidentialité et la sécurité des informations personnelles des utilisateurs sont des priorités absolues sur notre réseau social. En tant qu'utilisateur de notre plateforme, il est crucial de comprendre vos responsabilités en matière de protection de votre compte et de vos données personnelles.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "1. Sécurité du compte : Vous êtes seul responsable de la sécurité de votre compte et des informations d'identification associées, telles que votre nom d'utilisateur et votre mot de passe. Assurez-vous de choisir un mot de passe fort et unique, et ne le partagez avec personne. Nous ne demanderons jamais vos informations de connexion par e-mail ou par tout autre moyen non sécurisé.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "2. Confidentialité des informations personnelles : En utilisant notre plateforme, vous consentez à fournir certaines informations personnelles, telles qu’un pseudonyme, et éventuellement d'autres détails facultatifs. Il est de votre responsabilité de contrôler quelles informations vous choisissez de partager publiquement et quelles informations vous préférez garder privées.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "3. Paramètres de confidentialité : Nous offrons à nos utilisateurs des outils et des paramètres de confidentialité robustes pour contrôler la visibilité de leurs informations personnelles et de leur activité sur notre plateforme. Prenez le temps de vérifier et de personnaliser ces paramètres en fonction de vos préférences de confidentialité.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "4. Sensibilisation aux menaces : Restez vigilant face aux tentatives de phishing, de hameçonnage ou d'autres formes d'attaques de sécurité en ligne. Ne cliquez jamais sur des liens suspects ou ne partagez jamais vos informations personnelles avec des sources non fiables.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "5. Signalement des activités suspectes : Si vous remarquez des activités suspectes ou non autorisées sur votre compte, signalez-les immédiatement à notre équipe de support. Nous prendrons des mesures pour protéger votre compte et enquêter sur toute activité potentiellement malveillante.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En suivant ces bonnes pratiques et en comprenant vos responsabilités en matière de confidentialité et de sécurité, vous contribuez à créer un environnement en ligne sûr et respectueux pour tous les membres de notre communauté. Nous nous engageons à protéger vos informations personnelles et à garantir votre sécurité sur notre plateforme.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "===================================================================⇒",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "*********************",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "<==============================================================",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "**Utilisation du service conformément aux lois et aux règlements en vigueur**",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En tant qu'utilisateur de WOO, il est impératif de respecter les lois et les règlements en vigueur lors de votre utilisation de la plateforme. Nous sommes déterminés à fournir un environnement en ligne sûr et légal pour tous nos membres, et nous vous demandons de coopérer en suivant ces directives essentielles :",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "1. Conformité juridique : Vous devez utiliser notre service en conformité avec toutes les lois, règlements et ordonnances applicables dans votre juridiction. Cela comprend, mais sans s'y limiter, les lois sur le droit d'auteur, la protection des données, la diffamation, la cybercriminalité et la protection des mineurs en ligne.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "2. Respect des droits des autres utilisateurs : Vous devez respecter les droits et la vie privée des autres utilisateurs de notre plateforme. Cela signifie ne pas harceler, diffamer, menacer, intimider ou violer les droits d'auteur ou la propriété intellectuelle d'autrui.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "3. Contenu légal et approprié : Vous êtes responsable du contenu que vous publiez, partagez ou distribuez sur la plateforme. Assurez-vous que votre contenu respecte les lois et ne contient pas de contenu illégal, diffamatoire, obscène, pornographique, frauduleux, menaçant, ou autrement répréhensible.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "4. Respect des politiques de la plateforme : Vous devez respecter les politiques et les directives établies par notre plateforme concernant l'utilisation acceptable et lesrègles de conduite. Ces politiques peuvent inclure des restrictions sur le spam, le trolling, le langage offensant, ou tout autre comportement inapproprié.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "5. Signalement des contenus illégaux ou inappropriés : Si vous rencontrez du contenu qui viole nos conditions d'utilisation ou les lois en vigueur, veuillez le signaler immédiatement à notre équipe de modération. Nous prendrons des mesures appropriées pour supprimer le contenu et prendre les mesures nécessaires contre les utilisateurs enfreignant nos règles.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En suivant ces directives et en utilisant notre service de manière responsable et légale, vous contribuez à maintenir un environnement en ligne sûr, respectueux et conforme à la loi pour tous les membres de la communauté WOO. Nous vous remercions de votre coopération et nous sommes disponibles pour répondre à toute question ou préoccupation que vous pourriez avoir concernant l'utilisation légale de notre plateforme.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "5- Condition Utilisateur",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Droit et responsabilité des utilisateurs concernant ce qu'ils publient",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Vous assumez la responsabilité du contenu que vous mettez à disposition sur WOO et vous devez détenir les droits nécessaires pour créer, publier ou partager ce contenu. Lorsque vous créez, publiez ou partagez du contenu via notre application, celui-ci peut être automatiquement diffusé et partagé sur la version Web de la plateforme. Par exemple, si vous téléversez une vidéo depuis l'application mobile, cette vidéo sera également diffusée et accessible sur la version Web.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Nous effectuons une vérification proactive du contenu grâce à des systèmes élaborés pour détecter le contenu illicite et préjudiciable, ainsi qu'une vérification réactive en réponse aux signalements des utilisateurs ou des autorités. À cette fin, nous combinons diverses technologies avec l'intervention de modérateurs humains.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Restrictions sur le contenu inapproprié, illégal ou offensant",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Nous avons le droit de supprimer ou de restreindre l'accès à tout contenu, y compris le vôtre, si nous estimons raisonnablement qu'il enfreint nos Conditions d'utilisation ou nos Règles communautaires, ou s'il cause préjudice à nous-mêmes, à nos sociétés affiliées, à nos utilisateurs ou à des tiers.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Si nous supprimons ou restreignons l'accès à votre contenu, nous vous informerons sans délai injustifié et vous expliquerons les raisons de notre décision, sauf si cela n'est pas approprié (par exemple, si nous y sommes légalement contraints).",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Si vous estimez que nous avons commis une erreur en supprimant ou en restreignant l'accès à votre contenu, vous pouvez faire appel via les fonctionnalités disponibles sur la Plateforme. Nous réexaminerons alors notre décision et prendrons les mesures appropriées.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Propriété intellectuelle et droits d'auteur liés au contenu utilisateur",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Nous respectons les droits d'auteur et autres droits de propriété intellectuelle.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Vous pouvez retirer votre contenu de la plateforme à tout moment. Lorsque vous supprimez du contenu de votre compte WOO, il est également retiré de la version Web. Par exemple, si vous effacez une publication que vous avez partagée sur l'application mobile Woo, elle est également effacée de la version Web.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Si d'autres utilisateurs de la plateforme ont utilisé votre contenu pour créer du nouveau contenu ou l'ont partagé sur des services tiers, ce nouveau contenu peut demeurer sur la plateforme ou ces services tiers même après la suppression de votre contenu ou de votre compte. Vous pouvez adresser une demande distincte à ces services tiers pour faire supprimer votre contenu.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Vous avez la possibilité de restreindre la manière dont les autres utilisateurs interagissent avec votre contenu et l'utilisent en ajustant les paramètres de confidentialité de votre compte. Nous vous encourageons à vous familiariser avec ces paramètres avant de publier du contenu sur la plateforme.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "À moins que vous n'utilisiez l'un des services publicitaires payants de WOO, chaque fois que vous publiez du contenu faisant la promotion d'une marque, d'un produit ou d'un service sur WOO, vous devez divulguer cette relation commerciale en utilisant les hashtags #PUB ou #ADS. Ces hashtags seront probablement remplacés par un bouton ou une fonctionnalité dans les futures versions de l'application. Nous vous informerons de ces changements par message après leur mise en place.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "6- Interactions entre utilisateurs",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Sous aucun prétexte, il ne vous est permis d'utiliser la plateforme pour :",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Engager des activités illégales, cela inclut la publication, la diffusion ou la distribution de tout contenu illégal ;",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Enfreindre les lois ou règlements relatifs au blanchiment d'argent, au financement du terrorisme, au contrôle des exportations et aux sanctions économiques ;",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Interagir de manière abusive ou inappropriée avec des mineurs ;",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Porter atteinte au bon fonctionnement ou à la sécurité de la plateforme ;",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Adopter des pratiques commerciales frauduleuses, telles que l'utilisation de comptes indésirables ou la falsification de comptes, comme décrit plus en détail dans nos Règles communautaires ;",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Soumettre des recours, signalements, avis ou réclamations manifestement infondés ;",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Extraire des données ou du contenu de Woo à l'aide de systèmes ou de logiciels automatisés, ou utiliser ou tenter d'utiliser le compte d'un autre utilisateur sans autorisation.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "De plus, vous ne devez pas publier ou distribuer sur la plateforme tout contenu qui :",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Enfreint les droits d'autrui, tels que les droits de propriété intellectuelle, de vie privée et/ou les droits moraux de personnes vivantes ou décédées ;",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Encourage ou donne des instructions pour commettre une infraction pénale ou des activités dangereuses susceptibles de causer des blessures graves, la mort ou l'automutilation ;",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Propage de fausses informations préjudiciables, telles que des informations haineuses ou des préjugés, ou qui trompent ou influencent indûment des élections ou d'autres processus civiques ;",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Contient des menaces ou des actes d'intimidation ou de harcèlement envers d'autres personnes, y compris la publication de contenu visant à ridiculiser, humilier, embarrasser, intimider ou nuire à une personne ;",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Est obscène, pornographique ou promeut des contenus sexuellement explicites ;",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Est haineux ou offensant ;",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Encourage ou promeut la violence ou la discrimination fondée sur la race, l'origine ethnique, la nationalité, la religion, la caste, l'orientation sexuelle, le sexe, l'identité de genre, la maladie grave, le handicap, le statut d'immigration ou l'âge ;",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Contient du contenu nuisible, causant un préjudice physique, mental ou moral aux mineurs.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Vous pouvez signaler tout contenu suspecté d'être illégal ou en violation de nos Conditions d'utilisation ou de nos Règles communautaires en utilisant les fonctionnalités de signalement disponibles sur la plateforme.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En résumé : Vous êtes invité à profiter de notre plateforme, mais dans l'intérêt de tous nos utilisateurs, il est impératif de respecter ces règles. Si vous repérez quelque chose qui ne devrait pas être sur notre Plateforme, veuillez-nous en informer.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "7- Sécurité et confidentialité des données",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Nous prenons des mesures pour garantir la sécurité de vos informations, mais il est important de noter que la transmission de données sur Internet n'est jamais entièrement sécurisée. Bien que nous mettions en place des mesures telles que le chiffrement pour protéger vos informations personnelles, nous ne pouvons pas garantir la sécurité de la transmission de ces informations via la Plateforme ; cela relève de votre propre responsabilité.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "De temps à autre, nous pouvons inclure des liens vers les sites Web de nos partenaires, annonceurs et sociétés affiliées. Veuillez noter que ces sites ont leurs propres politiques de confidentialité et que nous déclinons toute responsabilité quant à ces politiques. Nous vous encourageons à consulter ces politiques avant de soumettre des informations sur ces sites Web.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En ce qui concerne la conservation de vos informations, nous les conservons aussi longtemps que nécessaire pour maintenir la plateforme. De plus, nous les conservons lorsque cela est requis pour respecter nos obligations contractuelles et légales, ou lorsque nous avons un intérêt commercial légitime (tel que l'amélioration et le développement de la Plateforme, ainsi que la sécurité et la stabilité de celle-ci), ou encore pour exercer ou défendre des actions en justice.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Les périodes de conservation varient en fonction de différents critères, tels que le type d'informations et les objectifs pour lesquels nous les utilisons. Par exemple, si nous traitons des informations de profil pour vous fournir la plateforme, nous les conservons tant que vous avez un compte actif. Si vous enfreignez nos Conditions d'utilisation, nos directives communautaires ou d'autres conditions ou politiques, nous pouvons supprimer immédiatement votre profil et votre contenu d'utilisateur de l'affichage public, mais nous pouvons conserver d'autres informations vous concernant pour traiter cette violation.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "8- Responsabilités et limitations",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Nous nous engageons à fournir la plateforme , et à agir avec professionnalisme pour garantir un environnement sûr et sécurisé pour nos utilisateurs. Cependant, nous ne pouvons garantir la disponibilité éternelle de la plateforme ni son maintien dans sa forme actuelle pour une durée indéfinie.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "La majeure partie du contenu présent sur la WOO est fournie par les utilisateurs et les entreprises qui l'utilisent. Par conséquent, à moins que cela ne soit requis par la loi, nous ne pouvons garantir que tout le contenu généré par les utilisateurs sur la plateforme soit exact, complet, à jour, légal ou qu'il ne porte pas atteinte aux droits de tiers, ou qu'il ne vous offensera pas. Vous comprenez et acceptez que le contenu présent sur la plateforme ne reflète pas nécessairement nos points de vue ou nos valeurs, et qu'il peut ne pas répondre à vos besoins.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "La plateforme peut contenir des liens vers des sites Web, des publicités, des services ou d'autres événements tiers qui ne sont pas fournis, détenus ou contrôlés par WOO. Nous n'approuvons pas ces tiers et vous les utilisez à vos propres risques.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Dans la mesure où nous agissons avec professionnalisme, nous ne pouvons être tenus responsables des pertes ou dommages que nous causons, sauf en cas de manquement à ces Conditions ou si les pertes étaient raisonnablement prévisibles au moment de la conclusion de ces Conditions.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Nous déclinons toute responsabilité en cas de perte ou de dommage causé(e) par des événements échappant à notre contrôle raisonnable. Cependant, cela n'affecte pas vos droits en tant que consommateur, et nous ne limitons pas notre responsabilité de manière illégale.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Si vous résidez dans l’EEE, vous bénéficiez de garanties légales relatives à l'utilisation de la plateforme, et vous pouvez faire valoir ces droits en nous contactant.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En résumé, nous nous efforçons de fournir une expérience utilisateur exceptionnelle et sûre, mais vous utilisez la Plateforme à vos propres risques et comprenez que nous ne contrôlons pas tout le contenu présent sur celle-ci.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Droit de modifier les conditions d'utilisation avec ou sans préavis",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Dans le cadre de notre engagement envers nos utilisateurs, nous nous réservons le droit de modifier les présentes conditions d'utilisation à tout moment, avec ou sans préavis préalable. Cette faculté de modification s'inscrit dans notre volonté constante de maintenir la qualité, la sécurité et la pertinence de nos services. Les modifications pourraient être motivées par diverses raisons, telles que l'évolution dela législation, l'amélioration de nos fonctionnalités, la mise à jour de nos politiques de confidentialité, ou encore la correction d'erreurs éventuelles. En acceptant ces conditions d'utilisation, les utilisateurs reconnaissent la possibilité de changements et consentent à se conformer aux nouvelles conditions qui peuvent entrer en vigueur. Il est donc vivement recommandé aux utilisateurs de consulter régulièrement cette page pour rester informés des éventuelles modifications et de leurs répercussions sur leur utilisation de notre plateforme.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Notification des utilisateurs des modifications apportées et de leur entrée en vigueur",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Dans le souci de garantir une transparence totale et de maintenir une relation de confiance avec nos utilisateurs, nous nous engageons à notifier de manière claire et explicite toute modification apportée aux conditions d'utilisation de notre plateforme. Cette notification sera communiquée par le biais de divers canaux, tels que des annonces sur notre site web, des publications sur nos réseaux sociaux, ou toute autre méthode de communication jugée appropriée. De plus, nous préciserons la date d'entrée en vigueur des nouvelles conditions afin que nos utilisateurs puissent pleinement comprendre les changements et prendre les mesures nécessaires en conséquence. Cette démarche vise à garantir une transition en douceur et à permettre à nos utilisateurs de continuer à profiter de nos services de manière informée et éclairée.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "10. Résiliation du compte",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Procédures de résiliation de compte pour les utilisateurs",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Nous facilitons le processus de résiliation de compte pour nos utilisateurs afin de leur offrir un contrôle total sur leur expérience sur notre plateforme. Pour résilier un compte, les utilisateurs peuvent accéder aux paramètres de leur compte où ils trouveront une option dédiée à la résiliation. En cliquant sur cette option, ils seront guidés à travers les étapes nécessaires pour finaliser la résiliation de manière simple et efficace. De plus, notre équipe de support est toujours disponible pour fournir une assistance supplémentaire et répondre à toute question concernant la procédure de résiliation. Nous nous engageons à traiter toutes les demandes de résiliation de compte avec diligence et à assurer la confidentialité des informations des utilisateurs tout au long du processus.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Conséquences de la résiliation, y compris la suppression de contenu et de données associées",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Lorsqu'un utilisateur décide de résilier son compte, il est important de comprendre les implications de cette action. La résiliation du compte entraînera la suppression de toutes les données et le contenu associés à ce compte. Cela inclut, mais n'est pas limité à, les publications, les messages, les fichiers téléchargés, et toute autre information liée au compte. Il est donc recommandé aux utilisateurs de sauvegarder toutes les données importantes avant de procéder à la résiliation de leur compte. Après la résiliation, il ne sera pas possible de récupérer ces données, et toute information associée au compte sera définitivement supprimée de notre système. Nous tenons à souligner cette conséquence afin que nos utilisateurs puissent prendre une décision éclairée et comprendre pleinement les répercussions de la résiliation de leur compte.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "11. Dispositions générales",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Loi applicable et juridiction compétente en cas de litige",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En cas de litige découlant des présentes conditions d'utilisation, la loi applicable sera celle en vigueur dans la région géographique où notre entreprise est établie. Tout litige sera soumis à la compétence exclusive des tribunaux compétents de cette juridiction. Nous nous engageons à respecter les lois et règlements en vigueur dans notre région et à coopérer pleinement avec les autorités judiciaires pour résoudre tout différend de manière équitable et conforme à la loi. En acceptant nos conditions d'utilisation, les utilisateurs reconnaissent et acceptent cette clause de loi applicable et de juridiction compétente en cas de litige.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Clauses de non-renonciation et d'indépendance des dispositions des conditions d'utilisation",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Les clauses de non-renonciation et d'indépendance des dispositions des présentes conditions d'utilisation sont essentielles pour garantir la validité et l'applicabilité de chaque clause de nos conditions. Ainsi, le fait de ne pas exercer un droit ou une disposition spécifique des conditions d'utilisation ne constitue pas une renonciation à ce droit ou à cette disposition. De même, chaque disposition des conditions d'utilisation est considérée comme indépendante et distincte des autres dispositions. Si une disposition est jugée invalide, illégale ou inapplicable, cela n'affectera pas la validité, la légalité ou l'applicabilité des autres dispositions des conditions d'utilisation. Ces clauses visent à assurer la cohérence et l'intégrité de nos conditions d'utilisation, tout en préservant les droits et les obligations de toutes les parties concernées.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Contact pour toute question ou préoccupation concernant les conditions d'utilisation",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Nous accordons une grande importance à la transparence et à la communication ouverte avec nos utilisateurs. Si vous avez des questions, des préoccupations ou besoin de clarifications concernant nos conditions d'utilisation, notre équipe de support est à votre disposition pour vous aider. Vous pouvez nous contacter à tout moment en utilisant les coordonnées fournies sur notre site web, notamment par email, téléphone ou formulaire de contact en ligne. Nous nous engageons à répondre à toutes les questions de manière professionnelle et diligente, et à fournir les informations nécessaires pour vous aider à comprendre nos Conditions d'Utilisation et à utiliser notre plateforme en toute confiance. N'hésitez pas à nous contacter si vous avez besoin d'assistance ou si vous souhaitez obtenir des éclaircissements sur un sujet spécifique. Votre satisfaction et votre compréhension sont nos priorités absolues.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "Conclusion",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "- Résumé des principales clauses et rappel de l'importance de respecter les conditions d'utilisation",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points

                          Text(
                            "En résumé, nos conditions d'utilisation définissent les règles et les obligations pour l'utilisation de notre plateforme. Il est important de les respecter pour maintenir un environnement sûr, équitable et respectueux pour tous les utilisateurs. Nous rappelons que nous nous réservons le droit de modifier les conditions d'utilisation, que la résiliation du compte entraîne la suppression de contenu associé, que la loi applicable et la juridiction compétente en cas de litige sont déterminées, et que les clauses de non-renonciation et d'indépendance des dispositions sont en place. Pour toute question ou préoccupation concernant les conditions d'utilisation, notre équipe de support est disponible pour fournir une assistance personnalisée. Nous vous encourageons à lire attentivement nos conditions d'utilisation et à les respecter en tout temps pour garantir une expérience positive pour l'ensemble de notre communauté. Merci de votre collaboration et de votre compréhension.",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Espacement entre le titre et les points
                        ],
                      ),
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).viewInsets.bottom,
              child: Container(
                height: 90,
                child: // Boutons
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Bouton "Retour"
                    Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1.0,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Retour',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Bouton "J'accepte"
                    Button(
                      name: 'J\'accepte',
                      buttonColor: AppColors.primary,
                      buttonTextColor: colorScheme.surface,
                      buttonFonSize: 20,
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 170.0),
        child: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          },
          backgroundColor: AppColors.primary,
          child: Icon(Icons.arrow_downward, color: colorScheme.surface),
        ),
      ),
    );
  }
}
