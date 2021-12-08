package kr.co.bsa.silage;

import kr.co.bsa.common.DateCommand;

import java.util.List;

public interface SilageService {
    public void insertSilage(Silage silage, int memberCode);
    public List<Silage> selectSilageList(DateCommand dateCommand);
    public List<Silage> selectSilage (Silage silage);
    public void updateSilage(Silage silage);
    public void deleteSilage(Silage silage);
}
