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

    @RequiresPermissions("system:detail:view")
    @GetMapping()
    public String detail()
    {
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
        List<TOutboundDetail> list = tOutboundDetailService.selectTOutboundDetailList(tOutboundDetail);
        ExcelUtil<TOutboundDetail> util = new ExcelUtil<TOutboundDetail>(TOutboundDetail.class);
        return util.exportExcel(list, "detail");
    }

    /**
     * 新增出库单明细
     */
    @GetMapping("/add")
    public String add()
    {
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
        return toAjax(tOutboundDetailService.insertTOutboundDetail(tOutboundDetail));
    }

    /**
     * 修改出库单明细
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
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
        return toAjax(tOutboundDetailService.updateTOutboundDetail(tOutboundDetail));
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
        return toAjax(tOutboundDetailService.deleteTOutboundDetailByIds(ids));
    }
}
