import 'package:bloc/bloc.dart';
import 'package:hello_world/model/user.dart';

class UserBloc extends Bloc<int, User> {
  @override
  // TODO: implement initialState
  User get initialState => UninitializedUser();

  @override
  Stream<User> mapEventToState(int event) async* {
    // TODO: implement mapEventToState
    try {
      User user = await User.getUserFromAPI(event);
      yield user;
    } catch (_) {}
  }
}
