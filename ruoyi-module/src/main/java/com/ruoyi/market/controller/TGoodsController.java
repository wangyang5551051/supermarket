package com.ruoyi.market.controller;

import java.util.*;
import java.util.stream.Collectors;

import com.ruoyi.market.domain.TGoodsType;
import com.ruoyi.market.domain.TInbound;
import com.ruoyi.market.domain.TOutbound;
import com.ruoyi.market.service.ITGoodsTypeService;
import com.ruoyi.market.service.ITInboundService;
import com.ruoyi.market.service.ITOutboundService;
import com.ruoyi.system.domain.SysDictData;
import com.ruoyi.system.service.ISysDictTypeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.unit.DataUnit;
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
    @Autowired
    private ITInboundService itInboundService;
    @Autowired
    private ITOutboundService itOutboundService;

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

    /**
     * 首页数据
     */
    @GetMapping("/main_v1")
    @ResponseBody
    public Object list()
    {
        List<TGoods> list = tGoodsService.selectTGoodsList(new TGoods());
        Object[] data = new Object[6];
        Object[] o1 = new Object[list.size()];
        Object[] o2 = new Object[list.size()];

        for (int i = 0; i < list.size(); i++) {
            TGoods tGoods = list.get(i);
            o1[i] = tGoods.getName();
            o2[i] = tGoods.getNum()!=null?tGoods.getNum().stripTrailingZeros().toPlainString():"0";
        }
        data[0] = o1;
        data[1] = o2;
        TInbound inbound = new TInbound();
        inbound.setDay("day");
        List<TInbound> tInbounds = itInboundService.selectTInboundList(inbound);
        TInbound inbound1 = new TInbound();
        inbound1.setMonth("month");
        List<TInbound> tInbounds1 = itInboundService.selectTInboundList(inbound1);
        data[2] = tInbounds.size();
        data[5] = tInbounds1.size();

        TOutbound outbound = new TOutbound();
        outbound.setDay("day");
        List<TOutbound> tOutbounds = itOutboundService.selectTOutboundList(outbound);
        data[4] = tInbounds1.size();
        TOutbound outbound1 = new TOutbound();
        outbound1.setMonth("month");
        List<TOutbound> tOutbounds1 = itOutboundService.selectTOutboundList(outbound1);
        data[3] = tOutbounds.size();
        data[5] = tOutbounds1.size();
        return data;
    }
}
