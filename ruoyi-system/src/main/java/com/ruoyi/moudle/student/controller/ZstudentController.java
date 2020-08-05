package com.ruoyi.moudle.student.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.moudle.student.domain.Zstudent;
import com.ruoyi.moudle.student.service.ZstudentService;
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
 * @date 2020-08-04
 */
@Controller
@RequestMapping("/system/zstudent")
public class ZstudentController extends BaseController
{
    private String prefix = "system/zstudent";

    @Autowired
    private ZstudentService zstudentService;

    @RequiresPermissions("system:zstudent:view")
    @GetMapping()
    public String zstudent()
    {
        return prefix + "/zstudent";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:zstudent:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Zstudent zstudent)
    {
        startPage();
        List<Zstudent> list = zstudentService.selectZstudentList(zstudent);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:zstudent:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Zstudent zstudent)
    {
        List<Zstudent> list = zstudentService.selectZstudentList(zstudent);
        ExcelUtil<Zstudent> util = new ExcelUtil<Zstudent>(Zstudent.class);
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
    public AjaxResult addSave(Zstudent zstudent)
    {
        return toAjax(zstudentService.insertZstudent(zstudent));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Zstudent zstudent = zstudentService.selectZstudentById(id);
        mmap.put("zstudent", zstudent);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:zstudent:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Zstudent zstudent)
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
