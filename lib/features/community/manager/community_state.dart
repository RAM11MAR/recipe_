part of 'community_cubit.dart';

enum CommunityStatus { idle, loading, error }

@immutable
class CommunityState extends Equatable {
  final CommunityStatus status;
  final String? errorMessage;
  final int selectedIndex;
  final List<CommunityRecipeModel> communityRecipes;

  const CommunityState({
    required this.selectedIndex,
    required this.communityRecipes,
    required this.status,
    this.errorMessage,
  });

  CommunityState copyWith({
    CommunityStatus? status,
    int? selectedIndex,
    List<CommunityRecipeModel>? communityRecipes,
    String? errorMessage,
  }) {
    return CommunityState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      communityRecipes: communityRecipes ?? this.communityRecipes,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, communityRecipes, status, errorMessage];
}
