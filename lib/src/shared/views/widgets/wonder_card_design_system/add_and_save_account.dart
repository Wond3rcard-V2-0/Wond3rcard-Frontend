import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wond3rcard/src/admin/social_media/data/model/social_media.dart';
import 'package:wond3rcard/src/utils/size_constants.dart';
import 'package:wond3rcard/src/utils/wonder_card_colors.dart';
import 'package:wond3rcard/src/utils/wonder_card_typography.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAndSaveAccountWidget extends HookConsumerWidget {
  const AddAndSaveAccountWidget({
    super.key,
    required this.controller,
  });

  final SocialMedia controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();
    final valueNotifier = useState('');
    final baseUrlNotifier = useState(controller.imageUrl);
    final controllerNameNotifier = useState(controller.name);

    useEffect(() {
      _loadSavedData(controller.name, textEditingController, baseUrlNotifier,
          controllerNameNotifier);

      textEditingController.addListener(() {
        valueNotifier.value =
            '${baseUrlNotifier.value}${textEditingController.text}';
        _saveData(controller.name, textEditingController.text,
            baseUrlNotifier.value, controllerNameNotifier.value);
      });

      return null;
    }, [textEditingController]);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingConstants.size11,
        vertical: SpacingConstants.size15,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffCAF0B0),
        borderRadius: BorderRadius.circular(SpacingConstants.size8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter your ${controllerNameNotifier.value} username',
            style: WonderCardTypography.boldTextTitle2(
              color: AppColors.grayScale700,
              fontSize: SpacingConstants.size12,
            ),
          ),
          const SizedBox(
            height: SpacingConstants.size4,
          ),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              hintText: baseUrlNotifier.value,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: SpacingConstants.size12,
              ),
            ),
          ),
          const SizedBox(height: SpacingConstants.size8),
          Text(
            valueNotifier.value,
            style: WonderCardTypography.boldTextTitle2().copyWith(
              color: AppColors.grayScale700,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loadSavedData(
    String socialMediaId,
    TextEditingController textController,
    ValueNotifier<String> baseUrlNotifier,
    ValueNotifier<String> controllerNameNotifier,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('${socialMediaId}_username') ?? '';
    final savedBaseUrl =
        prefs.getString('${socialMediaId}_baseUrl') ?? controller.imageUrl;
    final savedControllerName =
        prefs.getString('${socialMediaId}_controllerName') ?? controller.name;

    textController.text = savedUsername;
    baseUrlNotifier.value = savedBaseUrl;
    controllerNameNotifier.value = savedControllerName;
  }

  Future<void> _saveData(
    String socialMediaId,
    String username,
    String baseUrl,
    String controllerName,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('${socialMediaId}_username', username);
    await prefs.setString('${socialMediaId}_baseUrl', baseUrl);
    await prefs.setString('${socialMediaId}_controllerName', controllerName);
  }
}
