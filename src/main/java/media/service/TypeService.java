package media.service;

import media.entity.Type;

import java.util.List;

public interface TypeService {
	 List getTypelist();

	Type getTypeId(String typename);
}
