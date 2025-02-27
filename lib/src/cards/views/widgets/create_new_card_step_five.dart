
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wond3rcard/src/admin/social_media/data/controller/social_media_controller.dart';
import 'package:wond3rcard/src/cards/data/controller/card_controller.dart';
import 'package:wond3rcard/src/cards/views/widgets/card_social_links.dart';
import 'package:wond3rcard/src/cards/views/widgets/create_card_reusable_app_bar.dart';
import 'package:wond3rcard/src/shared/views/widgets/social_media_list.dart';
import 'package:wond3rcard/src/shared/views/widgets/wonder_card_design_system/button/wonder_card_button.dart';
import 'package:wond3rcard/src/utils/size_constants.dart';
import 'package:wond3rcard/src/utils/wonder_card_colors.dart';
import 'package:wond3rcard/src/utils/wonder_card_strings.dart';
import 'package:wond3rcard/src/utils/wonder_card_typography.dart';



class CreateNewCardStepFive extends HookConsumerWidget {
  const CreateNewCardStepFive({super.key});
  static const routeName = RouteString.createNewCardStepFive;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardController = ref.watch(cardProvider);
    final socialController = ref.watch(socialProvider);
    useEffect(
      () {
        Future.delayed(Duration.zero, () async {
          try {
            await ref.read(socialProvider).getSocialMedia(context);
          } catch (error) {}
        });
        return null;
      },
      [],
    );

    return Scaffold(
       appBar: CreateCardReusableAppBar(
        route: RouteString.createNewCardFour,
          titleText: 'Step 5 of 5',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SocialMediaSwitches(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Social Media',
                    style: WonderCardTypography.boldTextTitle2(
                      fontSize: SpacingConstants.size16,
                      color: AppColors.grayScale,
                    ),
                  ),
                  Text(
                    viewAllText,
                    style: WonderCardTypography.boldTextTitle2(
                      fontSize: SpacingConstants.size16,
                      color: AppColors.grayScale300,
                    ),
                  ),
                ],
              ),
            ),
            socialController.loading
                ? const Center(child: CircularProgressIndicator())
                : socialController.socialMedias.isEmpty
                    ? const Center(child: Text('No social media links found.'))
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 16),
                        child:
                            SocialMediaList(socialController: socialController),
                      ),
            Center(
              child: WonderCardButton(
                showLoader: cardController.loading,
                text: 'Submit',
                onPressed: () async {
                  try {
                    await ref.watch(cardProvider).createCard(context);
                  } catch (e) {
                    print('Error: $e');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

