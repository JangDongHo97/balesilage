package kr.co.bsa.silage;

import kr.co.bsa.common.Condition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SilageServiceImpl implements SilageService {
    @Autowired
    private SilageMapper silageMapper;

    @Override
    @Transactional
    public void insertSilage(Silage silage, int memberCode) {
        if (silage.getUnitPrice() == 0
                || silage.getCount() == 0
                || silage.getWeight() == 0
                || silage.getProductionDate() == null) {
            return;
        } else {
            silage.setSellerCode(memberCode);
            silageMapper.insert(silage);

            return;
        }
    }

    @Override
    @Transactional
    public List<Silage> selectSilageList(Condition condition) {
        return silageMapper.selectAll(condition);
    }


    @Override
    @Transactional
    public List<Silage> selectSilage(Silage silage) {
        return silageMapper.select(silage);
    }

    @Override
    @Transactional
    public void updateSilage(Silage silage) {
        silageMapper.update(silage);
    }

    @Override
    @Transactional
    public void deleteSilage(Silage silage) {
        silageMapper.delete(silage);
    }
}