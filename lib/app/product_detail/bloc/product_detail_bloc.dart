import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/product.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<BuyProduct>((event, emit) {
      //
    });
  }
}
