package com.ruoyi.market.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.ruoyi.market.service.ITGoodsTypeService;
import com.ruoyi.system.domain.SysDictData;
import com.ruoyi.system.service.ISysDictTypeService;
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
import com.ruoyi.market.domain.TInventoryRecord;
import com.ruoyi.market.service.ITInventoryRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * 盘点记录Controller
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Controller
@RequestMapping("/system/record")
public class TInventoryRecordController extends BaseController
{
    private String prefix = "market/record";

    @Autowired
    private ITInventoryRecordService tInventoryRecordService;
    @Autowired
    private ITGoodsTypeService itGoodsTypeService;
    @Autowired
    private ISysDictTypeService dictTypeService;

    @RequiresPermissions("system:record:view")
    @GetMapping()
    public String record(ModelMap mmap)
    {
        List<Map<String,Long>> resultList = itGoodsTypeService.selectTGoodsTypeMap();
        mmap.put("resultList",resultList);
        return prefix + "/record";
    }

    /**
     * 查询盘点记录列表
     */
    @RequiresPermissions("system:record:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TInventoryRecord tInventoryRecord)
    {
        startPage();
        List<TInventoryRecord> list = tInventoryRecordService.selectTInventoryRecordList(tInventoryRecord);
        return getDataTable(list);
    }

    /**
     * 导出盘点记录列表
     */
    @RequiresPermissions("system:record:export")
    @Log(title = "盘点记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TInventoryRecord tInventoryRecord)
    {
        List<TInventoryRecord> list = tInventoryRecordService.selectTInventoryRecordList(tInventoryRecord);
        List<SysDictData> sysDictData = dictTypeService.selectDictDataByType("sys_unit");
        Map<String,String> unitMap = sysDictData.stream().collect(Collectors.toMap(SysDictData::getDictValue, SysDictData::getDictLabel));
        list.forEach(x ->{
            if(x.getNewNum() !=null && x.getOldNum() !=null){
                x.setNum(x.getNewNum().subtract(x.getOldNum()));
            }
            x.setUnit(unitMap.get(x.getUnit()));
        });
        ExcelUtil<TInventoryRecord> util = new ExcelUtil<TInventoryRecord>(TInventoryRecord.class);
        return util.exportExcel(list, "record");
    }

    /**
     * 新增盘点记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存盘点记录
     */
    @RequiresPermissions("system:record:add")
    @Log(title = "盘点记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TInventoryRecord tInventoryRecord)
    {
        return toAjax(tInventoryRecordService.insertTInventoryRecord(tInventoryRecord));
    }

    /**
     * 修改盘点记录
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TInventoryRecord tInventoryRecord = tInventoryRecordService.selectTInventoryRecordById(id);
        mmap.put("tInventoryRecord", tInventoryRecord);
        return prefix + "/edit";
    }

    /**
     * 修改保存盘点记录
     */
    @RequiresPermissions("system:record:edit")
    @Log(title = "盘点记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TInventoryRecord tInventoryRecord)
    {
        return toAjax(tInventoryRecordService.updateTInventoryRecord(tInventoryRecord));
    }

    /**
     * 删除盘点记录
     */
    @RequiresPermissions("system:record:remove")
    @Log(title = "盘点记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tInventoryRecordService.deleteTInventoryRecordByIds(ids));
    }
}
