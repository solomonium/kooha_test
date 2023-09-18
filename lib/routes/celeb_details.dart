// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kooha_test/export.dart';

class CelebDetails extends StatefulWidget {
  CelebDetails({super.key, this.id});

  String? id;

  @override
  State<CelebDetails> createState() => _CelebDetailsState();
}

class _CelebDetailsState extends State<CelebDetails> {
  late Completer<void> _dataLoadedCompleter;
  @override
  void initState() {
    _dataLoadedCompleter = Completer<void>();
    fetchDataAndComplete();
    super.initState();
  }

  Future<void> fetchDataAndComplete() async {
    // Fetch your data and update your model here
    await BrowseCmd(context).getCelebById(widget.id ?? '');

    // Signal that the data has been loaded by completing the Completer
    _dataLoadedCompleter.complete();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  100.verticalSpace,
                  CustomAppBar(
                      isWidget: true,
                      onBackButtonPressed: () {
                        Navigator.pop(context);
                      },
                      middleOrEndWidget: const SizedBox()),
                ],
              ),
            ),
            20.verticalSpace,
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: FutureBuilder<void>(
                        future:
                            _dataLoadedCompleter.future, // The future to await
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return SingleChildScrollView(
                              child: Consumer<BrowseProvider>(
                                  builder: (context, details, _) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: CircleAvatar(
                                              backgroundColor: theme.grey,
                                              radius: 50,
                                              child: ClipOval(
                                                  child: Image.network(
                                                      '${R.N.imageUrl}${details.celebDetails.data!.profileImagePath}',
                                                      errorBuilder:
                                                          (BuildContext context,
                                                              Object error,
                                                              StackTrace?
                                                                  stackTrace) {
                                                return Image.asset(
                                                    R.png.image.imgPng);
                                              }, fit: BoxFit.cover))),
                                        ),
                                        10.horizontalSpace,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            PrimaryText(
                                                text: details.celebDetails.data!
                                                    .fullName!
                                                    .toTitleCase()),
                                            SecondaryText(
                                                text: details.celebDetails.data!
                                                        .occupation ??
                                                    'No Occupation')
                                          ],
                                        ),
                                        Expanded(child: Container()),
                                        PrimaryButton(
                                            width: 75.w,
                                            height: 36,
                                            color: theme.grey.withOpacity(0.5),
                                            buttonText: R.S.follow,
                                            buttonTextColor: theme.secondary,
                                            onPressed: () {})
                                      ],
                                    ),
                                    15.verticalSpace,
                                    SecondaryText(
                                      text: details.celebDetails.data!.bio ??
                                          'No bio',
                                      color: theme.glassWhite.withOpacity(0.7),
                                    ),
                                    30.verticalSpace,
                                    details.celebDetails.data!.influencer!
                                            .videos!.isEmpty
                                        ? SizedBox(
                                            height: 207.h,
                                            child: const Center(
                                                child: PrimaryText(
                                                    text: 'No videos yet')),
                                          )

                                        ///TODO fix the video URL based on the response from the CelebID
                                        : Consumer<BrowseProvider>(
                                            builder: (context, featured, _) {
                                            return SizedBox(
                                              height: 207.h,
                                              child: ListView.separated(
                                                separatorBuilder: (context,
                                                        index) =>
                                                    const SizedBox(width: 20),
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount: featured
                                                    .featuredModel.length,
                                                itemBuilder: ((context,
                                                        index) =>
                                                    CustomContainer2(
                                                        addShadow: false,
                                                        color: theme.background,
                                                        width: 161.w,
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            child: Stack(
                                                              children: [
                                                                SizedBox(
                                                                  height: 207,
                                                                  child: Image.network(
                                                                      '${R.N.imageUrl}${featured.featuredModel[index].profileImagePath}',
                                                                      errorBuilder: (BuildContext context,
                                                                          Object
                                                                              error,
                                                                          StackTrace?
                                                                              stackTrace) {
                                                                    return Image
                                                                        .asset(R
                                                                            .png
                                                                            .image
                                                                            .imgPng);
                                                                  },
                                                                      fit: BoxFit
                                                                          .cover),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          20.0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      PrimaryText(
                                                                          text: R
                                                                              .S
                                                                              .introVideo),
                                                                      const Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Icon(Icons
                                                                              .pause),
                                                                          Icon(Icons
                                                                              .earbuds)
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            )))),
                                              ),
                                            );
                                          }),
                                    30.verticalSpace,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PrimaryText(
                                          text: R.S.review,
                                          fontSize: 24,
                                          color: theme.secondaryTxt,
                                        ),
                                        PrimaryText(
                                          text: R.S.seeAll,
                                          color: theme.secondary,
                                        ).clickable(() {}),
                                      ],
                                    ),
                                    details.celebDetails.data!.fanReviews!
                                            .isEmpty
                                        ? const SizedBox(
                                            height: 200,
                                            child: Center(
                                              child: PrimaryText(
                                                  text: 'No Reviews'),
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              ListView.separated(
                                                separatorBuilder: (context,
                                                        index) =>
                                                    const SizedBox(height: 20),
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                itemCount: details
                                                    .celebDetails
                                                    .data!
                                                    .celebrityReviews!
                                                    .length,
                                                itemBuilder:
                                                    ((context, index) =>
                                                        CustomContainer2(
                                                            width:
                                                                double.infinity,
                                                            color: theme.grey,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      16.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            36.0, // Adjust the size as needed
                                                                        height:
                                                                            36.0, // Adjust the size as needed
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                theme.glassWhite, // Customize the border color
                                                                            width:
                                                                                1.0, // Customize the border width
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            PrimaryText(
                                                                          text: details
                                                                              .celebDetails
                                                                              .data!
                                                                              .celebrityReviews![index]
                                                                              .username!
                                                                              .getInitials(),
                                                                          color:
                                                                              theme.secondary,
                                                                        ).center(),
                                                                      ),
                                                                      12.horizontalSpace,
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          PrimaryText(
                                                                              text: details.celebDetails.data!.celebrityReviews![index].username ?? 'No username'),
                                                                          Row(
                                                                            children: [
                                                                              Image.asset(R.png.star.imgPng),
                                                                              SecondaryText(
                                                                                text: details.celebDetails.data!.celebrityReviews![index].rating.toString(),
                                                                                color: theme.secondary,
                                                                              )
                                                                            ],
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                  12.verticalSpace,
                                                                  PrimaryText(
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    text: details
                                                                            .celebDetails
                                                                            .data!
                                                                            .celebrityReviews![index]
                                                                            .content ??
                                                                        R.S.commentReview,
                                                                    color: theme
                                                                        .primaryText,
                                                                    fontSize:
                                                                        12,
                                                                  )
                                                                ],
                                                              ),
                                                            ))),
                                              ),
                                            ],
                                          ),
                                  ],
                                );
                              }),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        })))
          ],
        );
      }),
      bottomNavigationBar:
          Consumer<BrowseProvider>(builder: (context, details, _) {
        return BottomAppBar(
          child: SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PrimaryButton(
                      width: 114.w,
                      height: 62.h,
                      color: theme.grey.withOpacity(0.5),
                      buttonText: R.S.chat,
                      buttonTextColor: theme.secondary,
                      onPressed: () {}),
                  10.horizontalSpace,
                  PrimaryButton(
                    width: 215.w,
                    height: 62.h,
                    buttonText:
                        'Book Now ${MoneySymbols.ngn} ${details.celebDetails.data!.fee!.bookingFee}',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
