package test;

import cn.hutool.core.util.StrUtil;
import com.entity.Bigtype;
import com.entity.Centre;
import com.entity.Student;
import com.util.HibernateSessionFactory;
import com.util.MD5;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;
import org.json.JSONArray;
import org.junit.Test;
import test.util.Util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class demo {
    @Test
    public void text(){
        List list=new ArrayList();
       list.add(123);
       // list=null;

        String s="";
        s=null;
        s="asd";
        Student student = new Student();
        System.out.println(StrUtil.isEmptyIfStr(s));
    }


}
