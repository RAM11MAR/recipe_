import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/data/models/category_model.dart';
import 'package:recipe/data/repositories/category_repository.dart';

part 'categories_state.dart';

class CategoriesEvent {}

class CategoriesLoading extends CategoriesEvent {

}

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({required CategoryRepository catRepo})
      : _catRepo = catRepo,
        super(CategoriesState(categories: [], mainCategory: null, status: CategoriesStatus.loading)) {
    on<CategoriesLoading>(load);
    add(CategoriesLoading());
  }

  final CategoryRepository _catRepo;

  Future<void> load(CategoriesLoading event, Emitter<CategoriesState> emit) async {
    final allCategories = await _catRepo.fetchCategories();
    emit(
      CategoriesState(
        categories: allCategories.where((category) => !category.isMain).toList(),
        mainCategory: allCategories.firstWhere((category) => category.isMain),
        status: CategoriesStatus.idle,
      ),
    );
  }
}
