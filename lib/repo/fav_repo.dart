import 'package:bloc_clean_code/model/favourite_item_model.dart';

class FavRepo {
  Future<List<FavouriteItemModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateItem(10));
  }

  List<FavouriteItemModel> _generateItem(int length) {
    return List.generate(
      length,
      (index) => FavouriteItemModel(id: index.toString(), value: "item $index"),
    );
  }
}
