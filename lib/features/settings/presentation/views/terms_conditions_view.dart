import 'package:flutter/material.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/generated/l10n.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  @override
  _TermsAndConditionsScreenState createState() =>
      _TermsAndConditionsScreenState();

  final List<Term> _terms = [
    Term(
      title:
          '1. **الموافقة على الشروط:**', // Replace with your method for localized strings
      description:
          '- باستخدام التطبيق، فإنك توافق على الامتثال لجميع الشروط والأحكام المنصوص عليها في هذا الاتفاق.', // Replace with your method for localized strings
    ),
    // Term 2: Eligibility
    Term(
      title: '2. **الأهلية:**',
      description:
          '   - يجب أن تكون قادرًا على القيام بتعهد ملزم وتمتلك القدرة القانونية للقيام بذلك وفقًا للقوانين المحلية.',
    ),
    // Term 3: Intellectual Property Rights
    Term(
      title: '3. **حقوق الملكية الفكرية:**',
      description:
          '   - يجب أن تكون قادرًا على القيام بتعهد ملزم وتمتلك القدرة القانونية للقيام بذلك وفقًا للقوانين المحلية.',
    ),
    // Term 4: Responsibility
    Term(
      title: '4. **المسؤولية:**',
      description:
          '  - نحن غير مسؤولين عن أي خسارة أو ضرر ينجم عن استخدامك للتطبيق أو الاعتماد على المحتوى المتاح عبره.',
    ),
    // Term 5: Cancellation and Suspension
    Term(
      title: '5. **الغاء والتعليق:**',
      description:
          '   - نحتفظ بالحق في إلغاء أو تعليق الخدمة في أي وقت ودون إشعار مسبق إذا انتهكت أي من هذه الشروط والأحكام.',
    ),
    // Term 6: Terms Updates
    Term(
      title: '6. **تحديث الشروط:**',
      description:
          '   - قد يتم تحديث هذه الشروط والأحكام بين الحين والآخر، ويجب عليك مراجعتها بانتظام للبقاء على علم بأي تغييرات.',
    ),
    // Term 7: Legal Settlement
    Term(
      title: '7. **التسوية القانونية:**',
      description:
          '   - في حالة وجود نزاع ينشأ عن هذا الاتفاق، يجب تسويته بالتحكيم وفقًا لقوانين الدولة التي يقع مقر شركة التطبيق فيها.',
    ),
    // Term 8: Compliance with Laws
    Term(
      title: '8. **الامتثال للقوانين:**',
      description:
          '   - يجب عليك الامتثال لجميع القوانين واللوائح المحلية والدولية المعمول بها في استخدامك للتطبيق.',
    ),
    // Term 9: Compensation
    Term(
      title: '9. **التعويض:**',
      description:
          '   - أنت توافق على تعويض وحماية الشركة وشركائها من أي مطالبات أو خسائر ناتجة عن استخدامك للتطبيق.',
    ),
    // Term 10: Personal Use
    Term(
      title: '10. **الاستخدام الشخصي:**',
      description:
          '   - يجب عدم استخدام التطبيق لأي غرض غير شخصي أو غير مصرح به، بما في ذلك التسويق أو الاستغلال التجاري.',
    ),
    // Term 11: Modification and Termination Rights
    Term(
      title: '11. **حقوق التعديل والإلغاء:**',
      description:
          '   - نحتفظ بالحق في تعديل أو إلغاء أي جزء من التطبيق أو الخدمات المقدمة في أي وقت ودون إشعار مسبق.',
    ),
    // Term 12: Compensations and Warranties
    Term(
      title: '12. **التعويضات والضمانات:**',
      description:
          '   - يتم تقديم التطبيق "كما هو" دون أي ضمانات صريحة أو ضمنية، ولا نتحمل أي مسؤولية تجاه تأخيرات أو عدم توفر الخدمة.',
    ),
    // Term 13: Arbitration for Individuals
    Term(
      title: '13. **التحكيم الفردي:**',
      description:
          '   - يتم التوصل إلى تسوية النزاعات بوساطة تحكيم فردي، ولا يجوز للمستخدمين المشاركة في أي دعوى جماعية أو مجمعة ضد التطبيق.',
    ),
    // Term 14: Use License
    Term(
      title: '. **سلطة القرار النهائي:**',
      description:
          '   - قرار التحكيم يكون نهائيًا وملزمًا ولا يمكن الطعن فيه، ويتم تنفيذ أي حكم صادر عنه في أي منتزع قانوني مختص.',
    ),
    // Term 15: Fair Use
    Term(
      title: '15. **ترخيص الاستخدام:**',
      description:
          '   - يتم منحك ترخيصًا محدودًا غير قابل للنقل لاستخدام التطبيق وفقًا لهذه الشروط والأحكام فقط.',
    ),
  ];
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
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
              widget._terms[index].isExpanded =
                  !widget._terms[index].isExpanded;
              // !_terms[index].isExpanded
            });
          },
          expandedHeaderPadding: EdgeInsets.zero,
          elevation: 1,
          dividerColor: Colors.grey,
          animationDuration: const Duration(milliseconds: 500),
          children: widget._terms.map<ExpansionPanel>((Term term) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(term.title),
                  onTap: () {
                    setState(() {
                      term.isExpanded = !term.isExpanded;
                      //!term.isExpanded
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
