import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:my_stor/core/utils/app_constants.dart';
import 'package:my_stor/core/utils/routes/app_routes.dart';
import 'package:my_stor/core/utils/theme/app_colors.dart';
import 'package:my_stor/features/home/cubit/home_cubit.dart';
import 'package:my_stor/features/home/cubit/home_state.dart';
import 'package:my_stor/features/home/views/widgets/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              bloc: homeCubit,
              buildWhen: (previous, current) =>
                  current is BannersLoaded ||
                  current is BannersLeading ||
                  current is BannersError,
              builder: (context, state) {
                if (state is BannersLeading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is BannersError) {
                  return Center(
                    child: Text(state.message ?? ''),
                  );
                } else if (state is BannersLoaded) {
                  final banners = state.data;
                  return FlutterCarousel.builder(
                    itemCount: banners?.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(end: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            width: double.infinity,
                            fit: BoxFit.fill,
                            imageUrl: banners?[itemIndex].image ??
                                AppConstants.imageNull,
                            placeholder: (context, url) => Center(
                                child: CircularProgressIndicator.adaptive()),
                            errorWidget: (context, url, error) => Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      );
                    },
                    options: FlutterCarouselOptions(
                      enlargeCenterPage: true,
                      //  aspectRatio: 2.4,
                      // autoPlay: true,
                      height: size.height * 0.2,
                      showIndicator: false,
                      slideIndicator: CircularWaveSlideIndicator(),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Categories',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              bloc: homeCubit,
              buildWhen: (previous, current) =>
                  current is CategoryError ||
                  current is CategoryLeading ||
                  current is CategoryLoaded,
              builder: (context, state) {
                if (state is CategoryLeading) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is CategoryError) {
                  return Center(
                    child: Text(state.message ?? ''),
                  );
                } else if (state is CategoryLoaded) {
                  final categories = state.data;
                  return SizedBox(
                    height: size.height * 0.14,
                    child: ListView.separated(
                      itemCount: categories!.length,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return Container(
                          width: size.width * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  height: size.height * 0.09,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      category.image ?? AppConstants.imageNull,
                                ),
                                Text(
                                  maxLines: 1,
                                  category.name ?? '',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Prudact',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              bloc: homeCubit,
              buildWhen: (previous, current) =>
                  current is ProductsError ||
                  current is ProductsLeading ||
                  current is ProductsLoaded,
              builder: (context, state) {
                if (state is ProductsLeading) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is ProductsError) {
                  return Center(
                    child: Text(state.message ?? ''),
                  );
                } else if (state is ProductsLoaded) {
                  final products = state.products;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: products!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: size.height * 0.01,
                      crossAxisSpacing: size.height * 0.014,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      // final productName = product.name;
                      return InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                            AppRoutes.productDetailsRoute,
                          );
                        },
                        child: ProductItem(product: product),
                      );
                    },
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
// @override
// Widget build(BuildContext context) {
//   final productName = "اسم المنتج الطويل جدًا هنا";

//   return Container(
//     width: 200, // حدد العرض المطلوب
//     child: Flexible(
//       child: FittedBox(
//         fit: BoxFit.scaleDown,
//         child: Text(
//           productName,
//           style: TextStyle(
//             fontSize: 16.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     ),
//   );
// }
