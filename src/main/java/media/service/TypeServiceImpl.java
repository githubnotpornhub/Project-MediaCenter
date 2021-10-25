package media.service;

import media.dao.TypeMapper;
import media.entity.Type;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {

    @Resource
    TypeMapper typeMapper;

    @Override
    public List getTypelist() {
        return typeMapper.getTypelist();
    }

    @Override
    public Type getTypeId(String typename) {
        return typeMapper.getTypeId(typename);
    }


}
