import 'package:get/get.dart';
import 'package:getx_gallery/Core/Album.dart';
import 'package:getx_gallery/Services/AlbumApi.dart';


class AlbumController extends GetxController{

  var isLoading = true.obs;
  var albumList = List<Album>().obs;
  @override
  void onInit()
  {
    fetchalbums();
    super.onInit();
  }

  void fetchalbums() async {
    try {
      isLoading(true);
      var Album = await AlbumApi().fetchAlbums();
      if(Album != null){
        albumList.assignAll(Album);
      }

    }
    catch (e){
      var abc =e;
    }
    finally{
      isLoading(false);
    }
  }
}