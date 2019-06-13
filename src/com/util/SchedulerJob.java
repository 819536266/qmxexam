package com.util;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import static com.util.MySQLDatabaseBackup.exportDatabaseTool;

public class SchedulerJob implements Job {
	public void execute(JobExecutionContext context)
		throws JobExecutionException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Properties properties = new Properties();
		 // 使用ClassLoader加载properties配置文件生成对应的输入流
		InputStream in = SchedulerJob.class.getClassLoader().getResourceAsStream("db.properties");
		 // 使用properties对象加载输入流
		try {
			properties.load(in);
		} catch (IOException e) {
			System.out.println(sdf.format(new Date())+":备份错误");
		}
		//获取key对应的value值
		String ip = properties.getProperty("ip");
		String username = properties.getProperty("username");
		String password = properties.getProperty("password");
		String path = properties.getProperty("path");
		String tablename = properties.getProperty("tablename");
		SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String filename=sdf1.format(new Date())+tablename+".sql";
		System.out.println(filename);
		try {
			if (exportDatabaseTool(ip, username, password, path, filename, tablename)) {
				System.out.println(sdf.format(new Date())+"数据库成功备份！！！");
			} else {
				System.out.println(sdf.format(new Date())+"数据库备份失败！！！");
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

	}


}

