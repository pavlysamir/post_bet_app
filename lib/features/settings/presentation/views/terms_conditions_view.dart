import 'package:flutter/material.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  @override
  _TermsAndConditionsScreenState createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  late Future<void> _initializeFuture;
  List<Term> _terms = [];

  @override
  void initState() {
    super.initState();
    _initializeFuture = _initializeTerms();
  }

  Future<void> _initializeTerms() async {
    await Future.delayed(Duration.zero); // Ensure the context is available
    _terms = [
      Term(
        title: AppLocalizations.of(context)!.title1,
        description: AppLocalizations.of(context)!.description1,
      ),
      Term(
        title: AppLocalizations.of(context)!.title2,
        description: AppLocalizations.of(context)!.description2,
      ),
      Term(
        title: AppLocalizations.of(context)!.title3,
        description: AppLocalizations.of(context)!.description3,
      ),
      Term(
        title: AppLocalizations.of(context)!.title4,
        description: AppLocalizations.of(context)!.description4,
      ),
      Term(
        title: AppLocalizations.of(context)!.title5,
        description: AppLocalizations.of(context)!.description5,
      ),
      Term(
        title: AppLocalizations.of(context)!.title6,
        description: AppLocalizations.of(context)!.description6,
      ),
      Term(
        title: AppLocalizations.of(context)!.title7,
        description: AppLocalizations.of(context)!.description7,
      ),
      Term(
        title: AppLocalizations.of(context)!.title8,
        description: AppLocalizations.of(context)!.description8,
      ),
      Term(
        title: AppLocalizations.of(context)!.title9,
        description: AppLocalizations.of(context)!.description9,
      ),
      Term(
        title: AppLocalizations.of(context)!.title10,
        description: AppLocalizations.of(context)!.description10,
      ),
      Term(
        title: AppLocalizations.of(context)!.title11,
        description: AppLocalizations.of(context)!.description11,
      ),
      Term(
        title: AppLocalizations.of(context)!.title12,
        description: AppLocalizations.of(context)!.description12,
      ),
      Term(
        title: AppLocalizations.of(context)!.title13,
        description: AppLocalizations.of(context)!.description13,
      ),
      Term(
        title: AppLocalizations.of(context)!.title14,
        description: AppLocalizations.of(context)!.description14,
      ),
      Term(
        title: AppLocalizations.of(context)!.title15,
        description: AppLocalizations.of(context)!.description15,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: kPrimaryKey),
        ),
        title: CustomTitleText(
          text: AppLocalizations.of(context)!.termsAndConditions,
        ),
      ),
      body: FutureBuilder<void>(
        future: _initializeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return SingleChildScrollView(
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _terms[index].isExpanded = !isExpanded;
                  });
                },
                expandedHeaderPadding: EdgeInsets.zero,
                elevation: 1,
                dividerColor: Colors.grey,
                animationDuration: const Duration(milliseconds: 500),
                children: _terms.map<ExpansionPanel>((Term term) {
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(term.title),
                        onTap: () {
                          setState(() {
                            term.isExpanded = !term.isExpanded;
                          });
                        },
                      );
                    },
                    body: ListTile(
                      title: Text(term.description),
                    ),
                    isExpanded: term.isExpanded,
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}

class Term {
  final String title;
  final String description;
  bool isExpanded;

  Term({
    required this.title,
    required this.description,
    this.isExpanded = false,
  });
}
