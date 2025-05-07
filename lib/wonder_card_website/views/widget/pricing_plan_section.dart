import 'package:flutter/material.dart';
import 'package:wonder_card_website/wonder_card_website/views/widget/section_widget.dart';

class PricingPlan {
  final String title;
  final String monthlyPrice;
  final String yearlyPrice;
  final List<String> features;
  final bool isPopular;

  PricingPlan({
    required this.title,
    required this.monthlyPrice,
    required this.yearlyPrice,
    required this.features,
    this.isPopular = false,
  });
}

final List<PricingPlan> pricingPlans = [
  PricingPlan(
    title: 'Basic',
    monthlyPrice: '\$9/mo',
    yearlyPrice: '\$90/yr',
    features: [
      '1 User',
      'Basic Support',
      'Limited Features',
    ],
  ),
  PricingPlan(
    title: 'Pro',
    monthlyPrice: '\$29/mo',
    yearlyPrice: '\$290/yr',
    features: [
      '5 Users',
      'Priority Support',
      'All Features Included',
    ],
    isPopular: true,
  ),
  PricingPlan(
    title: 'Enterprise',
    monthlyPrice: '\$99/mo',
    yearlyPrice: '\$990/yr',
    features: [
      'Unlimited Users',
      'Dedicated Support',
      'Custom Solutions',
    ],
  ),
];

class PricingPlanCard extends StatelessWidget {
  final PricingPlan plan;
  final bool isYearly;

  const PricingPlanCard(
      {super.key, required this.plan, required this.isYearly});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: plan.isPopular ? Colors.deepPurple : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.deepPurpleAccent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurpleAccent.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (plan.isPopular)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Popular',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 10),
          Text(
            plan.title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: plan.isPopular ? Colors.white : Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            isYearly ? plan.yearlyPrice : plan.monthlyPrice,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: plan.isPopular ? Colors.white : Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 20),
          ...plan.features.map((feature) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(Icons.check_circle,
                        color: plan.isPopular
                            ? Colors.white
                            : Colors.deepPurpleAccent,
                        size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        feature,
                        style: TextStyle(
                          color:
                              plan.isPopular ? Colors.white70 : Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    plan.isPopular ? Colors.amber : Colors.deepPurple,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Choose Plan'),
            ),
          )
        ],
      ),
    );
  }
}

class PricingPlansSection extends StatefulWidget {
  const PricingPlansSection({super.key});

  @override
  State<PricingPlansSection> createState() => _PricingPlansSectionState();
}

class _PricingPlansSectionState extends State<PricingPlansSection> {
  bool isYearly = false;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Pricing Plans for Everyone',
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Monthly',
                style: TextStyle(
                  color: !isYearly ? Colors.deepPurple : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: isYearly,
                activeColor: Colors.deepPurple,
                onChanged: (value) {
                  setState(() {
                    isYearly = value;
                  });
                },
              ),
              Text(
                'Yearly',
                style: TextStyle(
                  color: isYearly ? Colors.deepPurple : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 450,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: pricingPlans.length,
              itemBuilder: (context, index) {
                final plan = pricingPlans[index];
                return PricingPlanCard(plan: plan, isYearly: isYearly);
              },
            ),
          ),
        ],
      ),
    );
  }
}
