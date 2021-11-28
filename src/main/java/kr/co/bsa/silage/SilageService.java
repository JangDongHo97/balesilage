package kr.co.bsa.silage;

import org.springframework.stereotype.Service;

import java.util.List;

public interface SilageService {
    public void insertSilage(Silage silage, int memberCode);
    public List<Silage> selectSilageList();
    public Silage selectSilage (Silage silage);
    public void updateSilage(Silage silage);
    public void deleteSilage(Silage silage);
}
