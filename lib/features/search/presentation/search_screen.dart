import 'package:bookia/components/inputs/custom_search_field.dart';
import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/features/home/presentation/widgets/book_card.dart';
import 'package:bookia/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookia/features/search/presentation/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit()..getAllProducts(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: GestureDetector(
              onTap: () {
                pop(context);
              },
              child: SvgPicture.asset(AppIcons.backSvg),
            ),
            centerTitle: false,
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(22),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  customSearchfield(
                    controller: context.read<SearchCubit>().SearchController,
                    onChanged: (p0) {
                      context.read<SearchCubit>().searchProduct(name: p0);
                    },
                  ),
                  Gap(15),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      var cubit = context.read<SearchCubit>();
                      if (state is! SearchSucessState) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      final list = cubit.SearchController.text.isEmpty
                          ? cubit.results
                          : cubit.searchResults;
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 290,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) {
                          return book_card(book: list[index].mapToProduct());
                        },
                        itemCount: list.length,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
