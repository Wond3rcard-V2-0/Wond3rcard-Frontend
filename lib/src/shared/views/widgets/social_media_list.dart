import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wond3rcard/src/onboarding/views/widgets/detail_container.dart';
import 'package:wond3rcard/src/utils/size_constants.dart';
import 'package:wond3rcard/src/admin/social_media/data/controller/social_media_controller.dart';
import 'package:wond3rcard/src/utils/decoration_box.dart';

// ignore: must_be_immutable
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
