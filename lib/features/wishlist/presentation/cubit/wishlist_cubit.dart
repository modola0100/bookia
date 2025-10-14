import 'package:bookia/features/wishlist/data/models/wishlistresponse/datum.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListIntialState());
  List<Datum> books = [];
  getWishlist() async {
    emit(WishListLoadingState());
    var res = await WishlistRepo.getWishlist();

    if (res != null) {
      books = res.data?.data ?? [];
      emit(WishListSucessState());
    } else {
      emit(WishListErrorState());
    }
  }

  removeFromWishlist({required int productId}) async {
    emit(WishListLoadingState());
    var res = await WishlistRepo.removeFromtWishlist(productId: productId);

    if (res != null) {
      books = res.data?.data ?? [];
      emit(WishListSucessState());
    } else {
      emit(WishListErrorState());
    }
  }
}
