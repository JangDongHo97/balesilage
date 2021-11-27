package kr.co.bsa.silage;

import java.util.List;

public interface SilageService {
    public void insertSilage(Silage silage);
    public List<Silage> selectSilageList();
    public Silage selectSilage (Silage silage);
    public void updateSilage(Silage silage);
    public void deleteSilage(Silage silage);
}
