import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AboutMedicine extends StatefulWidget {
  const AboutMedicine({Key? key}) : super(key: key);

  @override
  State<AboutMedicine> createState() => _AboutMedicineState();
}

class _AboutMedicineState extends State<AboutMedicine> {
  int selectedOption = 1; // Initialize the selected option

  // Expansion state variables for Details Section
  bool indicationExpanded = false;
  bool usesExpanded = false;
  bool sideEffectsExpanded = false;
  bool dosageExpanded = false;
  bool precautionsExpanded = false;
  bool interactionsExpanded = false;
  bool storageExpanded = false;

  // Expansion state variables for Reviews Section
  bool effectivenessExpanded = false;
  bool sideEffectsReviewExpanded = false; // New option

  // Expansion state variables for Substitutes Section
  bool genericAlternativesExpanded = false;
  bool brandSubstitutesExpanded = false; // New option

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          color: Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // Update the selected option
                      selectedOption = 1;
                      // Close other options
                      indicationExpanded = false;
                      usesExpanded = false;
                      sideEffectsExpanded = false;
                      dosageExpanded = false;
                      precautionsExpanded = false;
                      interactionsExpanded = false;
                      storageExpanded = false;
                      // For Reviews Section
                      effectivenessExpanded = false;
                      sideEffectsReviewExpanded = false; // Reset
                      // For Substitutes Section
                      genericAlternativesExpanded = false;
                      brandSubstitutesExpanded = false; // Reset
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: selectedOption == 1 ? 3.0 : 0.0,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    child: Text(
                      'Details',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: selectedOption == 1
                            ? Colors.black
                            : Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // Update the selected option
                      selectedOption = 2;
                      // Close other options
                      indicationExpanded = false;
                      usesExpanded = false;
                      sideEffectsExpanded = false;
                      dosageExpanded = false;
                      precautionsExpanded = false;
                      interactionsExpanded = false;
                      storageExpanded = false;
                      // For Details Section
                      effectivenessExpanded = false;
                      // For Substitutes Section
                      genericAlternativesExpanded = false;
                      brandSubstitutesExpanded = false; // Reset
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: selectedOption == 2 ? 3.0 : 0.0,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    child: Text(
                      'Reviews',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: selectedOption == 2
                            ? Colors.black
                            : Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // Update the selected option
                      selectedOption = 3;
                      // Close other options
                      indicationExpanded = false;
                      usesExpanded = false;
                      sideEffectsExpanded = false;
                      dosageExpanded = false;
                      precautionsExpanded = false;
                      interactionsExpanded = false;
                      storageExpanded = false;
                      // For Details Section
                      genericAlternativesExpanded = false;
                      // For Reviews Section
                      effectivenessExpanded = false;
                      sideEffectsReviewExpanded = false; // Reset
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: selectedOption == 3 ? 3.0 : 0.0,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    child: Text(
                      'Substitutes',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: selectedOption == 3
                            ? Colors.black
                            : Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),

        // Details Section
        if (selectedOption == 1)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _detailsOption(
                'Indication',
                indicationExpanded,
                    () {
                  setState(() {
                    indicationExpanded = !indicationExpanded;
                    // Close other options
                    usesExpanded = false;
                    sideEffectsExpanded = false;
                    dosageExpanded = false;
                    precautionsExpanded = false;
                    interactionsExpanded = false;
                    storageExpanded = false;
                  });
                },
                'This medicine is used to relieve pain and reduce fever. It is typically used for mild to moderate pain relief.',
              ),
              _detailsOption(
                'Uses',
                usesExpanded,
                    () {
                  setState(() {
                    usesExpanded = !usesExpanded;
                    // Close other options
                    indicationExpanded = false;
                    sideEffectsExpanded = false;
                    dosageExpanded = false;
                    precautionsExpanded = false;
                    interactionsExpanded = false;
                    storageExpanded = false;
                  });
                },
                'This medication is used to treat a variety of conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',
              ),
              // Add more details options similarly
            ],
          ),

        // Reviews Section
        if (selectedOption == 2)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _detailsOption(
                'Effectiveness',
                effectivenessExpanded,
                    () {
                  setState(() {
                    effectivenessExpanded = !effectivenessExpanded;
                    // Close other options
                    sideEffectsReviewExpanded = false; // Reset
                  });
                },
                'This medicine is highly effective in providing relief from pain and reducing fever.',
              ),
              _detailsOption(
                'Side Effects Review',
                sideEffectsReviewExpanded,
                    () {
                  setState(() {
                    sideEffectsReviewExpanded = !sideEffectsReviewExpanded;
                    // Close other options
                    effectivenessExpanded = false; // Reset
                  });
                },
                'Some users reported experiencing mild side effects such as nausea and drowsiness.',
              ),
              // Add more review options similarly
            ],
          ),

        // Substitutes Section
        if (selectedOption == 3)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _detailsOption(
                'Generic Alternatives',
                genericAlternativesExpanded,
                    () {
                  setState(() {
                    genericAlternativesExpanded = !genericAlternativesExpanded;
                    // Close other options
                    brandSubstitutesExpanded = false; // Reset
                  });
                },
                'There are generic alternatives available for this medication, which may offer cost savings.',
              ),
              _detailsOption(
                'Brand Substitutes',
                brandSubstitutesExpanded,
                    () {
                  setState(() {
                    brandSubstitutesExpanded = !brandSubstitutesExpanded;
                    // Close other options
                    genericAlternativesExpanded = false; // Reset
                  });
                },
                'Some users prefer brand substitutes due to their perceived higher quality.',
              ),
              // Add more substitute options similarly
            ],
          ),
        SizedBox(height: 150),
      ],
    );
  }

  Widget _detailsOption(
      String title, bool expanded, VoidCallback onTap, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(expanded ? Icons.expand_less : Icons.expand_more),
          onTap: onTap,
        ),
        if (expanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(description),
          ),
        Divider(),
      ],
    );
  }
}
