package com.ruoyi.market.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.ruoyi.market.domain.TGoodsType;
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
import com.ruoyi.market.domain.TGoods;
import com.ruoyi.market.service.ITGoodsService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 商品Controller
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Controller
@RequestMapping("/system/goods")
public class TGoodsController extends BaseController
{
    private String prefix = "market/goods";

    @Autowired
    private ITGoodsService tGoodsService;
    @Autowired
    private ITGoodsTypeService itGoodsTypeService;
    @Autowired
    private ISysDictTypeService dictTypeService;

    @RequiresPermissions("system:goods:view")
    @GetMapping()
    public String goods(ModelMap mmap)
    {
        List<Map<String,Long>> resultList = itGoodsTypeService.selectTGoodsTypeMap();
        mmap.put("resultList",resultList);
        return prefix + "/goods";
    }

    /**
     * 查询商品列表
     */
    @RequiresPermissions("system:goods:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TGoods tGoods)
    {
        startPage();
        List<TGoods> list = tGoodsService.selectTGoodsList(tGoods);
        return getDataTable(list);
    }

    /**
     * 导出商品列表
     */
    @RequiresPermissions("system:goods:export")
    @Log(title = "商品", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TGoods tGoods)
    {
        startOrderBy();
        List<TGoods> list = tGoodsService.selectTGoodsList(tGoods);
        List<TGoodsType> tGoodsTypes = itGoodsTypeService.selectTGoodsTypeList(new TGoodsType());
        Map<Long, String> typeMap = tGoodsTypes.stream().collect(Collectors.toMap(TGoodsType::getId, TGoodsType::getTypeName));
        List<SysDictData> sysDictData = dictTypeService.selectDictDataByType("sys_unit");
        Map<String,String> unitMap = sysDictData.stream().collect(Collectors.toMap(SysDictData::getDictValue, SysDictData::getDictLabel));
        list.forEach(x ->{
            x.setUnit(unitMap.get(x.getUnit()));
            x.setTypeName(typeMap.get(x.getTypeId()));
        });
        ExcelUtil<TGoods> util = new ExcelUtil<TGoods>(TGoods.class);
        return util.exportExcel(list, "goods");
    }

    /**
     * 新增商品
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Map<String,Long>> resultList = itGoodsTypeService.selectTGoodsTypeMap();
        mmap.put("resultList",resultList);
        return prefix + "/add";
    }

    /**
     * 新增保存商品
     */
    @RequiresPermissions("system:goods:add")
    @Log(title = "商品", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TGoods tGoods)
    {
        return toAjax(tGoodsService.insertTGoods(tGoods));
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
    @RequiresPermissions("system:goods:edit")
    @Log(title = "商品", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TGoods tGoods)
    {
        return toAjax(tGoodsService.updateTGoods(tGoods));
    }

    /**
     * 删除商品
     */
    @RequiresPermissions("system:goods:remove")
    @Log(title = "商品", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tGoodsService.deleteTGoodsByIds(ids));
    }
}
