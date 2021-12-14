package kr.co.bsa.silage;

import kr.co.bsa.common.Condition;

import java.util.List;

public interface SilageService {
    public void insertSilage(Silage silage, int memberCode);
    public List<Silage> selectSilageList(Condition condition);
    public List<Silage> selectSilage (Silage silage);
    public void updateSilage(Silage silage);
    public void deleteSilage(Silage silage);
}
