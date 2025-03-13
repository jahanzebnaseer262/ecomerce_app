import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';

import '../../../user_model.dart';

class UserRepository {
  static UserRepository get instance=>Get.find();
  final SupabaseClient supabase = Supabase.instance.client;

//Function to save user data in supabase
  Future<void> saveUserRecord(UserModel user) async {
    try {
      // Convert UserModel to JSON
      final userJson = user.toJson();

      // Insert user record into Supabase
      await supabase.from('users').insert(userJson);


      print('✅ User data saved successfully!');
    } on PostgrestException catch (e) {
      // Handles Supabase database errors
      print('🔥 SupabaseException: ${e.message}');
    } on AuthException catch (e) {
      // Handles Supabase authentication errors
      print('❌ AuthException: ${e.message}');
    } on FormatException catch (e) {
      // Handles invalid data format issues
      print('⚠️ FormatException: ${e.message}');
    } catch (e) {
      // Handles any unknown errors
      print('❌ Unexpected Error: $e');
    }
  }

  //Function to fetch user details on user id
  Future<UserModel?> fetchUserDetails(String userId) async {
    try {
      // Fetch user data from Supabase
      final response = await supabase.from('users').select().eq('id', userId).single(); // Get a single user record

      if (response == null) {
        print('⚠️ User not found!');
        return null;
      }

      // Convert the response to UserModel
      final user = UserModel.fromJson(response);
      print('✅ User data fetched successfully: $user');
      return user;
    } on PostgrestException catch (e) {
      // Handles Supabase database errors
      print('🔥 SupabaseException: ${e.message}');
      return null;
    } on AuthException catch (e) {
      // Handles Supabase authentication errors
      print('❌ AuthException: ${e.message}');
      return null;
    } on FormatException catch (e) {
      // Handles invalid data format issues
      print('⚠️ FormatException: ${e.message}');
      return null;
    } catch (e) {
      // Handles any unknown errors
      print('❌ Unexpected Error: $e');
      return null;
    }
  }

  //Function to update user data in supbase
  Future<bool> updateUserDetails(String userId, Map<String, dynamic> updatedData) async {
    try {
      // Update user data in Supabase
      final response = await supabase
          .from('users')
          .update(updatedData) // Pass the updated fields
          .eq('id', userId); // Match the specific user by ID

      if (response.isEmpty) {
        print('⚠️ User not found or no update was made!');
        return false;
      }

      print('✅ User data updated successfully!');
      return true;
    } on PostgrestException catch (e) {
      // Handles Supabase database errors
      print('🔥 SupabaseException: ${e.message}');
      return false;
    } on AuthException catch (e) {
      // Handles Supabase authentication errors
      print('❌ AuthException: ${e.message}');
      return false;
    } on FormatException catch (e) {
      // Handles invalid data format issues
      print('⚠️ FormatException: ${e.message}');
      return false;
    } catch (e) {
      // Handles any unknown errors
      print('❌ Unexpected Error: $e');
      return false;
    }
  }

  //Update any filed in table
  Future<bool> updateSingleField(String userId, Map<String, dynamic> updatedData) async {
    try {
      // Ensure there's data to update
      if (updatedData.isEmpty) {
        print('⚠️ No data provided for update!');
        return false;
      }

      // Update user data in Supabase
      final response = await supabase
          .from('users')
          .update(updatedData) // Pass the updated field
          .eq('id', userId); // Match the specific user by ID

      if (response.isEmpty) {
        print('⚠️ User not found or no update was made!');
        return false;
      }

      print('✅ User data updated successfully!');
      return true;
    } on PostgrestException catch (e) {
      print('🔥 SupabaseException: ${e.message}');
      return false;
    } on AuthException catch (e) {
      print('❌ AuthException: ${e.message}');
      return false;
    } on FormatException catch (e) {
      print('⚠️ FormatException: ${e.message}');
      return false;
    } catch (e) {
      print('❌ Unexpected Error: $e');
      return false;
    }
  }

  //Function to remove data
  Future<bool> deleteUser(String userId) async {
    try {
      // Delete the user record where 'id' matches the given userId
      final response = await supabase
          .from('users')
          .delete()
          .eq('id', userId);

      if (response.isEmpty) {
        print('⚠️ User not found or already deleted!');
        return false;
      }

      print('✅ User deleted successfully!');
      return true;
    } on PostgrestException catch (e) {
      print('🔥 SupabaseException: ${e.message}');
      return false;
    } on AuthException catch (e) {
      print('❌ AuthException: ${e.message}');
      return false;
    } catch (e) {
      print('❌ Unexpected Error: $e');
      return false;
    }
  }




}
