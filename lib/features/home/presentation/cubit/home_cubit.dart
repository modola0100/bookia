import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/home/data/models/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:bookia/features/home/data/models/sliders_response/slider.dart';
import 'package:bookia/features/home/data/models/sliders_response/sliders_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/services/local/shared_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeIntialState());
  List<Product>? books;
  List<Sliderr>? sliders;
  getInitData() async {
    emit(HomeLoadingState());

    var results = await Future.wait([
      HomeRepo.getSliders(),
      HomeRepo.getBestSeller(),
    ]);
    var sliderRes = results[0] as SlidersResponse?;
    var bestSellerRes = results[1] as BestSellerResponse?;

    if (sliderRes != null || bestSellerRes != null) {
      sliders = sliderRes?.data?.sliders;
      books = bestSellerRes?.data?.products;
      emit(HomeSucessState());
    } else {
      emit(HomeErrorState());
    }
  }

  addRemoveToWishlist({required int productId}) async {
    emit(HomeLoadingState());
    if (checkifWishlist(productId)) {
      var res = await WishlistRepo.removeFromtWishlist(productId: productId);
      if (res != null) {
        emit(HomeSucessState(message: "Removed From Wishlist"));
      } else {
        emit(HomeErrorState());
      }
    } else {
      var res = await WishlistRepo.addToWishlist(productId: productId);

      if (res != null) {
        emit(HomeSucessState(message: "Added To Wishlist"));
      } else {
        emit(HomeErrorState());
      }
    }
  }

  addToCart({required int productId}) async {
    emit(HomeLoadingState());
    var res = await CartRepo.addToCart(productId: productId);
    if (res != null) {
      emit(HomeSucessState(message: "Added To Cart"));
    } else {
      emit(HomeErrorState());
    }
  }

  bool checkifWishlist(int productId) {
    var cachedWishlist = SharedPref.getWishlist();

    return cachedWishlist?.contains(productId) ?? false;
  }
  bool checkifCart(int productId) {
    var cachedCart = SharedPref.getCart();

    return cachedCart?.contains(productId) ?? false;
  }
}
