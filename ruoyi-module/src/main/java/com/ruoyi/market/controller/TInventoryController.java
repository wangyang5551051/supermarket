package com.ruoyi.market.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.market.domain.TGoods;
import com.ruoyi.market.service.ITGoodsService;
import com.ruoyi.market.service.ITGoodsTypeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 商品Controller
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Controller
@RequestMapping("/system/inventory")
public class TInventoryController extends BaseController
{
    private String prefix = "market/inventory";

    @Autowired
    private ITGoodsService tGoodsService;
    @Autowired
    private ITGoodsTypeService itGoodsTypeService;

    @RequiresPermissions("system:inventory:view")
    @GetMapping()
    public String goods(ModelMap mmap)
    {
        List<Map<String,Long>> resultList = itGoodsTypeService.selectTGoodsTypeMap();
        mmap.put("resultList",resultList);
        return prefix + "/inventory";
    }

    /**
     * 查询商品列表
     */
    @RequiresPermissions("system:inventory:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TGoods tGoods)
    {
        startPage();
        List<TGoods> list = tGoodsService.selectTGoodsList(tGoods);
        return getDataTable(list);
    }



    /**
     * 修改商品
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TGoods tGoods = tGoodsService.selectTGoodsById(id);
        mmap.put("tGoods", tGoods);
        List<Map<String,Long>> resultList = itGoodsTypeService.selectTGoodsTypeMap();
        mmap.put("resultList",resultList);
        return prefix + "/edit";
    }

    /**
     * 修改保存商品
     */
    @RequiresPermissions("system:inventory:edit")
    @Log(title = "商品", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TGoods tGoods)
    {
        return toAjax(tGoodsService.updateTGoodsNum(tGoods));
    }

}
