package com.ruoyi.leida.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.leida.domain.Zleidatu;
import com.ruoyi.leida.service.IZleidatu;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2020-08-10
 */
@Controller
@RequestMapping("/system/zleidatu")
public class ZleidaController extends BaseController
{
    private String prefix = "system/zleidatu";

    @Autowired
    private IZleidatu zstudentService;

    @RequiresPermissions("system:zstudent:view")
    @GetMapping()
    public String zstudent()
    {
        return prefix + "/zleidatu";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:zstudent:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Zleidatu zstudent)
    {
        startPage();
        List<Zleidatu> list = zstudentService.selectZstudentList(zstudent);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:zstudent:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Zleidatu zstudent)
    {
        List<Zleidatu> list = zstudentService.selectZstudentList(zstudent);
        ExcelUtil<Zleidatu> util = new ExcelUtil<Zleidatu>(Zleidatu.class);
        return util.exportExcel(list, "zstudent");
    }

    /**
     * 新增【请填写功能名称】
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存【请填写功能名称】
     */
    @RequiresPermissions("system:zstudent:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Zleidatu zstudent)
    {
        return toAjax(zstudentService.insertZstudent(zstudent));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Zleidatu zstudent = zstudentService.selectZstudentById(id);
        mmap.put("zstudent", zstudent);
        return prefix + "/edit";
    }
    /**
     * 修改【动态雷达图】
     */
    @GetMapping("/com/ruoyi/leida/{id}")
    public String leida(@PathVariable("id") Long id, ModelMap mmap)
    {
        Zleidatu zleidatu = zstudentService.selectZstudentById(id);
        mmap.put("zleidatu", zleidatu);
        return prefix + "/leidatu";
    }

    /**
     * 修改【动态雷达图】
     */
    @GetMapping("/leida2/{id}")
    public String leida2(@PathVariable("id") Long id, ModelMap mmap)
    {
        Zleidatu zleidatu = zstudentService.selectZstudentById(id);
        mmap.put("zleidatu", zleidatu);
        return prefix + "/leidatu2";
    }
    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:zstudent:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Zleidatu zstudent)
    {
        return toAjax(zstudentService.updateZstudent(zstudent));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:zstudent:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(zstudentService.deleteZstudentByIds(ids));
    }
}
