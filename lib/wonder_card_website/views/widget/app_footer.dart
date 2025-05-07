import 'package:flutter/material.dart';

class AppFooter extends StatefulWidget {
  const AppFooter({super.key});

  @override
  State<AppFooter> createState() => _AppFooterState();
}

class _AppFooterState extends State<AppFooter> {
  @override
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.deepPurple;

    return Container(
      color: isDark ? Colors.black : Colors.deepPurple[50],
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            spacing: 50,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/blue-logo.png',
                    width: 200,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 300,
                    child: Text(
                      softWrap: true,
                      'Wond3rCard, the digital complimentary card that offers convenience, personalization, and versatility. Its an eco-friendly, cost-effective, and secure solution that provides real-time updates, analytics, and a user-friendly experience',
                      style: TextStyle(
                        fontSize: 14,
                        color: textColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  footerTitle('Quick Links', textColor),
                  footerLink('Home'),
                  footerLink('About'),
                  footerLink('Services'),
                  footerLink('Pricing'),
                  footerLink('Contact'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  footerTitle('Contact', textColor),
                  footerText('Email: support@wond3rCard.com'),
                  footerText('Phone: +1 234 567 8900'),
                  footerText('Address: 123 Main St, NY'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  footerTitle('Follow Us', textColor),
                  Row(
                    children: [
                      socialIcon(Icons.facebook),
                      const SizedBox(width: 10),
                      socialIcon(Icons.facebook),
                      const SizedBox(width: 10),
                      socialIcon(Icons.facebook),
                      const SizedBox(width: 10),
                      socialIcon(Icons.facebook),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Divider(color: Colors.deepPurple.withOpacity(0.3)),
          const SizedBox(height: 20),
          Text(
            '© ${DateTime.now().year} A&A Surf Networks Ltd. All rights reserved.',
            style: TextStyle(
              color: textColor.withOpacity(0.7),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget footerTitle(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }

  Widget footerLink(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  Widget footerText(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }

  Widget socialIcon(IconData icon) {
    return CircleAvatar(
      backgroundColor: Colors.deepPurple,
      radius: 16,
      child: Icon(
        icon,
        color: Colors.white,
        size: 18,
      ),
    );
  }
}

class ScrollToTopButton extends StatelessWidget {
  final bool isVisible;

  const ScrollToTopButton({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: AnimatedPositioned(
        bottom: 20,
        right: 20,
        duration: const Duration(milliseconds: 300),
        child: FloatingActionButton(
          onPressed: () {
            ScrollController().animateTo(
              0.0,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          },
          backgroundColor: Colors.deepPurple,
          child: Icon(
            Icons.arrow_upward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
