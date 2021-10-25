package media.dao;


import media.entity.Media;
import media.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MediaMapper {
    List<Media> getMediaList();

    int addMedia(Media media);

    List<Media> getMediaByGroup(int typeid);

    int deleteMedia(String mediatitle);
}
