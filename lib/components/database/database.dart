import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

class UserDatabase {
  List usersList = [];
  List posts = [];

  final _myBox = Hive.box('userBox');

  void init() {
    loadUsers();
    loadPosts();
  }

  void loadUsers() {
    fetchUsers();
    usersList = _myBox.get('USERLIST', defaultValue: usersList);
  }

  void loadPosts() {
    fetchPosts();
    posts = _myBox.get('POSTS', defaultValue: posts);
  }

  void updateUpdateUserList() {
    _myBox.put('USERLIST', usersList);
  }

  void updatePosts() {
    _myBox.put('POSTS', posts);
  }

  void addUser(user) {
    usersList.add(user);
    updateUpdateUserList();
  }

  void addPost(post) {
    posts.add(post);
    updatePosts();
  }

  void removeUser(user) {
    usersList.remove(user);
    updateUpdateUserList();
  }

  void removePost(post) {
    posts.remove(post);
    updatePosts();
  }

  void updateUser(user, index) {
    usersList[index] = user;
    updateUpdateUserList();
  }

  void updatePost(post, index) {
    posts[index] = post;
    updatePosts();
  }

  Future<void> fetchUsers() async {
    const url = 'https://jsonplaceholder.typicode.com/users';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        data.forEach((item) {
          addUser(item);
        });
      } else {
        throw Exception('Failed to fetch data from the server');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchPosts() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        data.forEach((item) {
          addPost(item);
        });
      } else {
        throw Exception('Failed to fetch data from the server');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
