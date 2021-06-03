package com.ruoyi.uidgenerator.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.uidgenerator.domain.WorkerNode;
import com.ruoyi.uidgenerator.service.IWorkerNodeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * DB WorkerID Assigner for UID GeneratorController
 * 
 * @author ruoyi
 * @date 2021-06-01
 */
@Controller
@RequestMapping("/system/node")
public class WorkerNodeController extends BaseController
{
    private String prefix = "system/node";

    @Autowired
    private IWorkerNodeService workerNodeService;

    @RequiresPermissions("system:node:view")
    @GetMapping()
    public String node()
    {
        return prefix + "/node";
    }

    /**
     * 查询DB WorkerID Assigner for UID Generator列表
     */
    @RequiresPermissions("system:node:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(WorkerNode workerNode)
    {
        startPage();
        List<WorkerNode> list = workerNodeService.selectWorkerNodeList(workerNode);
        return getDataTable(list);
    }

    /**
     * 导出DB WorkerID Assigner for UID Generator列表
     */
    @RequiresPermissions("system:node:export")
    @Log(title = "DB WorkerID Assigner for UID Generator", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(WorkerNode workerNode)
    {
        List<WorkerNode> list = workerNodeService.selectWorkerNodeList(workerNode);
        ExcelUtil<WorkerNode> util = new ExcelUtil<WorkerNode>(WorkerNode.class);
        return util.exportExcel(list, "node");
    }

    /**
     * 新增DB WorkerID Assigner for UID Generator
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存DB WorkerID Assigner for UID Generator
     */
    @RequiresPermissions("system:node:add")
    @Log(title = "DB WorkerID Assigner for UID Generator", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(WorkerNode workerNode)
    {
        return toAjax(workerNodeService.insertWorkerNode(workerNode));
    }

    /**
     * 修改DB WorkerID Assigner for UID Generator
     */
    @GetMapping("/edit/{ID}")
    public String edit(@PathVariable("ID") Long ID, ModelMap mmap)
    {
        WorkerNode workerNode = workerNodeService.selectWorkerNodeById(ID);
        mmap.put("workerNode", workerNode);
        return prefix + "/edit";
    }

    /**
     * 修改保存DB WorkerID Assigner for UID Generator
     */
    @RequiresPermissions("system:node:edit")
    @Log(title = "DB WorkerID Assigner for UID Generator", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(WorkerNode workerNode)
    {
        return toAjax(workerNodeService.updateWorkerNode(workerNode));
    }

    /**
     * 删除DB WorkerID Assigner for UID Generator
     */
    @RequiresPermissions("system:node:remove")
    @Log(title = "DB WorkerID Assigner for UID Generator", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(workerNodeService.deleteWorkerNodeByIds(ids));
    }
}
