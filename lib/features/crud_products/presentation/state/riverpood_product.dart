import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../domain/entities/isar_products_entity.dart';
import '../controller/product_controller.dart';

GetIt sl = GetIt.instance;

final listProductController =
    StateNotifierProvider<ProductController, AsyncValue<List<LocalProduct>>>(
        (ref) => ProductController(ref));

final isVisibleFabProducts = StateProvider<bool>((ref) => true);
