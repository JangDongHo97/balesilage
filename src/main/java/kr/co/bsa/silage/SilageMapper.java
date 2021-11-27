package kr.co.bsa.silage;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SilageMapper {
    public void insert(Silage silage);
    public List<Silage> selectAll();
    public Silage select(Silage silage);
    public void update(Silage silage);
    public void delete(Silage silage);
}
