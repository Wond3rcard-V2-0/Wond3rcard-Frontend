import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wond3rcard/src/cards/data/controller/card_controller.dart';
import 'package:wond3rcard/src/cards/views/widgets/card_list_widget.dart';
import 'package:wond3rcard/src/cards/views/widgets/no_cards_widget.dart';
import 'package:wond3rcard/src/shared/views/widgets/custom_app_bar.dart';
import 'package:wond3rcard/src/utils/wonder_card_colors.dart';
import 'package:wond3rcard/src/utils/wonder_card_strings.dart';

class CardsMobile extends HookConsumerWidget {
  const CardsMobile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardController = ref.read(cardProvider);

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          final cardController = ref.read(cardProvider);
          Future.delayed(Duration.zero, () async {
            await cardController.getAllUsersCard();
          });
        });
        return null;
      },
      [],
    );

    return Scaffold(
        appBar: CustomAppBar(
          leading: SizedBox(),
          title: 'My Cards',
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () {
                  context.go(RouteString.createNewCard);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primaryShade,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const HeroIcon(
                    HeroIcons.plus,
                    color: AppColors.defaultWhite,
                  ),
                ),
              ),
            )
          ],
        ),
        body: cardController.loading
            ? CircularProgressIndicator()
            : GestureDetector(
                onTap: () {},
                child: CardListWidget(cardController: cardController),
              ));
  }
}
