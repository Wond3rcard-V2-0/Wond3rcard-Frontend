import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:wonder_card_website/utils/size_constants.dart';
import 'package:wonder_card_website/utils/util.dart';
import 'dart:ui';

import 'package:wonder_card_website/utils/wonder_card_colors.dart';
import 'package:wonder_card_website/wonder_card_website/views/widget/app_footer.dart';
import 'package:wonder_card_website/wonder_card_website/views/widget/introduction_section.dart';
import 'package:wonder_card_website/wonder_card_website/views/widget/our_services_section.dart';
import 'package:wonder_card_website/wonder_card_website/views/widget/particle_bg.dart';
import 'package:wonder_card_website/wonder_card_website/views/widget/virtual_semo_section.dart';
import 'package:wonder_card_website/wonder_card_website/views/widget/what_people_say_about_us_card.dart';

final themeNotifier = ValueNotifier(ThemeMode.light);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemScrollController scrollController = ItemScrollController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isDesktop(context)
          ? AppBar(
              title: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Image.asset(
                  'images/blue-logo.png',
                  width: 200,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    themeNotifier.value == ThemeMode.dark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : AppColors.primaryShade700,
                  ),
                  onPressed: () {
                    themeNotifier.value = themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  },
                ),
                TextButton(
                  onPressed: () => scrollController.scrollTo(
                      index: 0, duration: Duration(milliseconds: 600)),
                  child: Text('Home',
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppColors.primaryShade700,
                      )),
                ),
                TextButton(
                  onPressed: () => scrollController.scrollTo(
                      index: 1, duration: const Duration(milliseconds: 600)),
                  child: Text('Services',
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppColors.primaryShade700,
                      )),
                ),
                TextButton(
                  onPressed: () => scrollController.scrollTo(
                      index: 2, duration: const Duration(milliseconds: 600)),
                  child: Text('Demo',
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppColors.primaryShade700,
                      )),
                ),
                TextButton(
                  onPressed: () => scrollController.scrollTo(
                      index: 3, duration: const Duration(milliseconds: 600)),
                  child: Text('About Us',
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppColors.primaryShade700,
                      )),
                ),
                TextButton(
                  onPressed: () {
                    context.go(RouteString.logIn);
                  },
                  child: Text('Login',
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppColors.primaryShade700,
                      )),
                ),
              ],
            )
          : AppBar(),
      drawer: isDesktop(context)
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        'images/blue-logo.png',
                        width: 150,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                      scrollController.scrollTo(
                          index: 0, duration: Duration(milliseconds: 600));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.design_services),
                    title: Text('Services'),
                    onTap: () {
                      Navigator.pop(context);
                      scrollController.scrollTo(
                          index: 1, duration: Duration(milliseconds: 600));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.videocam),
                    title: Text('Demo'),
                    onTap: () {
                      Navigator.pop(context);
                      scrollController.scrollTo(
                          index: 2, duration: Duration(milliseconds: 600));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About Us'),
                    onTap: () {
                      Navigator.pop(context);
                      scrollController.scrollTo(
                          index: 3, duration: Duration(milliseconds: 600));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.login),
                    title: Text('Login'),
                    onTap: () {
                      Navigator.pop(context);
                      context.go(RouteString.logIn);
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      themeNotifier.value == ThemeMode.dark
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    ),
                    title: Text('Toggle Theme'),
                    onTap: () {
                      themeNotifier.value =
                          themeNotifier.value == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                    },
                  ),
                ],
              ),
            ),
      body: Stack(
        children: [
          const Positioned.fill(child: ParticleBackground()),
          ScrollablePositionedList.builder(
            itemScrollController: scrollController,
            itemCount: 5,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return IntroductionSection();
                case 1:
                  return OurServicesSection();
                case 2:
                  return VirtualSemoSection();

                case 3:
                  return WhatPeopleSayAboutUsWidget();

                case 4:
                  return AppFooter();
                default:
                  return const SizedBox(height: 80);
              }
            },
          ),
        ],
      ),
    );
  }
}
