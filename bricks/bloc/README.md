# BLoC state management feature brick

1. Add `bloc & flutter_bloc` to your pubspec.yaml file
2. Use the brick

```md
feature/
┣ data/
┃ ┣ repository/
┃ ┃ ┗ feature_repository.dart
┃ ┗ data.dart
┣ ui/
┃ ┣ bloc/
┃ ┃ ┣ feature_bloc.dart 
┃ ┃ ┣ feature_event.dart 
┃ ┃ ┗ feature_state.dart 
┃ ┣ view/
┃ ┃ ┣ feature_page.dart 
┃ ┃ ┣ feature_view.dart 
┃ ┃ ┗ view.dart 
┃ ┣ widgets/
┃ ┃ ┣ feature_content.dart 
┃ ┃ ┗ widgets.dart
┃ ┗ ui.dart
┗ feature.dart
```
