package media.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import media.entity.Media;
import media.entity.Type;
import media.entity.User;
import media.service.HomeService;
import media.service.TypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import media.service.MediaService;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/manage")
public class MediaController {

    @Resource
    MediaService mediaService;
    @Resource
    TypeService typeService;
    @Resource
    HomeService homeService;

    /*显示媒体管理界面(展示所有类型资源)*/
    @RequestMapping("/mediamanage.action")
    public String mediaManage(Model model, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) throws Exception {
        //分页
//        PageHelper.startPage(pageNum, 3);
//        List list = mediaService.getMediaList();
//        PageInfo pageInfo = new PageInfo(list);
//        model.addAttribute("pageInfo", pageInfo);
//        model.addAttribute("url", "mediamanage");

        PageHelper.startPage(pageNum, 5);//每页数据条数=5
        //查询数据
        List<Media> list = mediaService.getMediaList();
        //查看一下是否查到了数据
        for (Media media : list) {
            System.out.println("=========" + media);
        }
        PageInfo<Media> pageInfo = new PageInfo<Media>(list);//把数据放在分页类中
        //封装数据
        model.addAttribute("list", list);
        //传分页类
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("Mediatype", "mediamanage");//加入url中在翻页时作为参数进行拼接
        model.addAttribute("all","selected");//加入下拉列表中作为属性展示选中(我可真是个天才哈哈)
        return "manage/media_manage";
    }

    /*管理页面只展示图片资源或视频资源*/
    @ResponseBody
    @RequestMapping("/selecttype.action")
    public String selectType(@RequestParam(value = "Mediatype", defaultValue = "All") String Mediatype) {
        if (Mediatype.equals("All")) {
            return "All";
        } else if (Mediatype.equals("P")) {
            return "P";
        }
        return "V";
    }

    /*管理页面只展示图片*/
    @RequestMapping("/photomanage.action")
    public String photoManage(Model model, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) {
        PageHelper.startPage(pageNum, 5);//每页数据条数=5
        List<Media> list = homeService.getAllPhoto();
        for (Media media : list) {
            System.out.println("=========" + media);
        }
        PageInfo<Media> pageInfo = new PageInfo<Media>(list);//把数据放在分页类中
        model.addAttribute("list", list);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("Mediatype", "photomanage");
        model.addAttribute("photo","selected");
        return "manage/media_manage";
    }

    /*管理页面只展示视频*/
    @RequestMapping("/videomanage.action")
    public String videoManage(Model model, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) {
        PageHelper.startPage(pageNum, 5);//每页数据条数=5
        List<Media> list = homeService.getAllVideo();
        for (Media media : list) {
            System.out.println("=========" + media);
        }
        PageInfo<Media> pageInfo = new PageInfo<Media>(list);//把数据放在分页类中
        model.addAttribute("list", list);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("Mediatype", "videomanage");
        model.addAttribute("video","selected");
        return "manage/media_manage";
    }

    /*跳转到资源上传页面*/
    @RequestMapping("/upload.action")
    public String upload() {
        return "upload";
    }

