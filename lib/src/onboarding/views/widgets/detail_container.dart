import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wond3rcard/src/admin/social_media/data/model/social_media.dart';
import 'package:wond3rcard/src/onboarding/views/widgets/account_row.dart';
import 'package:wond3rcard/src/utils/size_constants.dart';
import 'package:wond3rcard/src/shared/views/widgets/wonder_card_design_system/add_and_save_account.dart';

class DetailsContainer extends HookConsumerWidget {
  final bool isExpanded;
  final VoidCallback toggleExpansion;
  final SocialMedia socialMedia;

  const DetailsContainer(
      {super.key,
      required this.isExpanded,
      required this.toggleExpansion,
      required this.socialMedia});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: detailsContainerChildren(socialMedia),
    );
  }

  Column detailsContainerChildren(SocialMedia socialController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: toggleExpansion,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AccountRow(
                socialController: socialController, isExpanded: isExpanded),
          ),
        ),
        if (isExpanded) ...[
          const SizedBox(
            height: SpacingConstants.size12,
          ),
          Padding(
            padding: const EdgeInsets.all(
              SpacingConstants.size13,
            ),
            child: AddAndSaveAccountWidget(
              controller: socialController,
            ),
          ),
        ],
      ],
    );
  }
}
