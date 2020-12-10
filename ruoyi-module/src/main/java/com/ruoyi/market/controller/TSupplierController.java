package com.ruoyi.market.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.market.domain.TSupplier;
import com.ruoyi.market.service.ITSupplierService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 供货商Controller
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Controller
@RequestMapping("/system/supplier")
public class TSupplierController extends BaseController
{
    private String prefix = "market/supplier";

    @Autowired
    private ITSupplierService tSupplierService;

    @RequiresPermissions("system:supplier:view")
    @GetMapping()
    public String supplier()
    {
        return prefix + "/supplier";
    }

    /**
     * 查询供货商列表
     */
    @RequiresPermissions("system:supplier:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TSupplier tSupplier)
    {
        startPage();
        List<TSupplier> list = tSupplierService.selectTSupplierList(tSupplier);
        return getDataTable(list);
    }

    /**
     * 导出供货商列表
     */
    @RequiresPermissions("system:supplier:export")
    @Log(title = "供货商", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TSupplier tSupplier)
    {
        List<TSupplier> list = tSupplierService.selectTSupplierList(tSupplier);
        ExcelUtil<TSupplier> util = new ExcelUtil<TSupplier>(TSupplier.class);
        return util.exportExcel(list, "supplier");
    }

    /**
     * 新增供货商
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存供货商
     */
    @RequiresPermissions("system:supplier:add")
    @Log(title = "供货商", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TSupplier tSupplier)
    {
        return toAjax(tSupplierService.insertTSupplier(tSupplier));
    }

    /**
     * 修改供货商
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TSupplier tSupplier = tSupplierService.selectTSupplierById(id);
        mmap.put("tSupplier", tSupplier);
        return prefix + "/edit";
    }

    /**
     * 修改保存供货商
     */
    @RequiresPermissions("system:supplier:edit")
    @Log(title = "供货商", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TSupplier tSupplier)
    {
        return toAjax(tSupplierService.updateTSupplier(tSupplier));
    }

    /**
     * 删除供货商
     */
    @RequiresPermissions("system:supplier:remove")
    @Log(title = "供货商", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tSupplierService.deleteTSupplierByIds(ids));
    }
}
