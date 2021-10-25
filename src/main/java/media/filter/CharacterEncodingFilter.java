package media.filter;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class CharacterEncodingFilter implements Filter {

    private String characterEncoding;// 字符集
    private String enforce;// 是否强制执行

    /**
     * 1、由tomcat执行，没有请求前
     * 加载实例化过滤器类
     */
    public CharacterEncodingFilter() {
        //System.out.println("字符集过滤器实例！");
    }

    /**
     * 2.初始化过滤器类
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("字符集过滤器初始化！");
        characterEncoding = filterConfig.getInitParameter("characterEncoding");// utf-8
        enforce = filterConfig.getInitParameter("enforce");// true
    }

    /**
     * 3、执行过滤
     * 执行请求和响应
     */
    @Override
    public void doFilter(ServletRequest req, ServletResponse rep, FilterChain chain) throws IOException, ServletException {
        System.out.println("字符集过滤器开始！");
        // 判断是否有参数的设置
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) rep;
        //response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //判断是否cookie记住密码
        Cookie[] cookies = request.getCookies();
        String userName = null, passWord = null;
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("userName")) {
                    userName = c.getValue();
                }
                if (c.getName().equals("passWord")) {
                    passWord = c.getValue();
                }
            }
        }
        if (userName != null && passWord != null) {
            PrintWriter out = response.getWriter();
            out.print("<script type='text/javascript'>location='${pageContext.request.contextPath}/manage/mediamanage.action'</script>");
            out.flush();
        }
        // 过滤器拦截放行
        chain.doFilter(req, rep);
        System.out.println("字符集过滤器放行！");
    }

    /**
     * 4、tomcat停机时执行
     */
    @Override
    public void destroy() {
        System.out.println("字符集过滤器销毁！");
        characterEncoding = null;
        enforce = null;
    }
}
