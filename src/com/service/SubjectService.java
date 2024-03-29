package com.service;

import java.io.File;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.entity.Subject;
import com.util.Page;
import com.util.PageResult;

public interface SubjectService {
    //添加试题，如果试题标题已经纯在，就不能添加
    public boolean saveSubject(Subject subject);

    //按照分页信息来查询试题
    public PageResult querySubjectByPage(Page page);

    //查找试题详细信息
    public Subject showSubjectDetail(int subjectID);

    //更新试题信息
    public void updateSubject(Subject subject);

    //删除试题信息
    public void deleteSubject(int subjectID);

    //模糊查询试题信息
    public PageResult likeQueryBySubjectTitle(DetachedCriteria forClass, Page page);

    //随机查询试题信息
    public List<Subject> randomFindSubject(int number, String sclass);

    /**
     * 计算成绩
     *
     * @param subjectIDs     传入的试题id List
     * @param studentAnswers 传入的员工回答 List
     */
    public int accountResult(List<Integer> subjectIDs, String[] studentAnswers);

    //查询试题数量
    public int countSubject();

    //查询到的试题数量
    public int countLikeSubject(DetachedCriteria forClass);

    public List<Subject> getWordSubject(File file, String sclass);

    //获取判断题
    public List<Subject> randomFindJudSubject(int i, String sclass);
}
