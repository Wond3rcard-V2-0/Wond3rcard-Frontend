import 'package:flutter/material.dart';

class FAQ {
  final String question;
  final String answer;

  FAQ({
    required this.question,
    required this.answer,
  });
}

class FAQSection extends StatefulWidget {
  const FAQSection({super.key});

  @override
  State<FAQSection> createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  String searchQuery = '';
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final filteredFaqs = faqList.where((faq) {
      return faq.question.toLowerCase().contains(searchQuery.toLowerCase()) ||
          faq.answer.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Container(
      decoration: BoxDecoration(
          color: isDark ? Colors.black : Colors.purple[50],
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search FAQs...',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.purple),
              filled: true,
              fillColor:
                  isDark ? Colors.white10 : Colors.purple.withOpacity(0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.purple, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          if (filteredFaqs.isEmpty)
            Center(
              child: Text(
                'No results found.',
                style: TextStyle(color: Colors.purple, fontSize: 18),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredFaqs.length,
              itemBuilder: (context, index) {
                final faq = filteredFaqs[index];
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.white10
                        : Colors.purple.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.purple),
                  ),
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      key: Key(index.toString()),
                      initiallyExpanded: expandedIndex == index,
                      collapsedIconColor: Colors.purple,
                      iconColor: Colors.purple,
                      onExpansionChanged: (expanded) {
                        setState(() {
                          expandedIndex = expanded ? index : null;
                        });
                      },
                      title: Text(
                        faq.question,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.purple,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: Text(
                            faq.answer,
                            style: TextStyle(
                              fontSize: 16,
                              color: isDark ? Colors.white70 : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

final List<FAQ> faqList = [
  FAQ(
    question: 'What services do you offer?',
    answer:
        'We provide web design, development, branding, and digital marketing solutions tailored to your needs.',
  ),
  FAQ(
    question: 'How can I get a quote?',
    answer:
        'Simply contact us through our form or call us. We\'ll get back with a personalized quote within 24 hours.',
  ),
  FAQ(
    question: 'Do you offer support after project completion?',
    answer:
        'Absolutely! We offer 6 months of free support after project delivery, and ongoing maintenance packages too.',
  ),
  FAQ(
    question: 'How long does a project take?',
    answer:
        'It depends on the scope. A typical website project takes 4-6 weeks from start to launch.',
  ),
  FAQ(
    question: 'Can I request changes after the project is completed?',
    answer:
        'Yes, we offer post-launch revisions based on our maintenance packages or hourly rates.',
  ),
];
