import 'dart:convert';
import 'package:front_end/model/room.dart';
import 'package:http/http.dart' as http;

class ReadData {

  Future<List<Room>> fetchRoomsByCategory(String category) async {
    final response = await http.get(Uri.parse('http://172.20.88.55:3000/rooms/getRoomsByCategory/$category'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<Room> rooms = (jsonData as List).map((data) => Room.fromJson(data)).toList();
      return rooms;
    } else {
      throw Exception('Failed to fetch rooms by category.');
    }
  }

  Future<void> addToFavorites(int roomId, int userId) async {
    final response = await http.post(Uri.parse('http://192.168.1.7:3000/favorites'), body: {
      'roomId': roomId.toString(),
      'userId': userId.toString(),
    });
    if (response.statusCode != 200) {
      throw Exception('Failed to add to favorites.');
    }
  }

  Future<List<Room>> fetchFavoriteRooms(int userId) async {
    final response = await http.get(Uri.parse('http://192.168.1.7:3000/favorites/$userId/rooms'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<Room> favoriteRooms = (jsonData as List).map((data) => Room.fromJson(data)).toList();
      return favoriteRooms;
    } else {
      throw Exception('Failed to get favorite rooms.');
    }
  }

  Future<void> removeFromFavorites(int roomId, int userId) async {
    final response = await http.delete(Uri.parse('http://192.168.1.7:3000/favorites/$roomId/$userId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to remove from favorites.');
    }
  }


}

 // final Dio _dio = Dio();
  
  // Future<bool> checkUser(String userName, String passWord) async {
  //   try {
  //     var response = await _dio.post(Uri.parse(registration) as String, queryParameters: {
  //       'username': userName,
  //       'password': passWord
  //     });
  //     if (response.statusCode == 200) {
  //       var responseData = response.data;
  //       if (responseData != null) {
  //         return true;
  //       }
  //     }
  //   } catch (err) {
  //     print(err);
  //   }
  //   return false;
  // }