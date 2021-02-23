import 'package:get/get.dart';
import 'package:getx_gallery/Services/PhotoApi.dart';
import 'package:getx_gallery/Core/Photo.dart';

class PhotosController extends GetxController{

  var isLoading = true.obs;
  var photosList = List<Photo>().obs;
  var filteredList = List<Photo>().obs;
  @override
  void onInit()
  {
    fetchPhotos();
    super.onInit();
  }

  void fetchPhotos() async {
    try {
      isLoading(true);
      var Photo = await PhotosApi().fetchPhotos();
      if(Photo != null){
        photosList.assignAll(Photo);
      }
    }
    finally{
      isLoading(false);
    }
  }
  void fetchfilteredphoto(int i)
  {
    try{
    filteredList.clear();
    for(int j=0;j<photosList.length;j++)
      {
        if(photosList[j].albumId==i)
          {
            filteredList.add(photosList[j]);

          }
      }
  }
  catch (e)
    {
      var abc = e;
    }
  }
}