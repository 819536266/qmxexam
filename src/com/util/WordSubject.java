package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;

import com.entity.Subject;

public class WordSubject {
    public static List<Subject> getlistSubject(File file, String sclass) throws FileNotFoundException, IOException {
        List<Subject> list = null;
        XWPFDocument doc = new XWPFDocument(new FileInputStream(file));
        XWPFParagraph[] paragraphs = doc.getParagraphs();
        // 判断是非是数字
        // 判断是否是英文
        String regex = ".*[a-zA-z].*";
        Pattern pattern1 = Pattern.compile(regex);
        list = new ArrayList<Subject>();
        String timu = null;
        int noxiaci = 0;
        Subject subject = new Subject();
        for (int i = 0; i < paragraphs.length; i++) {
            subject.setSclass(sclass);

            String trim2 = null;
            // 标题下一行
            if (i < paragraphs.length - 1) {
                String text1 = paragraphs[i + 1].getText();
                trim2 = text1.trim();
                noxiaci = trim2.indexOf("、");
            }
            // 标题
            String text = paragraphs[i].getText();
            String trim = text.trim();
            // 判断题目是否全
            if (!trim.isEmpty()) {
                //判断第一个是否为*
                if ("*".equals(trim.substring(0, 1))) {
                    //判断后几个是否为****,是的话是题目
                    if (trim.length() >= 5 && "***".equals(trim.substring(1, 4))) {
                        if (timu == null || "".equals(timu)) {
                            if (!"".equals(trim2)) {
                                //判断下一行是不是*,是的话就拼接,不是就存入对象
                                if (!"*".equals(trim2.substring(0, 1))) {
                                    String trim3 = text.substring(1).trim();
                                    int indexOf = trim3.indexOf("、");
                                    subject.setStTitle(trim3.substring(indexOf + 1));
                                    timu = null;
                                    continue;
                                } else {
                                    timu = text.substring(1).trim();
                                    continue;
                                }
                            } else {
                                String trim3 = text.substring(1).trim();
                                int indexOf = trim3.indexOf("、");
                                subject.setStTitle(trim3.substring(indexOf + 1));
                            }

                        } else {
                            if (!"".equals(trim2)) {
                                if (!"*".equals(trim2.substring(0, 1))) {
                                    int indexOf = timu.indexOf("、");
                                    subject.setStTitle(timu.substring(indexOf + 1));
                                    timu = null;
                                    continue;
                                } else {
                                    timu = timu + "\n" + text.substring(text.lastIndexOf("*") + 1);
                                    continue;
                                }
                            } else {

                                int indexOf = timu.indexOf("、");
                                subject.setStTitle(timu.substring(indexOf + 1));
                                continue;
                            }
                        }
                    }
                    //同上 为#### 则是答案
                } else if ("#".equals(trim.substring(0, 1))) {
                    if (trim.length() >= 4 && "###".equals(trim.substring(1, 4))) {
                        subject.setStAnswer(text.substring(text.lastIndexOf("#") + 1));
                    }
                    //同上 为^^^^ 则是答案
                } else if ("^".equals(trim.substring(0, 1))) {
                    if (trim.length() >= 5 && "^^".equals(trim.substring(1, 3))) {
                        if (timu == null || "".equals(timu)) {
                            if (!"".equals(trim2)) {
                                //判断下一行是不是*,是的话就拼接,不是就存入对象   并且把存入集合
                                if (!"^".equals(trim2.substring(0, 1))) {
                                    //System.out.println("題目"+text.substring(1));
                                    subject.setStParse(text.substring(text.lastIndexOf("^") + 1));
                                    list.add(subject);
                                    //System.out.println(subject);
                                    subject = new Subject();
                                    timu = null;
                                    continue;
                                } else {
                                    timu = text.substring(4);
                                    continue;
                                }
                            } else {
                                //System.out.println("題目"+text.substring(1));
                                subject.setStParse(text.substring(text.lastIndexOf("^") + 1));
                                list.add(subject);
                                //System.out.println(subject);
                                subject = new Subject();
                                timu = null;

                            }

                        } else {
                            if (!"".equals(trim2)) {
                                if (!"^".equals(trim2.substring(0, 1))) {
                                    //System.out.println("題目--"+timu);
                                    subject.setStParse(text.substring(text.lastIndexOf("^") + 1));
                                    list.add(subject);
                                    subject = new Subject();
                                    timu = null;
                                    continue;
                                } else {
                                    timu = timu + "\n" + text.substring(text.lastIndexOf("^") + 1).trim();
                                    continue;
                                }
                            } else {
                                subject.setStParse(text.substring(text.lastIndexOf("^") + 1));
                                list.add(subject);
                                subject = new Subject();
                                timu = null;
                                continue;

                            }
                        }
                    }
                } else {
                    Matcher matcher = pattern1
                            .matcher(trim.substring(0, 1));
                    //根据"、"判断截取前一个字符是不是答案,比配ABCD
                    if (matcher.matches()) {
                        int indexOf = trim.indexOf("、");

                        if (indexOf != -1) {
                            String substring = trim.substring(indexOf - 1,
                                    indexOf);
                            String substring2 = trim.substring(indexOf + 1);
                            if ("A".equals(substring)
                                    || "a".equals(substring)) {
                                subject.setStOptionA(substring2);
                                continue;
                            } else if ("B".equals(substring)
                                    || "b".equals(substring)) {

                                subject.setStOptionB(substring2);
                                continue;
                            } else if ("C".equals(substring)
                                    || "c".equals(substring)) {

                                subject.setStOptionC(substring2);
                                continue;
                            } else if ("D".equals(substring)
                                    || "d".equals(substring)) {
                                subject.setStOptionD(substring2);
                                continue;
                            } else if ("E".equals(substring)
                                    || "e".equals(substring)) {
                                subject.setStOptionE(substring2);
                                continue;
                            } else if ("F".equals(substring)
                                    || "f".equals(substring)) {
                                subject.setStOptionF(substring2);
                                continue;
                            } else if ("G".equals(substring)
                                    || "g".equals(substring)) {
                                subject.setStOptionG(substring2);
                                continue;
                            } else if ("H".equals(substring)
                                    || "h".equals(substring)) {
                                subject.setStOptionH(substring2);
                                continue;
                            } else if ("I".equals(substring)
                                    || "i".equals(substring)) {
                                subject.setStOptionI(substring2);
                                continue;
                            }
                        }

                    }
                }
            }
        }

        return list;
    }

}
