package media.service;

import media.dao.MediaMapper;
import media.entity.Media;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MediaServiceImpl implements MediaService {

    @Resource
    MediaMapper mediaMapper;

    @Override
    public List getMediaList() {
        return mediaMapper.getMediaList();
    }

    @Override
    public int addMedia(Media media) {

        return mediaMapper.addMedia(media);
    }

    @Override
    public List<Media> getMediaByGroup(int typeid) {
        return mediaMapper.getMediaByGroup(typeid);
    }

    @Override
    public int deleteMedia(String mediatitle) {
        return mediaMapper.deleteMedia(mediatitle);
    }


}
