import 'package:flutter/material.dart';
import 'package:kooha_test/export.dart';

class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  TextEditingController searchController = TextEditingController();
  void handleSearchText(String? text) {
    setState(() {
      // obscurePassword = text == null || text.isEmpty;
      searchController.text = text!;
    });
  }

  List<String> occupationList = [
    'Actor',
    'Athletes',
    'Comedians',
    'Content Creators',
    'Actor',
  ];

  @override
  void initState() {
    super.initState();
    BrowseCmd(context).getFeaturedCeleb();
    BrowseCmd(context).getTrendingCeleb();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  124.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryText(
                        text: R.S.browse,
                        fontSize: 24,
                      ),
                      SvgPicture.asset(R.png.notification.svg)
                    ],
                  ),
                  20.verticalSpace,
                  CustomTextField(
                    textInputType: TextInputType.text,
                    textController: searchController,
                    hintText: R.S.search,
                    autoFocus: true,
                    validate: Validator.string(),
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icon(
                      Icons.search,
                      color: theme.secondaryTxt,
                    ),
                    onChanged: (newValue) {},
                  ),
                  10.verticalSpace,
                  SizedBox(
                    height: 35,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: occupationList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Wrap(
                            children: [
                              SizedBox(
                                height: 36,
                                child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: theme.greyTextFieldFill,
                                      side: BorderSide(color: theme.grey),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                      ),
                                    ),
                                    onPressed: null, //() {},
                                    child: SecondaryText(
                                      text: occupationList[index],
                                      color: theme.primaryText,
                                    )),
                              ),
                              10.horizontalSpace
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            const Line(width: double.infinity),
            32.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrimaryText(
                            text: R.S.featured,
                            fontSize: 24,
                            color: theme.secondaryTxt,
                          ),
                          PrimaryText(
                            text: R.S.seeAll,
                            color: theme.secondary,
                          ).clickable(() {
                            context.push(const SeeAllFeatured());
                          }),
                        ],
                      ),
                      13.verticalSpace,
                      Consumer<BrowseProvider>(builder: (context, featured, _) {
                        return SizedBox(
                          height: 266,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 20),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: featured.featuredModel.length,
                            itemBuilder: ((context, index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomContainer2(
                                        addShadow: false,
                                        color: theme.background,
                                        width: 135,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: SizedBox(
                                              height: 210,
                                              child: Image.network(
                                                  '${R.N.imageUrl}${featured.featuredModel[index].profileImagePath}',
                                                  errorBuilder: (BuildContext
                                                          context,
                                                      Object error,
                                                      StackTrace? stackTrace) {
                                                return Image.asset(
                                                    R.png.image.imgPng);
                                              }, fit: BoxFit.cover),
                                            ))),
                                    5.verticalSpace,
                                    PrimaryText(
                                      text: featured
                                          .featuredModel[index].fullName!,
                                      fontSize: 14,
                                    ),
                                    5.verticalSpace,
                                    SecondaryText(
                                      text: featured
                                          .featuredModel[index].occupation!,
                                      fontSize: 10,
                                    ),
                                    2.verticalSpace,
                                    Row(
                                      children: [
                                        PrimaryText(
                                          text:
                                              '${MoneySymbols.ngn} ${featured.featuredModel[index].fee!.bookingFee}',
                                          fontSize: 13,
                                          color: theme.secondary,
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        );
                      }),
                    ],
                  ),
                  const Line(width: double.infinity),
                  13.verticalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrimaryText(
                            text: R.S.trending,
                            fontSize: 24,
                            color: theme.secondaryTxt,
                          ),
                          PrimaryText(
                            text: R.S.seeAll,
                            color: theme.secondary,
                          ).clickable(() {
                            context.push(const SeeAllTrending());
                          }),
                        ],
                      ),
                      13.verticalSpace,
                      Consumer<BrowseProvider>(builder: (context, trending, _) {
                        return SizedBox(
                          height: 266,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 20),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: trending.trendingCelebModel.length,
                            itemBuilder: ((context, index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomContainer2(
                                        addShadow: false,
                                        color: theme.background,
                                        width: 135,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: SizedBox(
                                            height: 210,
                                            child: Image.network(
                                                '${R.N.imageUrl}${trending.trendingCelebModel[index].profileImagePath}',
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object error,
                                                    StackTrace? stackTrace) {
                                              return Image.asset(R.png.image
                                                  .imgPng); // Display a default/placeholder image on error
                                            }, fit: BoxFit.cover),
                                          ),
                                        )),
                                    5.verticalSpace,
                                    PrimaryText(
                                      text: trending
                                          .trendingCelebModel[index].fullName!,
                                      fontSize: 14,
                                    ),
                                    5.verticalSpace,
                                    SecondaryText(
                                      text: trending.trendingCelebModel[index]
                                              .occupation ??
                                          'Actor',
                                      fontSize: 10,
                                    ),
                                    2.verticalSpace,
                                    Row(
                                      children: [
                                        PrimaryText(
                                          text:
                                              '${MoneySymbols.ngn} ${trending.trendingCelebModel[index].fee!.bookingFee}',
                                          fontSize: 13,
                                          color: theme.secondary,
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        );
                      }),
                    ],
                  ),
                  const Line(width: double.infinity),
                  13.verticalSpace,
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrimaryText(
                            text: R.S.newNoteWorthy,
                            fontSize: 24,
                            color: theme.secondaryTxt,
                          ),
                          PrimaryText(
                            text: R.S.seeAll,
                            color: theme.secondary,
                          ),
                        ],
                      ),
                      13.verticalSpace,
                      SizedBox(
                        height: 266,
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 20),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: ((context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomContainer2(
                                      addShadow: false,
                                      color: theme.background,
                                      width: 135,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(R.png.image.imgPng,
                                            fit: BoxFit.cover),
                                      )),
                                  5.verticalSpace,
                                  const PrimaryText(
                                    text: 'Bimbo Ademoye ',
                                    fontSize: 14,
                                  ),
                                  5.verticalSpace,
                                  const SecondaryText(
                                    text: 'Actor',
                                    fontSize: 10,
                                  ),
                                  2.verticalSpace,
                                  Row(
                                    children: [
                                      PrimaryText(
                                        text: 'N24,000',
                                        fontSize: 13,
                                        color: theme.secondary,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                  const Line(width: double.infinity),
                  13.verticalSpace,
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrimaryText(
                            text: R.S.actors,
                            fontSize: 24,
                            color: theme.secondaryTxt,
                          ),
                          PrimaryText(
                            text: R.S.seeAll,
                            color: theme.secondary,
                          ),
                        ],
                      ),
                      13.verticalSpace,
                      SizedBox(
                        height: 266,
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 20),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: ((context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomContainer2(
                                      addShadow: false,
                                      color: theme.background,
                                      width: 135,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(R.png.image.imgPng,
                                            fit: BoxFit.cover),
                                      )),
                                  5.verticalSpace,
                                  const PrimaryText(
                                    text: 'Bimbo Ademoye ',
                                    fontSize: 14,
                                  ),
                                  5.verticalSpace,
                                  const SecondaryText(
                                    text: 'Actor',
                                    fontSize: 10,
                                  ),
                                  2.verticalSpace,
                                  Row(
                                    children: [
                                      PrimaryText(
                                        text: 'N24,000',
                                        fontSize: 13,
                                        color: theme.secondary,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                  const Line(width: double.infinity),
                  13.verticalSpace,
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrimaryText(
                            text: R.S.musicians,
                            fontSize: 24,
                            color: theme.secondaryTxt,
                          ),
                          PrimaryText(
                            text: R.S.seeAll,
                            color: theme.secondary,
                          ),
                        ],
                      ),
                      13.verticalSpace,
                      SizedBox(
                        height: 266,
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 20),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: ((context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomContainer2(
                                      addShadow: false,
                                      color: theme.background,
                                      width: 135,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(R.png.image.imgPng,
                                            fit: BoxFit.cover),
                                      )),
                                  5.verticalSpace,
                                  const PrimaryText(
                                    text: 'Bimbo Ademoye ',
                                    fontSize: 14,
                                  ),
                                  5.verticalSpace,
                                  const SecondaryText(
                                    text: 'Actor',
                                    fontSize: 10,
                                  ),
                                  2.verticalSpace,
                                  Row(
                                    children: [
                                      PrimaryText(
                                        text: 'N24,000',
                                        fontSize: 13,
                                        color: theme.secondary,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }
}
