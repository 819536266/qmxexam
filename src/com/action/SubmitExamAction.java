package com.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.entity.Scorde;
import com.entity.Student;
import com.entity.Subject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.ScordeService;
import com.service.ScordeServiceImpl;
import com.service.StudentService;
import com.service.StudentServiceImpl;
import com.service.SubjectService;
import com.service.SubjectServiceImpl;

/**
 * 提交试卷，计算分数
 *
 * @author Junchuan.Wu
 */
public class SubmitExamAction extends ActionSupport {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private List<Integer> stID;//考试的题目id
    private SubjectService subjectService = new SubjectServiceImpl();
    private StudentService studentService = new StudentServiceImpl();
    private ScordeService service = new ScordeServiceImpl();
    private List<String[]> stAnswer = new ArrayList<String[]>();

    public List<String[]> getStAnswer() {
        return stAnswer;
    }

    public void setStAnswer(List<String[]> stAnswer) {
        this.stAnswer = stAnswer;
    }

    public List<Integer> getStID() {
        return stID;
    }

    public void setStID(List<Integer> stID) {
        this.stID = stID;
    }

    @SuppressWarnings({"unchecked", "static-access"})
    public String execute() {

        String[] studentAnswers = new String[100];
        for (int i = 0; i < 100; i++) {
            String on = "";
            if (i < stAnswer.size()) {
                if (stAnswer.get(i) != null) {
                    for (String one : stAnswer.get(i)) {
                        if (one != null) {
                            on += one;
                        }
                    }
                }
            }
            studentAnswers[i] = on;
        }

        HttpServletRequest request = ServletActionContext.getRequest();
        Map session = ActionContext.getContext().getSession();
        Student student = (Student) session.get("studentInfo");//获取Session中的员工信息
        if (stID == null || stID.size() <= 0 || student == null) {
            addActionError("没有该部门题目");

            return "error";
        }
		/*for(int i=0;i<100;i++){
			String answer = request.getParameter("stAnswer"+i);//获取每道题的回答
			studentAnswers.add(answer);//加入List中
		}*/
        int score = subjectService.accountResult(stID, studentAnswers);//计算score
        int Sysid = student.getSysid();
        //查询最后的次数
        Scorde Scorde = service.findEndScorde(student);
        Scorde studentScorde = new Scorde();
        if (Scorde != null) {
            //如果次数为0则修改最初次数
            if (Scorde.getCount() == 0) {
                Scorde.setStuSysid(student);
                Scorde.setTesttime(new Date());
                Scorde.setCount(1);
                Scorde.setTimescore(score);
                Scorde.setShorttime(0);
                Scorde.setAssess("0");
                service.updateScorde(Scorde);
            } else {
                studentScorde.setShorttime(0);
                studentScorde.setStuSysid(student);
                studentScorde.setTesttime(new Date());
                studentScorde.setCount(Scorde.getCount() + 1);
                studentScorde.setTimescore(score);
                studentScorde.setAssess("0");
                service.saveScorde(studentScorde);//把成绩保存到数据库中
            }
        } else {
            studentScorde.setShorttime(0);
            studentScorde.setStuSysid(student);
            studentScorde.setTesttime(new Date());
            studentScorde.setCount(Scorde.getCount() + 1);
            studentScorde.setTimescore(score);
            studentScorde.setAssess("0");
            service.saveScorde(studentScorde);
        }
        request.setAttribute("studentName", student.getStudentName());
        request.getSession().setAttribute("score", score);
        request.getSession().setAttribute("studentAnswers", studentAnswers);

        session.put("stIDs", stID);
        //把试题编号保存到Session中，方便下一个页面调用session显示正确的答案和解析

        return this.SUCCESS;
    }

}
