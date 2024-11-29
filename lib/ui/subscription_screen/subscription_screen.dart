import 'package:flutter/material.dart';
import 'package:subscription_test/ui/subscription_screen/additional_info_row.dart';
import 'package:subscription_test/ui/subscription_screen/subscription_screen_model.dart';
import 'package:subscription_test/ui/subscription_screen/subscriptions_section.dart';
import 'package:subscription_test/ui/theme/theme.dart';
import 'package:subscription_test/ui/widgets/widgets.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final _model = SubscriptionScreenModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              top: 40,
              left: -199,
              child: BlurryCircle(
                width: 317,
                height: 359,
              ),
            ),
            const Positioned(
              top: 370,
              left: 221,
              child: BlurryCircle(
                width: 414,
                height: 359,
              ),
            ),
            SubscriptionScreenModelProvider(
              model: _model,
              child: const _SubscriptionScreenBody(),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.white40,
                ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubscriptionScreenBody extends StatelessWidget {
  const _SubscriptionScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Выберите подписку',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              shadows: [
                const Shadow(
                  offset: Offset(0, 4),
                  blurRadius: 12.0,
                  color: AppColors.white40,
                ),
              ],
            ),
          ),
          const SubscriptionsSection(),
          const AdditionalInfoRow(),
        ],
      ),
    );
  }
}
