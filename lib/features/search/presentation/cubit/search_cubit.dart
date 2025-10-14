import 'package:bookia/features/search/data/models/searchresponse/product.dart';
import 'package:bookia/features/search/data/repo/search_repo.dart';
import 'package:bookia/features/search/presentation/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchIntialState());
  List<SearchProductModel> results = [];
  List<SearchProductModel> searchResults = [];
  var SearchController = TextEditingController();
  getAllProducts() async {
    emit(SearchLoadingState());
    var res = await SearchRepo.getAllProducts();

    if (res != null) {
      results = res.data?.products ?? [];
      emit(SearchSucessState());
    } else {
      emit(SearchErrorState());
    }
  }

  searchProduct({required String name}) async {
    emit(SearchLoadingState());
    var res = await SearchRepo.searchProducts(name: name);

    if (res != null) {
      searchResults = res.data?.products ?? [];
      emit(SearchSucessState());
    } else {
      emit(SearchErrorState());
    }
  }
}
