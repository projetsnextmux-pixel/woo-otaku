import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart'; // Importez le package
import 'package:woo/core/widgets/color.dart';

class WoomingCreat extends StatefulWidget {
  const WoomingCreat({super.key});

  @override
  State<WoomingCreat> createState() => _WoomingCreatState();
}

class _WoomingCreatState extends State<WoomingCreat> {
  final TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _selectedAudience = 'Public';

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // Pour un fond transparent et pour laisser le Container gérer l'apparence
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          elevation: 0,
          content: Container(
            // Décoration du conteneur pour simuler l'apparence du calendrier
            decoration: BoxDecoration(
              color: const Color.fromARGB(225, 255, 255, 255), // Fond blanc
              borderRadius: BorderRadius.circular(20), // Bords arrondis
              border: Border.all(color: AppColors.primary, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 380, // Ajustez la hauteur si nécessaire
            padding: const EdgeInsets.all(10), // Espacement interne
            child: Column(
              // Utilisez une colonne pour le titre et le calendrier
              mainAxisSize: MainAxisSize.min,
              children: [
                // Titre "Select date" et icône de crayon
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                ),

                // Affichage du jour sélectionné (ex: Wed, Jul 9)
                const SizedBox(
                  height: 10,
                ), // Espace entre le jour et le calendrier
                Expanded(
                  // Le calendrier prendra l'espace restant
                  child: SfDateRangePicker(
                    onSelectionChanged: (args) {
                      if (args.value is DateTime) {
                        setState(() {
                          _selectedDate = args.value;
                        });
                        // Ne pas fermer le dialogue immédiatement, laissons l'utilisateur cliquer sur OK
                      }
                    },
                    selectionMode: DateRangePickerSelectionMode.single,
                    initialSelectedDate:
                        _selectedDate ?? DateTime.now(), // Date initiale
                    minDate: DateTime(2000),
                    maxDate: DateTime(2101),
                    backgroundColor: Colors.transparent, // Fond du calendrier
                    headerStyle: DateRangePickerHeaderStyle(
                      backgroundColor: Colors.transparent,
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(
                        color:
                            Colors
                                .black, // Couleur du texte de l'en-tête (ex: July 2025)
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    viewSpacing: 0,
                    todayHighlightColor:
                        AppColors.primary, // Couleur pour le jour d'aujourd'hui
                    selectionColor:
                        AppColors
                            .primary, // Couleur de sélection pour le jour (le cercle bleu)
                    selectionTextStyle: const TextStyle(
                      color: Colors.white,
                    ), // Couleur du texte du jour sélectionné
                    monthViewSettings: const DateRangePickerMonthViewSettings(
                      viewHeaderStyle: DateRangePickerViewHeaderStyle(
                        textStyle: TextStyle(
                          color:
                              Colors
                                  .black, // Couleur des en-têtes des jours de la semaine (S, M, T, W, T, F, S)
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    monthCellStyle: DateRangePickerMonthCellStyle(
                      textStyle: const TextStyle(
                        color: Colors.black,
                      ), // Couleur du texte des jours du mois
                      todayTextStyle: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ),

                // Boutons "Cancel" et "OK"
              ],
            ),
          ),
        );
      },
    );
  }



  Future<void> _selectTime(BuildContext context) async {
    int hour = _selectedTime?.hourOfPeriod ?? TimeOfDay.now().hourOfPeriod;
    int minute = _selectedTime?.minute ?? TimeOfDay.now().minute;
    bool isAm = (_selectedTime?.period == DayPeriod.am);
    

    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          elevation: 0,
          content: StatefulBuilder(
            builder: (context, setState) {
              // setState ici gère uniquement l'état du dialogue
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(225, 255, 255, 255),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // La grille HH | MM | AM/PM
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _timePicker(
                          label: () => hour.toString().padLeft(2, '0'),
                          onUp:
                              () => setState(() {
                                hour = (hour % 12) + 1;
                                if (hour == 13) hour = 1;
                              }),
                          onDown:
                              () => setState(() {
                                hour = (hour - 1).clamp(1, 12);
                              }),
                        ),
                        _timePicker(
                          label: () => minute.toString().padLeft(2, '0'),
                          onUp:
                              () => setState(() {
                                minute = (minute + 1) % 60;
                              }),
                          onDown:
                              () => setState(() {
                                minute = (minute - 1) < 0 ? 59 : minute - 1;
                              }),
                        ),
                        _timePicker(
                          label: () => isAm ? 'AM' : 'PM',
                          onUp:
                              () => setState(() {
                                isAm = !isAm;
                              }),
                          onDown:
                              () => setState(() {
                                isAm = !isAm;
                              }),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    // Boutons Annuler / OK
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            // Appliquer la sélection au parent
                            final selectedHour =
                                isAm ? hour % 12 : (hour % 12) + 12;
                            setState(() {}); // <-- inutile ici
                            _selectedTime = TimeOfDay(
                              hour: selectedHour,
                              minute: minute,
                            );
                            Navigator.of(ctx).pop();
                            setState(
                              () {},
                            ); // pour rebuild parent avec la nouvelle heure
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }


    Widget _timePicker({
    required String Function() label,
    required VoidCallback onUp,
    required VoidCallback onDown,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: const Icon(Icons.keyboard_arrow_up), onPressed: onUp),
        Text(
          label(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: onDown,
        ),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
        final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text(
          'Programmer un wooming',
          style: TextStyle(color: colorScheme.onSurface, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey.shade200, height: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nom du wooming
            const Text(
              'Nom du wooming',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            TextField(
              controller: _nameController,
              maxLength: 100,
              decoration: InputDecoration(
                counterText: '${_nameController.text.length.toString()}/100',
                counterStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 24),

            // Choisir le jour
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choisir le jour',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 8),

                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primary,
                    side: BorderSide(color: AppColors.primary, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: const Size(double.infinity, 0),
                  ),

                  child: Text(
                    _selectedDate == null
                        ? 'JJ/MM/AAAA'
                        : DateFormat('dd/MM/yyyy').format(_selectedDate!),
                        style: TextStyle(
                          fontSize: 16,
                          color:  Colors.black,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Définir l'heure
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Définir l\'heure',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 8),

                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: const Size(double.infinity, 0),
                  ),
                  child: Text(
                    _selectedTime == null
                        ? 'HH : MM'
                        : _selectedTime!.format(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Audience
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Audience',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedAudience,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedAudience = newValue!;
                      });
                    },
                    items:
                        <String>[
                          'Public',
                          'Privé',
                          'Amis seulement',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
            const Spacer(),

            // Bouton Terminer
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Vos actions
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child:  Text(
                  'Terminer',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
