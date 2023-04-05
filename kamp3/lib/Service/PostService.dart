import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kamp3/DataClass/Post.dart';

class PostService{
 Future<List<Post>?> fetchPostItem()async {
   final Uri base_url=Uri.parse("https://jsonplaceholder.typicode.com/posts");
   final response=await http.get(base_url);

   switch(response.statusCode){
     case HttpStatus.OK:
       final responseBody=jsonDecode(response.body);
       if(responseBody is List){
         return responseBody.map((e) => Post(1,1,"title","body").toList());
       }

   }
 }

}