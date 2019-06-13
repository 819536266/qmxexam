package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.entity.Student;
import com.entity.Subject;
import com.opensymphony.xwork2.ActionSupport;
import com.service.SubjectService;
import com.service.SubjectServiceImpl;

/**
 * 获取随机的题目
 *
 * @author Junchuan.wu
 */
public class GetRandomSubjects extends ActionSupport {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private SubjectService subjectService = new SubjectServiceImpl();

    @SuppressWarnings("static-access")
    public String execute() {
        HttpServletRequest request = ServletActionContext.getRequest();
        Student student = (Student) request.getSession().getAttribute("studentInfo");
        if (student == null || student.getSclass() == null) {
            addActionError("员工未登录");
            return "error";
        }
        //获取选择题
        List<Subject> subjects = subjectService.randomFindSubject(30, student.getSclass());//获取5题
        List<Subject> subjectsjud = subjectService.randomFindJudSubject(70, student.getSclass());
        if(subjects.size()>0&&subjectsjud.size()==0){
           subjects=subjectService.randomFindSubject(100, student.getSclass());//获取5题
        }else if(subjects.size()==0&&subjectsjud.size()>0){
            subjectsjud=subjectService.randomFindSubject(100, student.getSclass());//获取5题
        }

        request.setAttribute("subjectsjud", subjectsjud);
        request.setAttribute("subjects", subjects);
        boolean isMoblie = JudgeIsMoblie(request);
        if (isMoblie) {
            return "studentphone";
        }
        //确定当前页面是答题状态
        return this.SUCCESS;
    }

    public boolean JudgeIsMoblie(HttpServletRequest request) {
        boolean isMoblie = false;
        String[] mobileAgents = {"iphone", "android", "phone", "mobile",
                "wap", "netfront", "java", "opera mobi", "opera mini", "ucweb",
                "windows ce", "symbian", "series", "webos", "sony",
                "blackberry", "dopod", "nokia", "samsung", "palmsource", "xda",
                "pieplus", "meizu", "midp", "cldc", "motorola", "foma",
                "docomo", "up.browser", "up.link", "blazer", "helio", "hosin",
                "huawei", "novarra", "coolpad", "webos", "techfaith",
                "palmsource", "alcatel", "amoi", "ktouch", "nexian",
                "ericsson", "philips", "sagem", "wellcom", "bunjalloo", "maui",
                "smartphone", "iemobile", "spice", "bird", "zte-", "longcos",
                "pantech", "gionee", "portalmmm", "jig browser", "hiptop",
                "benq", "haier", "^lct", "320x320", "240x320", "176x220",
                "w3c ", "acs-", "alav", "alca", "amoi", "audi", "avan", "benq",
                "bird", "blac", "blaz", "brew", "cell", "cldc", "cmd-", "dang",
                "doco", "eric", "hipt", "inno", "ipaq", "java", "jigs", "kddi",
                "keji", "leno", "lg-c", "lg-d", "lg-g", "lge-", "maui", "maxo",
                "midp", "mits", "mmef", "mobi", "mot-", "moto", "mwbp", "nec-",
                "newt", "noki", "oper", "palm", "pana", "pant", "phil", "play",
                "port", "prox", "qwap", "sage", "sams", "sany", "sch-", "sec-",
                "send", "seri", "sgh-", "shar", "sie-", "siem", "smal", "smar",
                "sony", "sph-", "symb", "t-mo", "teli", "tim-", /*"tosh",*/ "tsm-",
                "upg1", "upsi", "vk-v", "voda", "wap-", "wapa", "wapi", "wapp",
                "wapr", "webc", "winw", "winw", "xda", "xda-",
                "Googlebot-Mobile"};
        if (request.getHeader("User-Agent") != null) {
            for (String mobileAgent : mobileAgents) {
                if (request.getHeader("User-Agent").toLowerCase()
                        .indexOf(mobileAgent) >= 0) {
                    isMoblie = true;
                    break;
                }
            }
        }
        return isMoblie;
    }
}
