import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wond3rcard/src/utils/assets.dart';
import 'package:wond3rcard/src/utils/size_constants.dart';
import 'package:wond3rcard/src/utils/wonder_card_colors.dart';
import 'package:wond3rcard/src/utils/wonder_card_typography.dart';

class DeviceCategory extends StatelessWidget {
  const DeviceCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: 394,
      height: size.height * SpacingConstants.size0point5,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
        color: AppColors.defaultWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Device Category',
            style: WonderCardTypography.boldTextTitleBold(
                color: Color(0xff3A3541)),
          ),
          SizedBox(
            height: 15,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: deviceCategoryList.length,
            itemBuilder: (context, index) {
              return DeviceCategoryWidget(user: deviceCategoryList[index]);
            },
          )
        ],
      ),
    );
  }
}

class DeviceCategoryWidget extends StatelessWidget {
  final DeviceCategoryDataModel user;

  const DeviceCategoryWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(
                user.imageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          SizedBox(width: 15),
          Text(
            user.deviceType,
            style: WonderCardTypography.boldTextTitleBold(
              color: AppColors.grayScale700,
            ),
          ),
          Spacer(),
          Text(
            user.joinedTime,
            style: TextStyle(
              color: AppColors.grayScale600,
              fontFamily: 'Barlow',
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class DeviceCategoryDataModel {
  final String deviceType;
  final String imageUrl;
  final String joinedTime;

  DeviceCategoryDataModel({
    required this.deviceType,
    required this.imageUrl,
    required this.joinedTime,
  });
}

final List<DeviceCategoryDataModel> deviceCategoryList = [
  DeviceCategoryDataModel(
    deviceType: "Mobile",
    imageUrl: SvgAssets.mobile,
    joinedTime: "10:30 AM",
  ),
  DeviceCategoryDataModel(
    deviceType: "Desktop",
    imageUrl: SvgAssets.desktop,
    joinedTime: "11:45 AM",
  ),
  DeviceCategoryDataModel(
    deviceType: "Tablet",
    imageUrl: SvgAssets.tablet,
    joinedTime: "12:15 PM",
  ),
  DeviceCategoryDataModel(
    deviceType: "TV",
    imageUrl: SvgAssets.tv,
    joinedTime: "12:15 PM",
  ),
];
