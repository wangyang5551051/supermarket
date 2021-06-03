package com.ruoyi.uidgenerator.mapper;

import java.util.List;
import com.ruoyi.uidgenerator.domain.WorkerNode;
import org.apache.ibatis.annotations.Param;
import org.mapstruct.Mapper;

/**
 * DB WorkerID Assigner for UID GeneratorMapper接口
 * 
 * @author ruoyi
 * @date 2021-06-01
 */
@Mapper
public interface WorkerNodeMapper 
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
     * 删除DB WorkerID Assigner for UID Generator
     * 
     * @param ID DB WorkerID Assigner for UID GeneratorID
     * @return 结果
     */
    public int deleteWorkerNodeById(Long ID);

    /**
     * 批量删除DB WorkerID Assigner for UID Generator
     * 
     * @param IDs 需要删除的数据ID
     * @return 结果
     */
    public int deleteWorkerNodeByIds(String[] IDs);

    public WorkerNode getWorkerNodeByHostPort(@Param("host") String host, @Param("port") String port);
}
