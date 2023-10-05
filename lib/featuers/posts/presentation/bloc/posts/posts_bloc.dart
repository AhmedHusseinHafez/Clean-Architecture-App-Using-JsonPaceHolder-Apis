import 'package:bloc/bloc.dart';
import 'package:clean_architecture_ttd_jsonplaceholder/featuers/posts/domain/entities/post_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/get_post_usecase.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPosts;
  PostsBloc({required this.getAllPosts}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetPostsEvent) {
        emit(LoadingPostsState());
        final posts = await getAllPosts();
      } else if (event is RefershPostsEvent) {
      } else {}
    });
  }
}
