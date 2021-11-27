package kr.co.bsa.silage;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.ModelAndView;

public class SilageController {

    //forward /WEB-INF/jsp/silage/add.jsp
    @GetMapping("/silages/form")
    public ModelAndView enrollSilage() {
        return null;
    }

    //redirect /bsa/silages
    @PostMapping("/silages")
    public ModelAndView enrollSilage(Silage silage) {
        return null;
    }

    //forward /WEB-INF/jsp/silage/mySilage.jsp
    @GetMapping("/searchMySilage")
    public ModelAndView searchMySilage() {
        return null;
    }

    //forward /WEB-INF/jsp/silage/main.jsp
    @GetMapping("/silages")
    public ModelAndView searchSilageList() {
        return null;
    }

    //forward /WEB-INF/jsp/silage/view.jsp
    @GetMapping("/silages/{silageCode}")
    public ModelAndView searchSilage(Silage silage) {
        return null;
    }

    //forward /WEB-INF/jsp/silage/edit.jsp
    @GetMapping("/silages/{silageCode}/form")
    public ModelAndView editSilageForm(Silage silage) {
        return null;
    }

    //redirect /bsa/silages
    @PutMapping("/silages")
    public ModelAndView editSilage(Silage silage) {
        return null;
    }

    //redirect /bsa/silages
    @DeleteMapping("/silages")
    public ModelAndView removeSilage(Silage silage) {
        return null;
    }
}