    /*上传资源*/
    @RequestMapping("/doupload.action")
    public String doUpload(Model model,
                           @RequestParam("uploadfile") List<MultipartFile> uploadfile,
                           @RequestParam(value = "mediatitle", defaultValue = "") String mediatitle,
                           @RequestParam(value = "typename", defaultValue = "") String typename,
                           @RequestParam(value = "description", defaultValue = "") String description,
                           @RequestParam(value = "optionsRadios", defaultValue = "") String Mediatype,
                           HttpServletRequest request) throws ParseException {
        //判断上传文件是否存在
        if (!uploadfile.isEmpty() && uploadfile.size() > 0) {
            //遍历上传文件
            for (MultipartFile file : uploadfile) {
                //获取上传文件的原始名
                String originalFilename = file.getOriginalFilename();

                Media media = new Media();

                //设置上传文件的保存目录(保存到本项目相对路径下)
                //将视频和图片分开放置
                if (Mediatype.equals("V")) {
                    String vloc = "/images/video/";
                    String vdirPath = request.getServletContext().getRealPath(vloc);
                    File vfilePath = new File(vdirPath);
                    //如果保存文件的目录不存在。则先创建目录
                    if (!vfilePath.exists()) {
                        vfilePath.mkdirs();
                    }
                    //获取当前时间
                    Date date = new Date();
                    Timestamp timestamp = new Timestamp(date.getTime());

                    //若文件名过长，截取后16位，保证文件后缀名存在
                    String newFilename = originalFilename;
                    if (originalFilename.length() > 16) {
                        newFilename = originalFilename.substring(originalFilename.length() - 16);
                    }
                    //若用户没有给资源命名则使用文件原名
                    if (mediatitle.equals("")) {
                        media.setMediatitle(newFilename);
                    } else {
                        media.setMediatitle(mediatitle);
                    }
                    //通过分组名获取分组对应id
                    Type type = typeService.getTypeId(typename);
                    Integer i = type.getTypeid();
                    media.setTypeid(i);
                    media.setUploaddate(timestamp);
                    media.setDescription(description);
                    media.setMediatype(Mediatype);
                    media.setMediaurl(vloc.concat(newFilename));

                    mediaService.addMedia(media);
                    System.out.println("上传了" + uploadfile.size() + "份文件");

                    try {
                        //使用MultipartFile接口的方法将文件上传到指定位置
                        file.transferTo(new File(vdirPath + newFilename));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
                    //存放图片文件
                    String loc = "/images/photo/";
                    String dirPath = request.getServletContext().getRealPath(loc);
                    //String dirPath = ("/images/");
                    File filePath = new File(dirPath);
                    //如果保存文件的目录不存在。则先创建目录
                    if (!filePath.exists()) {
                        filePath.mkdirs();
                    }
                    //使用通用唯一标识uuid重新命名上传的文件（上传人_uuid_原始文件名称）
//                String newFilename = name + "_" + UUID.randomUUID() + "_" + originalFilename;

                    //获取当前时间
                    //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 格式化时间
                    //sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
                    Date date = new Date();// 获取当前时间
                    // System.out.println("现在时间：" + sdf.format(date)); // 输出已经格式化的现在的时间
                    // String time = sdf.format(date);
                    //Date nowdate = sdf.parse(time);//将String转换成Date类型
                    Timestamp timestamp = new Timestamp(date.getTime());

                    //若文件名过长，截取后16位，保证文件后缀名存在
                    String newFilename = originalFilename;
                    if (originalFilename.length() > 16) {
                        newFilename = originalFilename.substring(originalFilename.length() - 16);
                    }
                    //若用户没有给资源命名则使用文件原名
                    if (mediatitle.equals("")) {
                        media.setMediatitle(newFilename);
                    } else {
                        media.setMediatitle(mediatitle);
                    }
                    Type type = typeService.getTypeId(typename);
                    Integer i = type.getTypeid();
                    media.setTypeid(i);
                    media.setUploaddate(timestamp);
                    media.setDescription(description);
                    media.setMediatype(Mediatype);
//              media.setMediaurl(dirPath.concat(newFilename));
                    media.setMediaurl(loc.concat(newFilename));

                    mediaService.addMedia(media);
                    System.out.println("上传了" + uploadfile.size() + "份文件");

                    try {
                        //使用MultipartFile接口的方法将文件上传到指定位置
                        file.transferTo(new File(dirPath + newFilename));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            //跳转到当前页面
            model.addAttribute("tips", uploadfile.size() + "份文件上传成功了");
            return "upload";
        } else {
            //提示上传失败
            model.addAttribute("tips", "上传失败了");
            return "upload";
        }
    }

    /*在媒体管理页面删除资源*/
    @ResponseBody
    @RequestMapping("/delete.action")
    public String deleteResources(@RequestParam(value = "mediatitle", defaultValue = "") String mediatitle) {
        int i = mediaService.deleteMedia(mediatitle);
        if (i > 0) {
            return "success";
        }
        return "failed";
    }
}
