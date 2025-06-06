import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';




import 'package:go_router/go_router.dart';
import 'package:wond3rcard/src/onboarding/views/widgets/continue_widget.dart';
import 'package:wond3rcard/src/onboarding/views/widgets/desktop_onboarding_constant_widget.dart';
import 'package:wond3rcard/src/onboarding/views/widgets/detail_container.dart';
import 'package:wond3rcard/src/onboarding/views/widgets/title_section.dart';
import 'package:wond3rcard/src/utils/size_constants.dart';
import 'package:wond3rcard/src/utils/wonder_card_colors.dart';
import 'package:wond3rcard/src/utils/wonder_card_strings.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wond3rcard/src/admin/social_media/data/controller/social_media_controller.dart';
import 'package:wond3rcard/src/utils/decoration_box.dart';

class OnboardingFourthScreenDesktop extends StatefulHookConsumerWidget {
  const OnboardingFourthScreenDesktop({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingFourthScreenDesktopState();
}

class _OnboardingFourthScreenDesktopState
    extends ConsumerState<OnboardingFourthScreenDesktop> {
  @override
  Widget build(BuildContext context) {
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
      backgroundColor: AppColors.grayScale50,
      body: Row(
        children: [
            Expanded(
               flex: 2,
              child: getStartedStack(context)),
            Spacer(),
           Expanded(
             flex: 3,
             child: Container(
               padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(50),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 mainAxisSize: MainAxisSize.max,
                 children: [
                   const TitleSection(),
                   const SizedBox(
                     height: SpacingConstants.size50,
                   ),
                   socialController.loading
                       ? const Center(child: CircularProgressIndicator())
                       : socialController.socialMedias.isEmpty
                           ? const Center(
                               child: Text('No social media links found.'))
                           : Center(
                               child: SocialMediaList(
                                   socialController: socialController),
                             ),
                   const Spacer(),
                   ContinueWidget(
                     showLoader: socialController.loading,
                     onTap: () {
                       context.go(RouteString.fourthScreen);
                     },
                     buttonText: previewCardText,
                     textColor: AppColors.defaultWhite,
                     onPress: () {
                       context.go(RouteString.previewCard);
                     },
                     bgColor: AppColors.primaryShade,
                   ),
                 ],
               ),
             ),
           ),
           
        ],
      ),
    );
  }
}

class SocialMediaList extends StatefulHookConsumerWidget {
  SocialMediaList({super.key, this.socialController});

  SocialMediaNotifier? socialController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SocialMediaListState();
}

class _SocialMediaListState extends ConsumerState<SocialMediaList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: SpacingConstants.size346,
        height: SpacingConstants.size400,
        decoration: DecorationBox.detailContainerDecorationBox(),
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: widget.socialController!.socialMedias.length,
          itemBuilder: (context, index) {
            final socialMedia = widget.socialController!.socialMedias[index];
            final isExpanded =
                widget.socialController!.expandedItems[index] ?? false;

            return Column(
              children: [
                DetailsContainer(
                  isExpanded: isExpanded,
                  toggleExpansion: () {
                    setState(() {
                      widget.socialController!.expandedItems[index] =
                          !(widget.socialController!.expandedItems[index] ??
                              false);
                    });
                  },
                  socialMedia: socialMedia,
                ),
                const SizedBox(
                  height: 9,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
