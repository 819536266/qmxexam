package test;

import com.entity.Bigtype;
import com.entity.Centre;
import com.util.HibernateSessionFactory;
import com.util.MD5;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;
import org.json.JSONArray;
import org.junit.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class demo {
    @Test
    public void text(){

            char[] a = "c4e8c01fa835df8e".toCharArray();
            for (int i = 0; i < a.length; i++){
                a[i] = (char) (a[i] ^ 't');
            }
            String s = new String(a);

        System.out.println(s);
       /* SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yymm");
        Date parse = null;
        try {
            parse = simpleDateFormat
                    .parse("1905");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        simpleDateFormat.applyPattern("yyyy-mm");
        System.out.println(simpleDateFormat.format(parse));*/
    }
}
