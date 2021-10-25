package media.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/verify")
public class VerifyController {

    /*获取新的验证码*/
    @RequestMapping(value="/getverifycode.action")
    public void generate(HttpServletResponse response ,HttpSession session) {
        ByteArrayOutputStream  output = new ByteArrayOutputStream();
        @SuppressWarnings("unused")
        String verifyCodeValue = drawImg(output);
        session.setAttribute("verifyCodeValue", verifyCodeValue);
        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 绘画验证码
     * @param output
     * @return
     */

    private String drawImg(ByteArrayOutputStream output) {
        String code = "";
        for(int i = 0;i< 4;i++) {
            code+= randomChar();
        }
        int width = 70;
        int height = 35;
        BufferedImage bi = new BufferedImage(width, height,BufferedImage.TYPE_USHORT_555_RGB);
        Font font = new Font("Times new Roman", Font.PLAIN, 20);
        //调用Graphics2d绘画验证码
        Graphics2D g = bi.createGraphics();
        g.setFont(font);
        Color color = new Color(0,0,205);
        g.setColor(color);
        g.setBackground(new Color(255,255,224));
        g.clearRect(0,0, width, height);
        FontRenderContext context = g.getFontRenderContext();
        Rectangle2D bounds = font.getStringBounds(code, context);
        double x = (width - bounds.getWidth())/2;
        double y = (height - bounds.getHeight())/2;
        double ascent = bounds.getY();
        //干扰线
        Random random = new Random();
        for(int i=0;i<8;i++){
            int x1=random.nextInt(width);
            int y1=random.nextInt(height);
            int x2=random.nextInt(width);
            int y2=random.nextInt(height);
            g.drawLine(x1, y1, x1+x2, y1+y2);
        }
        @SuppressWarnings("unused")
        double daseY = y - ascent;
        g.drawString(code, (int)x, 20);
        g.dispose();
        try {
            ImageIO.write(bi, "jpg", output);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return code;
    }

    /**
     * 随机字符生成
     * @return
     */
    private char randomChar() {
        Random r = new Random();
        String s = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        return s.charAt(r.nextInt(s.length()));
    }

//    @RequestMapping(value="/quanxian/login.action",method=RequestMethod.POST)
//    @ResponseBody
//    public Result<String> login(HttpServletRequest request ,HttpSession session ) {
//        ModelAndView model = new ModelAndView();
//        String inputVerfiCode = request.getParameter("verifyCode");
//        String username = request.getParameter("username");
//        String pwd = request.getParameter("pwd");
//        System.out.println("验证码的值：=====:"+inputVerfiCode);
//        String verifyCodeValue = (String) session.getAttribute("verifyCodeValue");
//        System.out.println("session中的 验证码的值："+verifyCodeValue);
//        if(pwd.equals(us.findUserByPhone(phone).getPwd())&&(verifyCodeValue.equals(inputVerfiCode.toUpperCase()))){
//            return new Result<String>(true, "输入验证ok", null) ;
//        }else {
//            return new Result<String>(false, "输入验证码不正确", null) ;
//        }
//
//    }
//
//
//    //注册
//    @RequestMapping(value="/quanxian/reg")
//    public String  Newreg(Model md,HttpServletRequest req,HttpServletResponse resp)
//            throws IOException{
//
//        return "/quanxian/reg";
//    }
//
//
//    @RequestMapping(value="/quanxian/comparecode" ,method = RequestMethod.POST)
//    public ModelAndView comparecode(@RequestParam(value="code") String code,@RequestParam(value="pwd") String pwd,@RequestParam(value="repwd") String repwd,User pmodel,HttpServletRequest request){
//        ModelAndView model = new ModelAndView();
//        //从session中比对发送的验证码
//        HttpSession  session = request.getSession();//设置session
//        String sessioncode =(String) session.getAttribute("code");
//        System.out.println(sessioncode+"==========session中的code值");
//        if((code).equals(sessioncode)&&pwd.equals(repwd)){//比对缓存
//            //注册
//            pmodel.setPwd(pwd);
//            //us.registUser(pmodel);
//            model.addObject("result", "注册成功,请登录");
//            model.setViewName("/quanxian/login");
//        }else{
//            model.addObject("pwd", "确认密码与输入密码不一致！");
//            model.addObject("result", "验证码不正确 ，注册失败");
//            model.setViewName("/quanxian/reg");
//
//        }
//        return model;
//
//    }
}
