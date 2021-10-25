package media.service;

import media.entity.Media;

import java.util.List;

public interface MediaService {

	 List getMediaList();

	int addMedia(Media media);

    List<Media> getMediaByGroup(int typeid);

	int deleteMedia(String mediatitle);
}
