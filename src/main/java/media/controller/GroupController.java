package media.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import media.entity.Media;
import media.service.MediaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/*分组查看图片并分页*/
@Controller
@RequestMapping("/manage")
public class GroupController {

    @Resource
    MediaService mediaService;

    /*国风分组更多图片*/
    @RequestMapping("/group1list.action")
    public String OneList(Model model, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) {
        PageHelper.startPage(pageNum, 8);//每页数据条数=8
        List<Media> plist = mediaService.getMediaByGroup(1);
        //查看一下是否查到了数据
        for (Media media : plist) {
            System.out.println("=========" + media);
        }
        int i=plist.size();
        PageInfo<Media> pageInfo = new PageInfo<Media>(plist);//把数据放在分页类中
        model.addAttribute("plist", plist);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("size",i);
        return "group/group1list";
    }

    /*虚拟分组更多图片*/
    @RequestMapping("/group2list.action")
    public String SecondList(Model model, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) {
        PageHelper.startPage(pageNum, 8);//每页数据条数=8
        List<Media> plist = mediaService.getMediaByGroup(2);
        //查看一下是否查到了数据
        for (Media media : plist) {
            System.out.println("=========" + media);
        }
        PageInfo<Media> pageInfo = new PageInfo<Media>(plist);//把数据放在分页类中
        model.addAttribute("plist", plist);
        model.addAttribute("pageInfo", pageInfo);
        return "group/group2list";
    }

    /*风景分组更多图片*/
    @RequestMapping("/group3list.action")
    public String ThirdList(Model model, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) {
        PageHelper.startPage(pageNum, 8);//每页数据条数=8
        List<Media> plist = mediaService.getMediaByGroup(3);
        //查看一下是否查到了数据
        for (Media media : plist) {
            System.out.println("=========" + media);
        }
        PageInfo<Media> pageInfo = new PageInfo<Media>(plist);//把数据放在分页类中
        model.addAttribute("plist", plist);
        model.addAttribute("pageInfo", pageInfo);
        return "group/group3list";
    }

    /*壁纸分组更多图片*/
    @RequestMapping("/group4list.action")
    public String FourthList(Model model,@RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) {
        PageHelper.startPage(pageNum, 8);//每页数据条数=8
        List<Media> plist = mediaService.getMediaByGroup(4);
        //查看一下是否查到了数据
        for (Media media : plist) {
            System.out.println("=========" + media);
        }
        PageInfo<Media> pageInfo = new PageInfo<Media>(plist);//把数据放在分页类中
        model.addAttribute("plist", plist);
        model.addAttribute("pageInfo", pageInfo);
        return "group/group4list";
    }

    /*风景分组更多图片*/
    @RequestMapping("/group5list.action")
    public String FifthList(Model model,@RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) {
        PageHelper.startPage(pageNum, 8);//每页数据条数=8
        List<Media> plist = mediaService.getMediaByGroup(5);
        //查看一下是否查到了数据
        for (Media media : plist) {
            System.out.println("=========" + media);
        }
        PageInfo<Media> pageInfo = new PageInfo<Media>(plist);//把数据放在分页类中
        model.addAttribute("plist", plist);
        model.addAttribute("pageInfo", pageInfo);
        return "group/group5list";
    }


}
