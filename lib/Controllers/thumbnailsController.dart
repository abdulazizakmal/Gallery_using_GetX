

import 'package:get/get.dart';
import 'package:getx_gallery/Core/Album.dart';
import 'package:getx_gallery/Core/Photo.dart';
import 'package:getx_gallery/Services/AlbumApi.dart';
import 'package:getx_gallery/Services/PhotoApi.dart';

class thumnailscontroller extends GetxController{
  var isLoading = true.obs;
  var photosList = List<Photo>().obs;
  var albumList = List<Album>().obs;
  var finalList =List<Photo>().obs;

  @override
  void onInit() {
    fetchthumbnails();
    super.onInit();
  }

  void finallist(List<Album> album, List<Photo> photos)
  {

    int j=0;
    for(int i=0;j<album.length;i++)
    {
      print(i);
      if(photos[i].albumId == album[j].id )
      {

        finalList.add(photos[i]);
        j++;

      }
    }
  }
  void fetchthumbnails() async
  {
    try{
      isLoading(true);
      var Photo = await PhotosApi().fetchPhotos();
      if(Photo != null){
        photosList.assignAll(Photo);
      }
      var Album = await AlbumApi().fetchAlbums();
      if(Album != null){
        albumList.assignAll(Album);
      }
      finallist(albumList, photosList);

    }
    finally{
      isLoading(false);
    }
  }
}