import 'dart:developer';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:e_commerce_clothing_shop_ui/app_style.dart';
import 'package:e_commerce_clothing_shop_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const HomeScreen(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 64,
          child: CustomNavigationBar(
            isFloating: true,
            borderRadius: const Radius.circular(40),
            unSelectedColor: kGrey,
            selectedColor: kWhite,
            backgroundColor: kBrown,
            strokeColor: Colors.transparent,
            scaleFactor: 0.1,
            iconSize: 40,
            items: [
              CustomNavigationBarItem(
                  icon: _currentIndex == 0
                      ? SvgPicture.asset('assets/home_icon_selected.svg')
                      : SvgPicture.asset('assets/home_icon_unselected.svg')),
                        CustomNavigationBarItem(
                  icon: _currentIndex == 1
                      ? SvgPicture.asset('assets/cart_icon_selected.svg')
                      : SvgPicture.asset('assets/cart_icon_unselected.svg')),  CustomNavigationBarItem(
                  icon: _currentIndex == 2
                      ? SvgPicture.asset('assets/favorite_icon_selected.svg')
                      : SvgPicture.asset('assets/favorite_icon_unselected.svg')),  CustomNavigationBarItem(
                  icon: _currentIndex == 3
                      ? SvgPicture.asset('assets/account_icon_selected.svg')
                      : SvgPicture.asset('assets/account_icon_unselected.svg')),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// list of categories
  List<String> categories = [
    'All items',
    'Dress',
    'Hat',
    'Watch',
  ];

  //list of categories icons
  List<String> icons = [
    'all_items_icon',
    'dress_icon',
    'hat_icon',
    'watch_icon'
  ];

  List<String> images = [
    'image-01',
    'image-02',
    'image-03',
    'image-04',
    'image-05',
  ];

  int current = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var svgPicture = SvgPicture;
    return SafeArea(
        child: ListView(
      children: [
        //app bar
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hello, Welcome 👋',
                      style: kEncodeSansRagular.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5)),
                  Text('Sumit Pant',
                      style: kEncodeSansBold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4))
                ],
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: kGrey,
                backgroundImage: NetworkImage(
                    'https://xsgames.co/randomusers/assets/avatars/male/74.jpg'),
              )
            ],
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //TextField and button

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: kEncodeSansRagular.copyWith(
                      color: kDarkGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 13,
                      ),
                      prefixIcon: IconTheme(
                        data: IconThemeData(color: kDarkGrey),
                        child: const Icon(Icons.search),
                      ),
                      hintText: 'Search clothes ....',
                      border: kInputBorder,
                      errorBorder: kInputBorder,
                      disabledBorder: kInputBorder,
                      focusedBorder: kInputBorder,
                      focusedErrorBorder: kInputBorder,
                      enabledBorder: kInputBorder,
                      hintStyle: kEncodeSansRagular.copyWith(
                          color: kDarkGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5)),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                height: 49,
                width: 49,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  color: kBlack,
                ),
                child: SvgPicture.asset(
                  'assets/filter_icon.svg',
                ),
              )
            ],
          ),
        ),

        const SizedBox(height: 24),

        //Categories
        SizedBox(
          width: double.infinity,
          height: 36,
          child: ListView.builder(
              itemCount: categories.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current == index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: (index == 0 ? kPaddingHorizontal : 15),
                      right: (index == categories.length - 1
                          ? kPaddingHorizontal
                          : 0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 36,
                    decoration: BoxDecoration(
                      color: current == index ? kBrown : kWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: current == index
                          ? null
                          : Border.all(
                              color: kLightGrey,
                              width: 1,
                            ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          current == index
                              ? 'assets/${icons[index]}_selected.svg'
                              : 'assets/${icons[index]}_unselected.svg',
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          categories[index],
                          style: kEncodeSansMedium.copyWith(
                            color: current == index ? kWhite : kDarkBrown,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
        const SizedBox(
          height: 32,
        ),

        //grids of products
        MasonryGridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 23,
          itemCount: images.length,
          padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        child: Image.asset(
                          'assets/images/${images[index]}.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        right: 12,
                        top: 12,
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                              'assets/favorite_cloth_icon_unselected.svg'),
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
                Text(
                  'Modern light clothes',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: kEncodeSansSemibold.copyWith(
                      color: kDarkBrown,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                ),
                Text(
                  'Dress Modern',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kEncodeSansRagular.copyWith(
                      color: kGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$212.99',
                      maxLines: 1,
                      style: kEncodeSansSemibold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: kYellow,
                          size: 16,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '5.0',
                          maxLines: 1,
                          style: kEncodeSansRagular.copyWith(
                              color: kDarkBrown,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),

        //floating navigation bar
      ],
    ));
  }
}
