import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:wonder_card_website/utils/size_constants.dart';
import 'package:wonder_card_website/wonder_card_website/views/widget/pricing_plan_section.dart';

class VirtualSemoSection extends StatelessWidget {
  const VirtualSemoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text('Vertual Demo',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )).animate(delay: (100).ms).fadeIn(duration: 600.ms),
            const SizedBox(height: 24),
            Container(
              child: Image.asset(
                'images/virtual_demo.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            isDesktop(context) ? _textMethod() : _textMethodMobile(),
            const SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              child: Image.asset(
                'images/bottom-card-bg.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            PricingPlansSection(),
          ],
        ),
      ],
    );
  }

  Row _textMethod() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: Text('Plans for companies of all sizes',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )).animate(delay: (100).ms).fadeIn(duration: 600.ms),
        ),
        Spacer(),
        Container(
          width: 600,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Text(
              softWrap: true,
              'This platform offers a consistent and compelling brand experience—complete with digital business cards, virtual backgrounds, and automated email signatures—that turns every customer touchpoint into a branded, interactive, and measurable opportunity.',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )).animate(delay: (100).ms).fadeIn(duration: 600.ms),
        ),
      ],
    );
  }

  Widget _textMethodMobile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(6),
          margin: EdgeInsets.all(6),
          child: Text('Plans for companies of all sizes',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )).animate(delay: (100).ms).fadeIn(duration: 600.ms),
        ),
        Container(
          width: 600,
          padding: EdgeInsets.all(6),
          margin: EdgeInsets.all(6),
          child: Text(
              softWrap: true,
              'This platform offers a consistent and compelling brand experience—complete with digital business cards, virtual backgrounds, and automated email signatures—that turns every customer touchpoint into a branded, interactive, and measurable opportunity.',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )).animate(delay: (100).ms).fadeIn(duration: 600.ms),
        ),
      ],
    );
  }
}
