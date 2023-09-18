import 'package:flutter/material.dart';
import 'package:kooha_test/export.dart';

class SeeAllTrending extends StatefulWidget {
  const SeeAllTrending({super.key});

  @override
  State<SeeAllTrending> createState() => _SeeAllTrendingState();
}

class _SeeAllTrendingState extends State<SeeAllTrending> {
  TextEditingController searchController = TextEditingController();

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
                  124.verticalSpace,
                  CustomAppBar(
                      isWidget: true,
                      onBackButtonPressed: () {
                        Navigator.pop(context);
                      },
                      middleOrEndWidget: const PrimaryText(text: 'Trending')),
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
                  ),
                ],
              ),
            ),
            const Line(width: double.infinity),
            Consumer<BrowseProvider>(builder: (context, trending, _) {
              return Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of items per row
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 0.6),
                    itemCount: trending
                        .trendingCelebModel.length, // Total number of items
                    shrinkWrap: true, // Adjust as needed
                    physics:
                        const AlwaysScrollableScrollPhysics(), // Disable scrolling
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomContainer2(
                            width: 170,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                height: 210,
                                child: Image.network(
                                    '${R.N.imageUrl}${trending.trendingCelebModel[index].profileImagePath}',
                                    errorBuilder: (BuildContext context,
                                        Object error, StackTrace? stackTrace) {
                                  return Image.asset(R.png.image.imgPng);
                                }, fit: BoxFit.cover),
                              ),
                            ),
                          ).clickable(() {
                            trending.trendingCelebModel[index].uuid == null
                                ? context
                                    .showInAppNotification('fetching Celeb ID')
                                : context.push(CelebDetails(
                                    id: trending.trendingCelebModel[index].uuid,
                                  ));
                          }),
                          5.verticalSpace,
                          PrimaryText(
                            text: trending.trendingCelebModel[index].fullName ??
                                '',
                            fontSize: 14,
                          ),
                          5.verticalSpace,
                          SecondaryText(
                            text:
                                trending.trendingCelebModel[index].occupation ??
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
                      );
                    },
                  ),
                ),
              );
            })
          ],
        );
      }),
    );
  }
}
