package com.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.dao.SubjectDao;
import com.dao.SubjectDaoImpl;
import com.entity.Subject;
import com.util.Page;
import com.util.PageResult;
import com.util.PageUtil;
import com.util.WordSubject;

public class SubjectServiceImpl implements SubjectService {
    private SubjectDao subjectDao = new SubjectDaoImpl();

    /**
     * 计算成绩
     *
     * @param subjectIDs     传入的试题id List
     * @param studentAnswers 传入的员工回答 List
     */
    @Override
    public int accountResult(List<Integer> subjectIDs, String[] studentAnswers) {
        int score = 0;// 初始化总分为0
        for (int i = 0; i < subjectIDs.size(); i++) {
            Subject subjectByID = subjectDao.findSubjectByID(subjectIDs.get(i));
            //如果獲取提為空,則題目錯誤
            if (subjectByID != null) {
                String rightAnswer = subjectByID.getStAnswer();
                if (rightAnswer != null) {
                    char[] chars = rightAnswer.toCharArray();
                    Arrays.sort(chars);
                    rightAnswer = new String(chars);
                    if (rightAnswer.equals(studentAnswers[i])) {
                        score += 1;
                    }
                }
            }// 通过试题的id得到正确的答案
            //如果為true,則加一分

        }
        return score;
    }

    /**
     * 根据id删除Subject
     */
    @Override
    public void deleteSubject(int subjectID) {
        subjectDao.deleteByID(subjectID);
    }

    /**
     * 模糊查询试题，并且返回分页信息
     */
    @Override
    public PageResult likeQueryBySubjectTitle(DetachedCriteria forClass, Page page) {
        page = PageUtil.createPage(page.getEveryPage(), page.getTotalCount(), page.getCurrentPage());//创建分页信息
        List<Subject> list = subjectDao.likeQueryByTitle(forClass, page);//通过分页信息模糊查询试题
        PageResult result = new PageResult(page, list);//封装好封页信息和记录信息，返回给调用者
        return result;
    }

    /**
     * 根据分页 查询试题
     */
    @Override
    public PageResult querySubjectByPage(Page page) {
        page = PageUtil.createPage(page.getEveryPage(), page.getTotalCount(), page.getCurrentPage());
        List<Subject> list = subjectDao.findSubjectsByPage(page);
        PageResult result = new PageResult(page, list);
        return result;
    }

    /**
     * 随机抽取题库
     *
     * @param number 即数量
     */
    @Override
    public List<Subject> randomFindSubject(int number, String sclass) {
        return subjectDao.randomFindSubjects(number, sclass);
    }

    /**
     * 添加试题，如果试题标题已经纯在，就不能添加
     */
    @Override
    public boolean saveSubject(Subject subject) {
        String title = subject.getStTitle();
        if (title == null || title.equals("")) {
            return false;
        }
        if (subjectDao.findSubjectByTitle(title) == null) {
            //如果试题标题在数据库中没有找到的话，就允许添加
            subjectDao.save(subject);
            return true;
        } else {
            return false;
        }
    }

    /**
     * 根据id，返回Subject对象
     */
    @Override
    public Subject showSubjectDetail(int subjectID) {
        return subjectDao.findSubjectByID(subjectID);
    }

    /**
     * 传入Subject对象
     */
    @Override
    public void updateSubject(Subject subject) {
        subjectDao.update(subject);
    }

    /**
     * 获得subject数量
     */
    @Override
    public int countSubject() {
        return subjectDao.findSubjectCount();
    }

    @Override
    public int countLikeSubject(DetachedCriteria forClass) {
        return subjectDao.findLikeQueryCount(forClass);
    }

    @Override
    public List<Subject> getWordSubject(File file, String sclass) {
        List<Subject> getlistSubject = null;
        try {
            getlistSubject = WordSubject.getlistSubject(file, sclass);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return null;
        }
        return getlistSubject;
    }

    @Override
    public List<Subject> randomFindJudSubject(int i, String sclass) {
        // TODO Auto-generated method stub
        return subjectDao.randomFindJudSubjects(i, sclass);
    }


}
