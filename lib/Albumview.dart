import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_gallery/viewimage.dart';
import 'Controllers/PhotosController.dart';

class Albumview extends StatelessWidget {
  int albumid;
  Albumview({this.albumid});
  final PhotosController photocontroller = Get.put(PhotosController());
  @override
  Widget build(BuildContext context) {

    print("albumid:$photocontroller");
    return Scaffold(
      appBar: AppBar(title: Text(albumid.toString())),
      body: Center(
        child: Obx(() {
          photocontroller.fetchfilteredphoto(albumid);
          if (photocontroller.isLoading.value)
            return Center(child: CircularProgressIndicator());
          else {
            return GridView.builder(
                itemCount: photocontroller.filteredList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, int i) {
                  // print(i.toString());
                  // print(photocontroller.PhotosList[i].albumId.toString());
                  return Card(
                      child: new InkResponse(
                          child: Image.network(photocontroller.filteredList[i].thumbnailUrl),
                            // child: Text(photocontroller.filteredList[i].title.toString()),
                          onTap: () => Get.to(viewimage(image: photocontroller.filteredList[i].thumbnailUrl))
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
