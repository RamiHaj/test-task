import 'package:test_task/core/models/product_model.dart';
import 'package:test_task/core/services/service_storage.dart';
import 'package:test_task/objectbox.g.dart';

class ProductStorage
{
  Box<ProductElement>? _product;
  ProductStorage()
  {
    StorageService storageService = StorageService.instance;
    _product = storageService.store?.box<ProductElement>();
  }

  void setProduct(ProductElement productElement)
  {
    try
    {
      _product!.put(productElement);
    }on ObjectBoxException catch (_) {
      // CustomToast.showError(CustomError.unKnown);
    }
  }

  void removeProduct(int index)
  {
    try {
      _product!.remove(index);
    } on ObjectBoxException catch (_) {
      // CustomToast.showError(CustomError.unKnown);
    }
  }

  void removeAllProduct()
  {
    try {
      _product!.removeAll();
    } on ObjectBoxException catch (_) {
      // CustomToast.showError(CustomError.unKnown);
    }
  }

  List<ProductElement>? getAllProduct()
  {
    try {
      List<ProductElement> products= _product!.getAll();
      return products;
    } on ObjectBoxException catch (_) {
      // CustomToast.showError(CustomError.unKnown);
      return null;
    }
  }
}