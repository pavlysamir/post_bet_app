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
  final List<Term> _terms = [
    Term(
      title: 'Term 1',
      description:
          'This is the description of term 1. It contains important information about term 1.',
    ),
    Term(
      title: 'Term 2',
      description:
          'This is the description of term 2. It contains important information about term 2.',
    ),
    Term(
      title: 'Term 2',
      description:
          'This is the description of term 2. It contains important information about term 2.',
    ),
    // Add more terms as needed
  ];

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
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _terms[index].isExpanded = !_terms[index].isExpanded;
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
