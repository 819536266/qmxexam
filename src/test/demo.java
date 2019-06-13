package test;

import com.entity.Bigtype;
import com.entity.Centre;
import com.util.HibernateSessionFactory;
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
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yymm");
        Date parse = null;
        try {
            parse = simpleDateFormat
                    .parse("1905");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        simpleDateFormat.applyPattern("yyyy-mm");
        System.out.println(simpleDateFormat.format(parse));
    }
}
