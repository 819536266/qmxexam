package test.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xwpf.usermodel.XWPFDocument;

public class importExcel {
    public static void main(String[] args) throws FileNotFoundException, IOException {
        HSSFWorkbook hw = new HSSFWorkbook();
        HSSFSheet cs = hw.createSheet("员工");
        HSSFRow createRow = cs.createRow(0);
        createRow.createCell(0).setCellValue("你好啊");
        createRow.createCell(1).setCellValue("你好啊");
        File file = new File("D:\\ex.xlsx");
        hw.write(new FileOutputStream(file));
    }
}
