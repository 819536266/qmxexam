package test.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.entity.Student;
import com.util.HibernateSessionFactory;

import freemarker.template.SimpleDate;

public class text2 {
    public static void main(String[] args) throws FileNotFoundException, IOException {
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYMM");
        String format = simpleDateFormat.format(date);
        System.out.println(Integer.parseInt(format));
    }
}
