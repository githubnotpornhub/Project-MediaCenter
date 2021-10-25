package media.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import media.service.TypeService;

import javax.annotation.Resource;
import java.util.List;


@Controller
@RequestMapping("/manage")
public class TypeController {

    @Resource
    TypeService typeService;

    /*显示分类管理页面*/
    @RequestMapping("/typemanage.action")
    public String getUser(Model model) throws Exception {
    	List list=typeService.getTypelist();
    	model.addAttribute("list",list);
    	model.addAttribute("url", "typemanage");
    	return "manage/type_manage";
    }
   
}
