package media.service;

import media.dao.HomeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HomeServiceImpl implements HomeService {

    @Resource
    HomeMapper homeMapper;

    @Override
    public List getPhotoView() {
        return homeMapper.getPhotoView();
    }


    @Override
    public List getLatestVideo() {
        return homeMapper.getLatestVideo();
    }

    @Override
    public List getLatestPhoto() {
        return homeMapper.getLatestPhoto();
    }

    @Override
    public List getTypeList() {
        return homeMapper.getTypeList();
    }

    @Override
    public List getStatistic() {
        return homeMapper.getStatistic();
    }

    @Override
    public List getSearchList(String searchkey) {
        return homeMapper.getSearchList(searchkey);
    }

    @Override
    public List getAllPhoto() {
        return homeMapper.getAllPhoto();
    }

    @Override
    public List getAllVideo() {
        return homeMapper.getAllVideo();
    }
}
