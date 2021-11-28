package kr.co.bsa.silage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SilageServiceImple implements SilageService{
    @Autowired
    private SilageMapper silageMapper;

public class SilageServiceImpl implements SilageService{
    @Override
    @Transactional
    public void insertSilage(Silage silage, int memberCode) {
        if(silage.getUnitPrice() == 0
                || silage.getCount() == 0
                || silage.getWeight() == 0
                || silage.getProductionDate() == null) {
            return;
        } else {
            silage.setSellerCode(memberCode);
            silageMapper.insert(silage);
        }
    }

    @Override
    public List<Silage> selectSilageList() {
        return null;
    }

    @Override
    public Silage selectSilage(Silage silage) {
        return null;
    }

    @Override
    public void updateSilage(Silage silage) {

    }

    @Override
    public void deleteSilage(Silage silage) {

    }
}
