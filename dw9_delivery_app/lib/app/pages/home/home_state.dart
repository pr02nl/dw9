import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  const HomeState({
    required this.status,
    required this.products,
    this.errorMessage,
  });
  const HomeState.initial()
      : this(status: HomeStateStatus.initial, products: const []);
  @override
  List<Object?> get props => [status, products, errorMessage];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
