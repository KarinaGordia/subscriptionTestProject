import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:subscription_test/entity/entity.dart';
import 'package:subscription_test/ui/subscription_screen/subscription_screen_model.dart';
import 'package:subscription_test/ui/theme/theme.dart';
import 'package:subscription_test/ui/widgets/widgets.dart';

class SubscriptionsSection extends StatelessWidget {
  const SubscriptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _SubscriptionWidgetList(),
        const SizedBox(
          height: 21,
        ),
        GradientButton(
          text: 'Купить',
          size: const WidgetStatePropertyAll(Size(double.infinity, 60)),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _SubscriptionWidgetList extends StatefulWidget {
  const _SubscriptionWidgetList({super.key});

  @override
  State<_SubscriptionWidgetList> createState() =>
      _SubscriptionWidgetListState();
}

class _SubscriptionWidgetListState extends State<_SubscriptionWidgetList> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    final model = SubscriptionScreenModelProvider.read(context)?.model;
    final subscriptions = model?.subscriptionInfo;

    if (subscriptions == null || subscriptions.isEmpty) {
      return const Text('No subscriptions available');
    }

    return Wrap(
      runSpacing: 25,
      children: List.generate(subscriptions.length, (int index) {
        return _SubscriptionOption(
          info: subscriptions[index],
          selected: _value == index,
          onSelected: (bool selected) {
            setState(() {
              _value = selected ? index : null;
            });
          },
        );
      }),
    );
  }
}

class _SubscriptionOption extends StatelessWidget {
  const _SubscriptionOption({
    super.key,
    required this.info,
    required this.selected,
    this.onSelected,
  });

  final SubscriptionInfo info;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final selectionCircle = selected
        ? Container(
            height: 28,
            width: 28,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [AppColors.slateBlue, AppColors.lavenderGray]),
            ),
            child: SvgPicture.asset(
              'assets/images/checkMark.svg',
              fit: BoxFit.none,
            ),
          )
        : Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.white),
            ),
          );

    final selectedDecoration = selected
        ? BoxDecoration(
            color: AppColors.black37,
            borderRadius: BorderRadius.circular(29),
            border: const GradientBoxBorder(
              gradient: LinearGradient(colors: [
                AppColors.white0,
                Colors.white,
              ]),
              width: 1,
            ),
          )
        : BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(29),
          );

    return Stack(
      alignment: Alignment.topRight,
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () => onSelected?.call(!selected),
          borderRadius: BorderRadius.circular(29),
          child: Container(
            // duration: const Duration(milliseconds: 500),
            height: selected ? 272 : 131,
            decoration: selectedDecoration,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      selectionCircle,
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              info.duration,
                              style: textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              info.description,
                              style: textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            info.price,
                            style: textTheme.bodyLarge,
                          ),
                          if (info.oldPrice != null)
                            Text(
                              info.oldPrice!,
                              style: textTheme.labelMedium?.copyWith(
                                color: AppColors.white46,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2,
                                decorationColor: AppColors.white46,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (selected)
                  const _ContentSection(
                    length: 5,
                  ),
              ],
            ),
          ),
        ),
        if (info.profitableMark)
          Positioned(
            top: -15,
            right: -11,
            child: Container(
              width: 75,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Center(
                  child: Text(
                'выгодно',
                style:
                    textTheme.labelMedium?.copyWith(color: AppColors.slateBlue),
              )),
            ),
          ),
      ],
    );
  }
}

class _ContentSection extends StatelessWidget {
  const _ContentSection({super.key, required this.length});

  final int length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(length, (int index) {
          return const _ContentLineItem();
        }),
      ),
    );
  }
}

class _ContentLineItem extends StatelessWidget {
  const _ContentLineItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Row(
        children: [
          Container(
            height: 7,
            width: 7,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            'что входит',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
