import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player_m/musics/models/Product.dart';

class MusicBloc extends Cubit<List<Product>>{

  MusicBloc() : super([]);

  addProduct(Product product){
    state.add(product);
    emit(List.from(state));
  }

  removeProduct(Product product){
    state.remove(product);
    emit(List.from(state));
  }

  List<Product> getAll(){
    return state;
  }
}