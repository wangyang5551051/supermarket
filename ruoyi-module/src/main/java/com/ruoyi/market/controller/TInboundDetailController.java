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
import com.ruoyi.market.domain.TInboundDetail;
import com.ruoyi.market.service.ITInboundDetailService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 入库单明细Controller
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Controller
@RequestMapping("/system/inboundDetail")
public class TInboundDetailController extends BaseController
{
    private String prefix = "market/inbounddetail";

    @Autowired
    private ITInboundDetailService tInboundDetailService;

    @RequiresPermissions("system:detail:view")
    @GetMapping()
    public String detail()
    {
        return prefix + "/detail";
    }

    /**
     * 查询入库单明细列表
     */
    @RequiresPermissions("system:detail:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TInboundDetail tInboundDetail)
    {
        startPage();
        List<TInboundDetail> list = tInboundDetailService.selectTInboundDetailList(tInboundDetail);
        return getDataTable(list);
    }

    /**
     * 导出入库单明细列表
     */
    @RequiresPermissions("system:detail:export")
    @Log(title = "入库单明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TInboundDetail tInboundDetail)
    {
        List<TInboundDetail> list = tInboundDetailService.selectTInboundDetailList(tInboundDetail);
        ExcelUtil<TInboundDetail> util = new ExcelUtil<TInboundDetail>(TInboundDetail.class);
        return util.exportExcel(list, "detail");
    }

    /**
     * 新增入库单明细
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存入库单明细
     */
    @RequiresPermissions("system:detail:add")
    @Log(title = "入库单明细", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TInboundDetail tInboundDetail)
    {
        return toAjax(tInboundDetailService.insertTInboundDetail(tInboundDetail));
    }

    /**
     * 修改入库单明细
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TInboundDetail tInboundDetail = tInboundDetailService.selectTInboundDetailById(id);
        mmap.put("tInboundDetail", tInboundDetail);
        return prefix + "/edit";
    }

    /**
     * 修改保存入库单明细
     */
    @RequiresPermissions("system:detail:edit")
    @Log(title = "入库单明细", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TInboundDetail tInboundDetail)
    {
        return toAjax(tInboundDetailService.updateTInboundDetail(tInboundDetail));
    }

    /**
     * 删除入库单明细
     */
    @RequiresPermissions("system:detail:remove")
    @Log(title = "入库单明细", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tInboundDetailService.deleteTInboundDetailByIds(ids));
    }
}
