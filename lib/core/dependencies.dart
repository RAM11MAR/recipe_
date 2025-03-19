import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:recipe/data/repositories/chef_repository.dart';
import 'package:recipe/data/repositories/review_repository.dart';

import '../data/repositories/category_repository.dart';
import '../data/repositories/recipe_repository.dart';
import 'client.dart';

final List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
    create: (context) => CategoryRepository(client: context.read()),
  ),
  Provider(
    create: (context) => RecipeRepository(client: context.read()),
  ),
  Provider(
    create: (context) => ChefRepository(client: context.read()),
  ),
  Provider(
    create: (context) => ReviewRepository(client: context.read()),
  ),
];
