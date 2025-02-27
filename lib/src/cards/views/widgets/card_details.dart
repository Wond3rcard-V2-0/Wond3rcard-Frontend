import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_wrap/smart_wrap.dart';
import 'package:wond3rcard/src/admin/social_media/data/controller/social_media_controller.dart';
import 'package:wond3rcard/src/cards/data/controller/card_controller.dart';
import 'package:wond3rcard/src/cards/views/widgets/business_catelog_widget.dart';
import 'package:wond3rcard/src/cards/views/widgets/home_address_widget.dart';
import 'package:wond3rcard/src/cards/views/widgets/testimonies_widget.dart';
import 'package:wond3rcard/src/home/views/widgets/upgrade_now_button.dart';
import 'package:wond3rcard/src/onboarding/views/widgets/continue_widget.dart';
import 'package:wond3rcard/src/preview_card/data/controller/preview_controller.dart';
import 'package:wond3rcard/src/preview_card/views/pages/mobile/preview_card_mobile.dart';
import 'package:wond3rcard/src/profile/data/profile_controller/profile_controller.dart';
import 'package:wond3rcard/src/utils/assets.dart';
import 'package:wond3rcard/src/utils/size_constants.dart';
import 'package:wond3rcard/src/utils/wonder_card_colors.dart';
import 'package:wond3rcard/src/utils/wonder_card_strings.dart';
import 'package:wond3rcard/src/utils/wonder_card_typography.dart';

class CardDetails extends StatefulHookConsumerWidget {
  const CardDetails({super.key, required this.index});

  final int index;

  static const String routeName = RouteString.cardDetails;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardDetailsState();
}

class _CardDetailsState extends ConsumerState<CardDetails> {
  @override
  void initState() {
    super.initState();
    ref.read(previewProvider).loadUserDetails();
  }

  Future<String> getSavedUsername(String socialMediaId) async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString(socialMediaId) ?? '';
    return savedUsername;
  }

  @override
  Widget build(BuildContext context) {
    final profileController = ref.read(profileProvider);
    final cardController = ref.watch(cardProvider);
    final profile = profileController.profileData?.payload.profile;
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          if (profileController.profileData == null) {
            Future.delayed(Duration.zero, () async {
              await profileController.getProfile();
              await ref.read(cardProvider).getAUsersCard(context);
            });
          }
        });
        return null;
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: HeroIcon(
            HeroIcons.chevronLeft,
            color: Colors.black,
          ),
          onPressed: () {
            context.go(
              RouteString.mainDashboard,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.grayScale50,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(
                    ImageAssets.cardBanner,
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 25,
                    top: 120,
                    child: userProfileImage(
                      image: profileController
                          .profileData?.payload.profile.profileUrl,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SmartWrap(
                  type: WrapType.column,
                  runSpacing: 10.0,
                  spacing: 10.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: AppColors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cardController.getCardsResponse?.payload
                                    ?.cards?[widget.index].cardName ??
                                emptyString,
                            style: WonderCardTypography.boldTextH5(
                              fontSize: SpacingConstants.size23,
                              color: AppColors.grayScale,
                            ),
                          ),
                          Text(
                            '${profile?.designation}@${profile?.companyName}',
                            style: WonderCardTypography.boldTextTitle2(
                              fontSize: SpacingConstants.size16,
                              color: AppColors.grayScale600,
                            ),
                          ),
                          const Divider(),
                          ReusableUserDataCard(
                            text: cardController.getCardsResponse?.payload
                                ?.cards?[widget.index].contactInfo?.email,
                            widget: const HeroIcon(
                              HeroIcons.envelope,
                              color: AppColors.primaryShade,
                              size: SpacingConstants.size15,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ReusableUserDataCard(
                            text: cardController.getCardsResponse?.payload
                                ?.cards?[widget.index].contactInfo?.phone,
                            widget: const HeroIcon(
                              HeroIcons.phone,
                              color: AppColors.primaryShade,
                              size: SpacingConstants.size15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 162,
                            height: 60,
                            decoration: BoxDecoration(
                                color: AppColors.primaryShade,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Connect',
                                    style:
                                        WonderCardTypography.boldTextTitleBold(
                                            fontSize: 18,
                                            color: AppColors.defaultWhite)),
                                SizedBox(width: 5),
                                HeroIcon(
                                  HeroIcons.link,
                                  color: AppColors.defaultWhite,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              width: 162,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryShade,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text('Exchange Contact',
                                    style:
                                        WonderCardTypography.boldTextTitleBold(
                                            fontSize: 18,
                                            color: AppColors.defaultWhite)),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                        height: 341,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.defaultWhite,
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'Social media connect',
                                  style: WonderCardTypography.boldTextTitleBold(
                                    fontSize: 18,
                                    color: AppColors.grayScale600,
                                  ),
                                ),
                              ),
                            ),
                            SocialsGridView(),
                          ],
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    HomeAddressWidget(),
                    const SizedBox(
                      height: 8,
                    ),
                    BusinessCatalogWidget(),
                    const SizedBox(
                      height: 8,
                    ),
                    TestimoniesWidget(),
                    ContinueWidget(
                      showLoader: cardController.loading,
                      buttonText: editCard,
                      textColor: AppColors.defaultWhite,
                      bgColor: AppColors.primaryShade,
                      onTap: () {
                        context.go(RouteString.fifthScreen);
                      },
                      onPress: () {
                        context.go(RouteString.logIn);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SocialsGridView extends HookConsumerWidget {
  const SocialsGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socialController = ref.watch(socialProvider);

    useEffect(() {
      Future.delayed(Duration.zero, () async {
        try {
          await ref.read(socialProvider).getSocialMedia(context);
        } catch (error) {}
      });
      return null;
    }, []);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 207,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: socialController.socialMedias.length,
          itemBuilder: (context, index) {
            final socialMedia = socialController.socialMedias[index];

            return FutureBuilder<Map<String, String?>>(
              future: _getSavedData(socialMedia.name),
              builder: (context, snapshot) {
                final data = snapshot.data ?? {};
                final savedUsername = data['username'] ?? 'Enter your username';
                final savedBaseUrl = data['baseUrl'] ?? '';
                final savedName = data['controllerName'] ?? 'facebook';

                // Check if `socialMedia.name` contains the `savedBaseUrl`
                final titleToDisplay = socialMedia.name.contains(savedBaseUrl)
                    ? socialMedia.name
                    : savedUsername;

                return SocialItemMediaWidget(
                  titleText: savedName,
                  image: savedBaseUrl,
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<Map<String, String?>> _getSavedData(String socialMediaId) async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'username': prefs.getString('${socialMediaId}_username'),
      'baseUrl': prefs.getString('${socialMediaId}_baseUrl'),
      'controllerName': prefs.getString('${socialMediaId}_controllerName'),
    };
  }
}

class SocialItemMediaWidget extends HookConsumerWidget {
  const SocialItemMediaWidget({
    super.key,
    required this.titleText,
    required this.image,
  });

  final String titleText;
  final String image;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: SpacingConstants.size100,
      height: SpacingConstants.size120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              image,
              width: 69.64,
              height: 69.64,
            ),
          ),
          Text(titleText, style: WonderCardTypography.boldTextTitleBold())
        ],
      ),
    );
  }
}
