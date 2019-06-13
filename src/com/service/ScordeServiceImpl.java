package com.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.util.Condition;
import com.util.Page;
import org.hibernate.criterion.DetachedCriteria;
import org.jfree.data.category.CategoryDataset;

import com.dao.ScordeDao;
import com.dao.ScordeDaoImpl;
import com.dao.StudentDao;
import com.dao.StudentDaoImpl;
import com.entity.Scorde;
import com.entity.Student;
import com.util.CreateChartServiceImpl;

public class ScordeServiceImpl implements ScordeService {

    private ScordeDao dao = new ScordeDaoImpl();
    private StudentDao studentdao = new StudentDaoImpl();

    @Override
    public Scorde findEndScorde(Student student) {
        Scorde scorde = dao.findEndScorde(student);
        return scorde;
    }

    @Override
    public void saveScorde(Scorde studentScorde) {
        dao.saveScorde(studentScorde);
    }

    //根据部门查询所有员工,显示最后一次成绩柱状图
    @Override
    public String selectBySclass(Condition forClass, String sclass, String trem) {
        //查询员工
        List<Scorde> list = studentdao.findStudentsByPage(forClass,null);

        CreateChartServiceImpl pm = new CreateChartServiceImpl();
        //设置图片名字
        String jfree = UUID.randomUUID() + ".jpg";

        if (list.size() > 0) {
            String[] rowKeys = {"员工成绩图"};
            //参数
            double[][] data = new double[1][list.size()];
            String[] columnKeys = new String[list.size()];
            int i = 0;
            for (Scorde scorde : list) {
                Integer result = scorde.getTimescore();
                //如果成绩为null,设置为0
                if (result == null) {
                    result = 0;
                }
                data[0][i] = result.doubleValue();
                String studentName = scorde.getStuSysid().getStudentName();
                Integer n = 1;
                //如果有名字一样的,拼接字符
                for (String string : columnKeys) {
                    if (string != null) {
                        if (string.equals(studentName)) {
                            studentName = studentName + "(" + n.toString() + ")";
                            n++;
                        }
                    }
                }
                columnKeys[i] = studentName;
                i++;
            }

            CategoryDataset dataset = pm.getBarData(data, rowKeys, columnKeys);
            int columnCount = dataset.getColumnCount();
            try {
                if (trem == null) {
                    pm.createBarChart(dataset, sclass + "成绩柱状图", "分数", "", jfree);
                } else {
                    pm.createBarChart(dataset, sclass + trem + "成绩柱状图", "分数", "", jfree);
                }
            } catch (IOException e) {
                return null;
            }
        } else {
            return null;
        }

        return jfree;
    }

    @Override
    public void updateScorde(Scorde studentScorde) {
        dao.updateScorde(studentScorde);

    }

    @Override
    public void deleteScorde(Scorde scorde) {
        dao.deleteScorde(scorde);
    }
}
