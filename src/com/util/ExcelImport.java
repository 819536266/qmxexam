package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.apache.poi.hssf.model.Sheet;
import org.apache.poi.hssf.record.formula.functions.Row;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.entity.Student;

public class ExcelImport {

    public static void main(String[] args) throws FileNotFoundException, IOException {
        File file = new File("C:/Users/81953/Desktop/员工.xlsx");

        ExcelImport excelImport = new ExcelImport();
        excelImport.excel(file);

    }

    public List<Student> excel(File file) throws FileNotFoundException, IOException {
        XSSFWorkbook hw = new XSSFWorkbook(new FileInputStream(file));
        XSSFSheet sheetAt = hw.getSheetAt(0);
        for (org.apache.poi.ss.usermodel.Row row : sheetAt) {
            if (row.getRowNum() == 0) {
                continue;
            }
            row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
            row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
            Student student = new Student();
            String studentName = row.getCell(0).getStringCellValue();
            String sclass = row.getCell(2).getStringCellValue();
            String onesclass = row.getCell(3).getStringCellValue();
            String term = row.getCell(4).getStringCellValue();
            String password = row.getCell(1).getStringCellValue();
            student.setPassword(password);
            student.setSclass(sclass);
            student.setStudentName(studentName);
            student.setTerm(term);
        }
        return null;

    }
}
