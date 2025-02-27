import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wond3rcard/src/profile/data/profile_controller/profile_controller.dart';
import 'package:wond3rcard/src/utils/wonder_card_colors.dart';

class NameAndJob extends HookConsumerWidget {
  const NameAndJob({super.key, this.text, this.designation, this.companyName});
  final String? text;
  final String? designation;
  final String? companyName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileController = ref.read(profileProvider);
    final userData = profileController.profileData!.payload.profile;

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          if (profileController.profileData == null) {
            Future.delayed(Duration.zero, () async {
              await profileController.getProfile();
            });
          }
        });
        return null;
      },
      [],
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.left,
         text ?? '${userData.firstname} ${userData.lastname}',
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Barlow',
            fontSize: 18.093,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            Text(
             designation ?? '${userData.designation} @ ',
              style: const TextStyle(
                color: AppColors.grayScale600,
                fontFamily: 'Barlow',
                fontSize: 14.475,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
             companyName ?? '${userData.companyName} ',
              style: const TextStyle(
                color: AppColors.grayScale600,
                fontFamily: 'Barlow',
                fontSize: 14.475,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    );
  }
}
