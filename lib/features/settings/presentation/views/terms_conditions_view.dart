import 'package:flutter/material.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/generated/l10n.dart';

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
        title: S.of(context).title1,
        description: S.of(context).description1,
      ),
      Term(
        title: S.of(context).title2,
        description: S.of(context).description2,
      ),
      Term(
        title: S.of(context).title3,
        description: S.of(context).description3,
      ),
      Term(
        title: S.of(context).title4,
        description: S.of(context).description4,
      ),
      Term(
        title: S.of(context).title5,
        description: S.of(context).description5,
      ),
      Term(
        title: S.of(context).title6,
        description: S.of(context).description6,
      ),
      Term(
        title: S.of(context).title7,
        description: S.of(context).description7,
      ),
      Term(
        title: S.of(context).title8,
        description: S.of(context).description8,
      ),
      Term(
        title: S.of(context).title9,
        description: S.of(context).description9,
      ),
      Term(
        title: S.of(context).title10,
        description: S.of(context).description10,
      ),
      Term(
        title: S.of(context).title11,
        description: S.of(context).description11,
      ),
      Term(
        title: S.of(context).title12,
        description: S.of(context).description12,
      ),
      Term(
        title: S.of(context).title13,
        description: S.of(context).description13,
      ),
      Term(
        title: S.of(context).title14,
        description: S.of(context).description14,
      ),
      Term(
        title: S.of(context).title15,
        description: S.of(context).description15,
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
          text: S.of(context).termsAndConditions,
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
