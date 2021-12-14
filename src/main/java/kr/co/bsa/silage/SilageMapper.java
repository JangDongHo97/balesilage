package kr.co.bsa.silage;

import kr.co.bsa.common.Condition;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface SilageMapper {
    public void insert(Silage silage);
    public List<Silage> selectAll(Condition condition);
    public List<Silage> selectAll(Map<String, String> condition);
    public List<Silage> select(Silage silage);
    public void update(Silage silage);
    public void delete(Silage silage);
}
