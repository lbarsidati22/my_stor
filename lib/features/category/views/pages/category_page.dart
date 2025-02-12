import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_stor/core/utils/app_constants.dart';
import 'package:my_stor/features/home/cubit/home_cubit.dart';
import 'package:my_stor/features/home/model/category_model.dart';

class CategoryPage extends StatelessWidget {
  final CategoryData categoryData;
  const CategoryPage({
    super.key,
    required this.categoryData,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${categoryData.name}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Container(
        height: size.height * 0.7,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CachedNetworkImage(
                fit: BoxFit.cover,
                height: size.height * 0.6,
                imageUrl: categoryData.image ?? AppConstants.imageNull,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Text(
                  categoryData.name ?? '',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
