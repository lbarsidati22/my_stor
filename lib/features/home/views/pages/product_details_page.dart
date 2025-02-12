import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:my_stor/core/model/softagi_response.dart';
import 'package:my_stor/core/utils/app_constants.dart';
import 'package:my_stor/core/utils/theme/app_colors.dart';
import 'package:my_stor/core/views/widgets/main_bottom.dart';

class ProductDetailsPage extends StatelessWidget {
  final Products product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.grey3,
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.grey3,
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    //  Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.favorite_border,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.grey3,
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.share,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.55,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
            ),
            child: FlutterCarousel.builder(
              itemCount: product.images!.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(end: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.fill,
                      imageUrl:
                          product.images?[itemIndex] ?? AppConstants.imageNull,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator.adaptive()),
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
                //  autoPlay: true,
                //  height: size.height * 0.55,
                showIndicator: true,
                slideIndicator: CircularWaveSlideIndicator(
                    slideIndicatorOptions: SlideIndicatorOptions(
                  indicatorBackgroundColor: AppColors.primary3,
                  currentIndicatorColor: AppColors.white,
                )),
              ),
            ),
            // CachedNetworkImage(
            //   // height: size.height * 0.55,
            //   imageUrl: product.image ?? AppConstants.imageNull,
            // ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.55),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.grey3,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        product.name ?? '',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        product.description ?? '',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '\$ ${product.price}',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: MainBottom(
                              height: 50,
                              text: 'Add To Cart',
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
