package media.service;

import java.util.List;

public interface HomeService {
    List getPhotoView();

    List getLatestVideo();
    List getLatestPhoto();
    List getTypeList();
    List getStatistic();
    List getSearchList(String searchkey);
    List getAllPhoto();
    List getAllVideo();
}
