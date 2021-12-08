package kr.co.bsa.silage;

import kr.co.bsa.account.Account;
import kr.co.bsa.account.AccountMapper;
import kr.co.bsa.common.DateCommand;
import kr.co.bsa.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class SilageServiceImpl implements SilageService {
    @Autowired
    private SilageMapper silageMapper;
    @Autowired
    private AccountMapper accountMapper;

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
    public List<Silage> selectSilageList(DateCommand dateCommand) {
        return silageMapper.selectAll(dateCommand);
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