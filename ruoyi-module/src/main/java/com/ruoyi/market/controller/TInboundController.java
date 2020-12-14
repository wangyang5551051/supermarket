package com.ruoyi.market.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.ruoyi.market.domain.TInboundDetail;
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
import com.ruoyi.market.domain.TInbound;
import com.ruoyi.market.service.ITInboundService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 入库单Controller
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Controller
@RequestMapping("/system/inbound")
public class TInboundController extends BaseController
{
    private String prefix = "market/inbound";

    @Autowired
    private ITInboundService tInboundService;
    @Autowired
    private ISysDictTypeService dictTypeService;

    @RequiresPermissions("system:inbound:view")
    @GetMapping()
    public String inbound()
    {
        return prefix + "/inbound";
    }

    /**
     * 查询入库单列表
     */
    @RequiresPermissions("system:inbound:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TInbound tInbound)
    {
        startPage();
        List<TInbound> list = tInboundService.selectTInboundList(tInbound);
        return getDataTable(list);
    }

    /**
     * 导出入库单列表
     */
    @RequiresPermissions("system:inbound:export")
    @Log(title = "入库单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TInbound tInbound)
    {
        startOrderBy();
        List<TInbound> list = tInboundService.selectTInboundList(tInbound);
        List<SysDictData> sysDictData = dictTypeService.selectDictDataByType("sys_bound_status");
        Map<String,String> map = sysDictData.stream().collect(Collectors.toMap(SysDictData::getDictValue, SysDictData::getDictLabel));
        list.forEach(x ->{
            x.setStatus(map.get(x.getStatus()));
        });
        ExcelUtil<TInbound> util = new ExcelUtil<TInbound>(TInbound.class);
        return util.exportExcel(list, "inbound");
    }

    /**
     * 新增入库单
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存入库单
     */
    @RequiresPermissions("system:inbound:add")
    @Log(title = "入库单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TInbound tInbound)
    {
        return toAjax(tInboundService.insertTInbound(tInbound));
    }

    /**
     * 修改入库单
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TInbound tInbound = tInboundService.selectTInboundById(id);
        mmap.put("tInbound", tInbound);
        return prefix + "/edit";
    }

    /**
     * 修改保存入库单
     */
    @RequiresPermissions("system:inbound:edit")
    @Log(title = "入库单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TInbound tInbound)
    {
        AjaxResult ajaxResult;
        try {
            ajaxResult = toAjax(tInboundService.updateTInbound(tInbound));
        } catch (Exception e) {
            ajaxResult = AjaxResult.error(e.getMessage());
        }
        return ajaxResult;
    }

    /**
     * 删除入库单
     */
    @RequiresPermissions("system:inbound:remove")
    @Log(title = "入库单", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        AjaxResult ajaxResult;
        try {
            ajaxResult = toAjax(tInboundService.deleteTInboundByIds(ids));
        } catch (Exception e) {
            ajaxResult = AjaxResult.error(e.getMessage());
        }
        return ajaxResult;
    }

    /**
     * 查看详细
     */
    @GetMapping("/detail/{inboundCode}")
    public String detail(@PathVariable("inboundCode") String inboundCode, ModelMap mmap)
    {
        mmap.put("inboundCode", inboundCode);
        TInbound tInbound = tInboundService.selectTInboundByCode(inboundCode);
        mmap.put("status", "2".equals(tInbound.getStatus()));
        return prefix + "/detail";
    }
}
