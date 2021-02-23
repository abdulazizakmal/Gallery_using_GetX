import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_gallery/Controllers/AlbumController.dart';
import 'package:getx_gallery/Controllers/PhotosController.dart';
import 'package:getx_gallery/Controllers/thumbnailsController.dart';
import 'Albumview.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatelessWidget {
  // final AlbumController albumcontroller = Get.put(AlbumController());
  final thumnailscontroller thumbnailsController = Get.put(thumnailscontroller());
  // final PhotosController photocontroller = Get.put(PhotosController());
  @override
  Widget build(context) {
    // albumcontroller.fetchalbums();
    return Scaffold(
      appBar: AppBar(title: Text("get_x")),
      body: Center(
        child: Obx(() {
          if (thumbnailsController.isLoading.value)
            return Center(child: CircularProgressIndicator());
          else {
            return GridView.builder(
                itemCount: thumbnailsController.albumList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                      child: new InkResponse(
                        child: Image.network(thumbnailsController.finalList[index].thumbnailUrl),
                        //   child: Text(albumcontroller.albumList[index].id.toString()),
                         onTap: () => Get.to(Albumview(albumid: thumbnailsController.finalList[index].albumId)),
                      )


                  );
                }
            );
          }
        }),
      ),
    );
  }
}