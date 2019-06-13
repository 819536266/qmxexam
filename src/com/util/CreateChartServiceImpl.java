package com.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Paint;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.DatasetUtilities;
import org.jfree.ui.TextAnchor;

public class CreateChartServiceImpl {
    private Paint[] colors;
    HttpServletRequest request = ServletActionContext.getRequest();
    //图形颜色
    private String[] colorValues = {"#FF0000", "#0070C0", "#00AF4E", "#7030A0"};
    private String CHART_PATH;


    public String getCHART_PATH() {
        return CHART_PATH;
    }

    public void setCHART_PATH(String cHART_PATH) {
        CHART_PATH = cHART_PATH;
    }

    private String chartName;

    public String getChartName() {
        return chartName;
    }

    public void setChartName(String chartName) {
        this.chartName = chartName;
    }

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        CreateChartServiceImpl pm = new CreateChartServiceImpl();

        // 生成饼状图
        //pm.makePieChart();
        // 生成单组柱状图
        //pm.makeBarChart();
        // 生成多组柱状图
        //pm.makeBarGroupChart();
        // 生成堆积柱状图
        //pm.makeStackedBarChart();
        // 生成折线图

    }
    /** */
    /**
     * 生成的柱状图
     */

    public CategoryDataset getBarData(double[][] data, String[] rowKeys,
                                      String[] columnKeys) {
        return DatasetUtilities
                .createCategoryDataset(rowKeys, columnKeys, data);

    }

    public String createBarChart(CategoryDataset dataset, String xName,
                                 String yName, String chartTitle, String charName) throws IOException {
        setCHART_PATH(request.getRealPath("/") + "images\\temp\\");
        isChartPathExist(CHART_PATH);
        this.chartName = CHART_PATH + charName;

        // 创建主题样式
        StandardChartTheme standardChartTheme = new StandardChartTheme("CN");
        // 设置标题字体
        standardChartTheme.setExtraLargeFont(new Font("SimHei", Font.BOLD, 20));
        // 设置图例的字体
        standardChartTheme.setRegularFont(new Font("Microsoft YaHei", Font.PLAIN, 15));
        // 设置轴向的字体
        standardChartTheme.setLargeFont(new Font("Microsoft YaHei", Font.PLAIN, 15));
        // 应用主题样式
        ChartFactory.setChartTheme(standardChartTheme);

        JFreeChart chart = ChartFactory.createBarChart3D(
                xName, // 图表标题
                "", // 数值轴的显示标签
                yName, // 目录轴的显示标签
                dataset, // 数据集
                //PlotOrientation.VERTICAL, // 图表方向，此处为垂直方向
                PlotOrientation.HORIZONTAL, //图表方向，此处为水平方向
                true, // 是否显示图例
                true, // 是否生成工具
                false // 是否生成URL链接
        );
        // String filename = ServletUtilities.saveChartAsPNG(chart, 450, 300,
        // null, session);CategoryPlot plot = chart.getCategoryPlot();
        // 获得图表区域对象
        CategoryPlot plot = chart.getCategoryPlot();// 获得图表区域对象
        CustomColorBarRenderer renderer = new CustomColorBarRenderer();
        renderer.setBaseItemLabelsVisible(true);
        //设置条目标签生成器,在JFreeChart1.0.6之前可以通过renderer.setItemLabelGenerator(CategoryItemLabelGenerator generator)方法实现，但是从版本1.0.6开始有下面方法代替
        renderer
                .setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
        //设置条目标签显示的位置,outline表示在条目区域外,baseline_center表示基于基线且居中
        renderer.setBaseItemLabelFont(new Font("黑体", Font.PLAIN, 20));
        renderer.setMaximumBarWidth(0.04);
        renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(
                ItemLabelAnchor.OUTSIDE12, TextAnchor.TOP_CENTER));
        plot.setRenderer(renderer);

        //设置y轴刻度最高分数
        NumberAxis numberAxis = (NumberAxis) plot.getRangeAxis();
        numberAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
        numberAxis.setUpperBound(104);
        // 设置柱的透明度
        //设置图片大小
        int height = 500;
        int columnCount = dataset.getColumnCount();
        if (dataset.getColumnCount() > 5) {
            height = columnCount * 50;
        }

        ChartUtilities.saveChartAsPNG(new File(chartName), chart, 1200, height);

        return charName;
    }


    /** */
    /**
     * 判断文件夹是否存在，如果不存在则新建
     *
     * @param chartPath
     */
    private void isChartPathExist(String chartPath) {
        File file = new File(chartPath);
        if (!file.exists()) {
            file.mkdirs();
            // log.info("CHART_PATH="+CHART_PATH+"create.");
        } else {
            String[] list = file.list();
            for (String string : list) {
                File temp = new File(chartPath, string);
                if (temp.isAbsolute()) {
                    temp.delete();
                }
            }
        }
    }


}
