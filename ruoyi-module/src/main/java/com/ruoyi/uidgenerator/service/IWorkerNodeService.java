package com.ruoyi.uidgenerator.service;

import com.ruoyi.uidgenerator.domain.WorkerNode;

import java.util.List;

/**
 * DB WorkerID Assigner for UID GeneratorService接口
 * 
 * @author ruoyi
 * @date 2021-06-01
 */
public interface IWorkerNodeService 
{
    /**
     * 查询DB WorkerID Assigner for UID Generator
     * 
     * @param ID DB WorkerID Assigner for UID GeneratorID
     * @return DB WorkerID Assigner for UID Generator
     */
    public WorkerNode selectWorkerNodeById(Long ID);

    /**
     * 查询DB WorkerID Assigner for UID Generator列表
     * 
     * @param workerNode DB WorkerID Assigner for UID Generator
     * @return DB WorkerID Assigner for UID Generator集合
     */
    public List<WorkerNode> selectWorkerNodeList(WorkerNode workerNode);

    /**
     * 新增DB WorkerID Assigner for UID Generator
     * 
     * @param workerNode DB WorkerID Assigner for UID Generator
     * @return 结果
     */
    public int insertWorkerNode(WorkerNode workerNode);

    /**
     * 修改DB WorkerID Assigner for UID Generator
     * 
     * @param workerNode DB WorkerID Assigner for UID Generator
     * @return 结果
     */
    public int updateWorkerNode(WorkerNode workerNode);

    /**
     * 批量删除DB WorkerID Assigner for UID Generator
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteWorkerNodeByIds(String ids);

    /**
     * 删除DB WorkerID Assigner for UID Generator信息
     * 
     * @param ID DB WorkerID Assigner for UID GeneratorID
     * @return 结果
     */
    public int deleteWorkerNodeById(Long ID);

    public long genUid();
}
