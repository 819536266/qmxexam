package com.util;

import java.io.*;
import java.util.Calendar;
import java.util.Date;

/** 
 * MySQL数据库备份 
 *  
 * @author GaoHuanjie 
 */  
public class MySQLDatabaseBackup {  
  
    /** 
     * Java代码实现MySQL数据库导出 
     *  
     * @author GaoHuanjie 
     * @param hostIP MySQL数据库所在服务器地址IP 
     * @param userName 进入数据库所需要的用户名 
     * @param password 进入数据库所需要的密码 
     * @param savePath 数据库导出文件保存路径 
     * @param fileName 数据库导出文件文件名 
     * @param databaseName 要导出的数据库名 
     * @return 返回true表示导出成功，否则返回false。 
     */  
    public static boolean exportDatabaseTool(String hostIP, String userName, String password, String savePath, String fileName, String databaseName) throws InterruptedException {  
        File saveFile = new File(savePath);  
        if (!saveFile.exists()) {// 如果目录不存在  
            saveFile.mkdirs();// 创建文件夹  
        }
        //如果文件超过7天则删除
        File[] files = saveFile.listFiles();
        if(files.length>0){
            for (File file : files) {
                Calendar instance = Calendar.getInstance();
                long l = file.lastModified();
                Date date = new Date();
                if((date.getTime()-l)>(1000*60*60*7)){
                    file.delete();
                }
            }
        }


        if(!savePath.endsWith(File.separator)){  
            savePath = savePath + File.separator;  
        }  
          
        PrintWriter printWriter = null;  
        BufferedReader bufferedReader = null;  
        try {  
            printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(savePath + fileName), "utf8"));  
            Process process = Runtime.getRuntime().exec(" mysqldump -h" + hostIP + " -u" + userName + " -p" + password + " --set-charset=UTF8 " + databaseName);  
            InputStreamReader inputStreamReader = new InputStreamReader(process.getInputStream(), "utf8");  
            bufferedReader = new BufferedReader(inputStreamReader);  
            String line;  
            while((line = bufferedReader.readLine())!= null){  
                printWriter.println(line);  
            }  
            printWriter.flush();  
            if(process.waitFor() == 0){//0 表示线程正常终止。  
                return true;  
            }  
        }catch (IOException e) {  
            e.printStackTrace();  
        } finally {  
            try {  
                if (bufferedReader != null) {  
                    bufferedReader.close();  
                }  
                if (printWriter != null) {  
                    printWriter.close();  
                }  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
        return false;  
    }  
      
    public static void main(String[] args){  
        try {  
            if (exportDatabaseTool("127.0.0.1", "root", "root", "D:/mysql", "2014-10-14.sql", "exam")) {
                System.out.println("数据库成功备份！！！");  
            } else {  
                System.out.println("数据库备份失败！！！");  
            }  
        } catch (InterruptedException e) {  
            e.printStackTrace();  
        }  
    }  
}  