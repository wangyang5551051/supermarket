package com.ruoyi.market.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.ruoyi.market.domain.TGoods;
import com.ruoyi.market.domain.TInboundDetail;
import com.ruoyi.market.service.ITGoodsService;
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
import com.ruoyi.market.domain.TOutboundDetail;
import com.ruoyi.market.service.ITOutboundDetailService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 出库单明细Controller
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Controller
@RequestMapping("/system/outboundDetail")
public class TOutboundDetailController extends BaseController
{
    private String prefix = "market/outbounddetail";

    @Autowired
    private ITOutboundDetailService tOutboundDetailService;
    @Autowired
    private ITGoodsService tGoodsService;
    @Autowired
    private ITGoodsTypeService itGoodsTypeService;
    @Autowired
    private ISysDictTypeService dictTypeService;

    @RequiresPermissions("system:detail:view")
    @GetMapping()
    public String detail(ModelMap mmap)
    {
        List<TGoods> resultList = tGoodsService.selectTGoodsList(new TGoods());
        mmap.put("resultList",resultList);
        List<Map<String,Long>> resultList1 = itGoodsTypeService.selectTGoodsTypeMap();
        mmap.put("resultList1",resultList1);
        return prefix + "/detail";
    }

    /**
     * 查询出库单明细列表
     */
    @RequiresPermissions("system:detail:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TOutboundDetail tOutboundDetail)
    {
        startPage();
        List<TOutboundDetail> list = tOutboundDetailService.selectTOutboundDetailList(tOutboundDetail);
        return getDataTable(list);
    }

    /**
     * 导出出库单明细列表
     */
    @RequiresPermissions("system:detail:export")
    @Log(title = "出库单明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TOutboundDetail tOutboundDetail)
    {
        startOrderBy();
        List<SysDictData> sysDictData = dictTypeService.selectDictDataByType("sys_unit");
        Map<String,String> unitMap = sysDictData.stream().collect(Collectors.toMap(SysDictData::getDictValue, SysDictData::getDictLabel));
        List<TOutboundDetail> list = tOutboundDetailService.selectTOutboundDetailList(tOutboundDetail);
        list.forEach(x ->{
            x.setUnit(unitMap.get(x.getUnit()));
        });
        ExcelUtil<TOutboundDetail> util = new ExcelUtil<TOutboundDetail>(TOutboundDetail.class);
        return util.exportExcel(list, "detail");
    }

    /**
     * 新增出库单明细
     */
    @GetMapping("/add")
    public String add(ModelMap mmap,String outboundCode)
    {
        List<TGoods> resultList = tGoodsService.selectTGoodsList(new TGoods());
        mmap.put("resultList",resultList);
        mmap.put("outboundCode",outboundCode);
        return prefix + "/add";
    }

    /**
     * 新增保存出库单明细
     */
    @RequiresPermissions("system:detail:add")
    @Log(title = "出库单明细", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TOutboundDetail tOutboundDetail)
    {
        AjaxResult ajaxResult;
        try {
            ajaxResult = toAjax(tOutboundDetailService.insertTOutboundDetail(tOutboundDetail));
        } catch (Exception e) {
            ajaxResult = AjaxResult.error(e.getMessage());
        }
        return ajaxResult;
    }

    /**
     * 修改出库单明细
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        List<TGoods> resultList = tGoodsService.selectTGoodsList(new TGoods());
        mmap.put("resultList",resultList);
        TOutboundDetail tOutboundDetail = tOutboundDetailService.selectTOutboundDetailById(id);
        mmap.put("tOutboundDetail", tOutboundDetail);
        return prefix + "/edit";
    }

    /**
     * 修改保存出库单明细
     */
    @RequiresPermissions("system:detail:edit")
    @Log(title = "出库单明细", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TOutboundDetail tOutboundDetail)
    {
        AjaxResult ajaxResult;
        try {
            ajaxResult = toAjax(tOutboundDetailService.updateTOutboundDetail(tOutboundDetail));
        } catch (Exception e) {
            ajaxResult = AjaxResult.error(e.getMessage());
        }
        return ajaxResult;
    }

    /**
     * 删除出库单明细
     */
    @RequiresPermissions("system:detail:remove")
    @Log(title = "出库单明细", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        AjaxResult ajaxResult;
        try {
            ajaxResult = toAjax(tOutboundDetailService.deleteTOutboundDetailByIds(ids));
        } catch (Exception e) {
            ajaxResult = AjaxResult.error(e.getMessage());
        }
        return ajaxResult;
    }
}
