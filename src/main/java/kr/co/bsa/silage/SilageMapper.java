package kr.co.bsa.silage;

import java.util.List;

public interface SilageMapper {
    public void insert(Silage silage);
    public List<Silage> selectAll();
    public Silage select(Silage silage);
    public void update(Silage silage);
    public void delete(Silage silage);
}
