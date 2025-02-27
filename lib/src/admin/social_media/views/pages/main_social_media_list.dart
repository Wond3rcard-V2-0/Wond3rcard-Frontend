//SocialMediaList

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wond3rcard/src/shared/views/widgets/custom_app_bar.dart';
import 'package:wond3rcard/src/shared/views/widgets/social_media_list.dart' show SocialMediaList;
import 'package:wond3rcard/src/shared/views/widgets/wonder_card_design_system/back_navigator.dart';

class MainSocialMediaList extends HookConsumerWidget {
  const MainSocialMediaList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(leading:  BackNavigator(
       onPress:  () => context.go('/'),
      ),
      
       title: ''),
      body: SocialMediaList(),
    );
  }
}
