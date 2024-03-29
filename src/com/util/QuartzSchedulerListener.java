package com.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;
import com.util.SchedulerJob;

public class QuartzSchedulerListener implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent arg0) {
		//
	}

	public void contextInitialized(ServletContextEvent arg0) {

		JobDetail job = JobBuilder.newJob(SchedulerJob.class)
				.withIdentity("anyJobName", "group").build();

		try {
			Trigger trigger = TriggerBuilder
			  .newTrigger()
			  .withIdentity("anyTriggerName", "group")
			  .withSchedule(
			     CronScheduleBuilder.cronSchedule("0 0 0 1/1 * ? *"))
			  .build();

			Scheduler scheduler = new StdSchedulerFactory().getScheduler();
			scheduler.start();
			scheduler.scheduleJob(job, trigger);

		} catch (SchedulerException e) {
			e.printStackTrace();
		}

	}
}

