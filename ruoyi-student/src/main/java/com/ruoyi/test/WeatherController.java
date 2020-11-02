package com.ruoyi.test;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.Global;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.student.service.ZstudentService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2020-08-04
 */
@Api("管理")
@Controller
public class WeatherController extends BaseController
{

    @Autowired
    private ZstudentService zstudentService;

    //
    @GetMapping("/weather")
    public String main(ModelMap mmap)
    {
        mmap.put("version", Global.getVersion());
        return "main_v2";
    }

    /**
     *
     */
    @Log(title = "【查询天气】", businessType = BusinessType.OTHER)
    @PostMapping( "/weather")
    @ResponseBody
    public AjaxResult weather(String province,String city,String area,String needday)
    {
        AjaxResult ajaxResult;
        Object[] list = null;
        try {
            list = zstudentService.selectWeather(province,city,area,needday);
        } catch (Exception e) {
            ajaxResult = error("请输入正确的地址");
            return ajaxResult;
        }
        if(null == list){
            ajaxResult = error("请输入正确的地址");
        }else {
            ajaxResult = toAjax(true);
            ajaxResult.put("data",list);
        }
        return ajaxResult;
    }

    /**
     *
     */
    @Log(title = "【rabbit性能测试】", businessType = BusinessType.OTHER)
    @PostMapping( "/test")
    @ResponseBody
    public AjaxResult weatherRabbit(String province,String city,String area,String needday)
    {
        AjaxResult ajaxResult;
        Object[] list = null;
        try {
            list = zstudentService.selectWeatherRabbit(province,city,area,needday);
        } catch (Exception e) {
            ajaxResult = error("请输入正确的地址");
            return ajaxResult;
        }
        if(null == list){
            ajaxResult = error("请输入正确的地址");
        }else {
            ajaxResult = toAjax(true);
            ajaxResult.put("data",list);
        }
        return ajaxResult;
    }
}
