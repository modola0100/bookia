import 'package:bookia/features/cart/data/models/cart_response/cart_response.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartIntialState());
  CartResponse? cartResponse;
  String? selectedGovernment;
  List<dynamic> governments = [];
  int selectedGovernmentId = 0;
  var formkey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var governmentController = TextEditingController();
  getCart() async {
    emit(CartLoadingState());
    var res = await CartRepo.getCart();

    if (res != null) {
      cartResponse = res;
      emit(CartSucessState());
    } else {
      emit(CartErrorState());
    }
  }

  removeFromCart({required int cartItemId}) async {
    emit(CartLoadingState());
    var res = await CartRepo.removeFromCart(cartItemId: cartItemId);

    if (res != null) {
      cartResponse = res;
      emit(CartSucessState());
    } else {
      emit(CartErrorState());
    }
  }

  updateCart({required int cartItemId, required int quantity}) async {
    var res = await CartRepo.updateCart(
      cartItemId: cartItemId,
      quantity: quantity,
    );

    if (res != null) {
      cartResponse = res;
      emit(CartSucessState());
    } else {
      emit(CartErrorState());
    }
  }

  placeOrder() async {
    var res = await CartRepo.placeOrder(
      email: emailController.text,
      govId: selectedGovernmentId,
      government: governmentController.text,
      name: fullNameController.text,
      phone: phoneController.text,
    );

    if (res != null) {
      cartResponse = res;
      emit(CartSucessState());
    } else {
      emit(CartErrorState());
    }
  }

  getGovernments() async {
    var res = await CartRepo.getGovernments();

    if (res != null) {
      governments = res.data ?? [];
      emit(CartGovernmentsLoadedState());
    } else {
      emit(CartErrorState());
    }
  }
}
