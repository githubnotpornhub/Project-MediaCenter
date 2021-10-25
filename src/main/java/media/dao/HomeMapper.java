package media.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HomeMapper {
    //��ȡ����ý���ز�
    List getPhotoView();
    List getLatestPhoto();
    List getLatestVideo();
    List getTypeList();
    List getStatistic();
    List getSearchList(String searchkey);
    List getAllPhoto();
    List getAllVideo();
}
