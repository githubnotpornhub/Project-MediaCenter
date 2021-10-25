package media.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import media.entity.Media;
import media.entity.User;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import media.service.HomeService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {

    @Resource
    HomeService homeService;


    /*登录后返回的首页*/
    @RequestMapping("/index.action")
    public String getNewMedia(Model model, HttpServletRequest request) throws Exception {
        List plist = homeService.getLatestPhoto();
        model.addAttribute("plist", plist);
        List vlist = homeService.getLatestVideo();
        model.addAttribute("vlist", vlist);
        return "index";
    }

    /*放大查看图片*/
    @RequestMapping("/photoview.action")
    public String photoView(Model model, String mediaid) throws Exception {
        List plist = homeService.getPhotoView();
        model.addAttribute("plist", plist);
        model.addAttribute("mediaid", mediaid);
        return "photo_view";
    }

    /*查看全部图片*/
    @RequestMapping("/photolist.action")
    public String photoList(Model model, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) throws Exception {
        PageHelper.startPage(pageNum, 8);//每页数据条数=8
        List<Media> plist = homeService.getAllPhoto();
        //查看一下是否查到了数据
        for (Media media : plist) {
            System.out.println("=========" + media);
        }
        PageInfo<Media> pageInfo = new PageInfo<Media>(plist);//把数据放在分页类中
        model.addAttribute("plist", plist);//封装数据
        model.addAttribute("pageInfo", pageInfo);//传分页类
        return "photo_list";
    }

    /*查看全部视频*/
    @RequestMapping("/videolist.action")
    public String videoList(Model model, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) throws Exception {
        PageHelper.startPage(pageNum, 6);//每页数据条数=8
        List<Media> vlist = homeService.getAllVideo();
        //查看一下是否查到了数据
        for (Media media : vlist) {
            System.out.println("=========" + media);
        }
        PageInfo<Media> pageInfo = new PageInfo<Media>(vlist);//把数据放在分页类中
        model.addAttribute("vlist", vlist);
        model.addAttribute("pageInfo", pageInfo);//传分页类
        return "video_list";
    }

    /*按分组查看资源*/
    @RequestMapping("/typelist.action")
    public String typeList(Model model) throws Exception {
        List list = homeService.getTypeList();
        model.addAttribute("list", list);
        return "type_list";
    }

    /*查看资源数量统计*/
    @RequestMapping("/statistic.action")
    public String statistic(Model model) throws Exception {
        List list = homeService.getStatistic();
        model.addAttribute("list", list);
        return "statistic_list";
    }

    /*按关键字搜索资源*/
    @RequestMapping("/search.action")
    public String search(Model model, String searchkey, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) throws Exception {
        PageHelper.startPage(pageNum, 16);//每页数据条数=16
        List<Media> plist = homeService.getSearchList(searchkey);//模糊查询分页不会写，点击下一页传回的searchkey为null会返回空集合
        for (Media media : plist) {
            System.out.println("=========" + media);
        }
        if (plist.size() == 0) {
            model.addAttribute("tips", "抱歉,没有你当前搜索的 " + searchkey + " 相关的资源");
        }
        PageInfo<Media> pageInfo = new PageInfo<Media>(plist);//把数据放在分页类中
        model.addAttribute("plist", plist);//封装数据
        model.addAttribute("pageInfo", pageInfo);//传分页类
        model.addAttribute("searchkey",searchkey);//将查询的关键字保存在url中
        return "search_list";

    }

}
