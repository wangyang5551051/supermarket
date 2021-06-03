package com.ruoyi.uidgenerator.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.uidgenerator.domain.WorkerNode;
import com.ruoyi.uidgenerator.mapper.WorkerNodeMapper;
import com.ruoyi.uidgenerator.service.IWorkerNodeService;
import com.xfvape.uid.UidGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * DB WorkerID Assigner for UID GeneratorService业务层处理
 * 
 * @author ruoyi
 * @date 2021-06-01
 */
@Service
public class WorkerNodeServiceImpl implements IWorkerNodeService
{
    @Autowired
    private WorkerNodeMapper workerNodeMapper;

    @Resource
    private UidGenerator uidGenerator;

    /**
     * 查询DB WorkerID Assigner for UID Generator
     * 
     * @param ID DB WorkerID Assigner for UID GeneratorID
     * @return DB WorkerID Assigner for UID Generator
     */
    @Override
    public WorkerNode selectWorkerNodeById(Long ID)
    {
        return workerNodeMapper.selectWorkerNodeById(ID);
    }

    /**
     * 查询DB WorkerID Assigner for UID Generator列表
     * 
     * @param workerNode DB WorkerID Assigner for UID Generator
     * @return DB WorkerID Assigner for UID Generator
     */
    @Override
    public List<WorkerNode> selectWorkerNodeList(WorkerNode workerNode)
    {
        return workerNodeMapper.selectWorkerNodeList(workerNode);
    }

    /**
     * 新增DB WorkerID Assigner for UID Generator
     * 
     * @param workerNode DB WorkerID Assigner for UID Generator
     * @return 结果
     */
    @Override
    public int insertWorkerNode(WorkerNode workerNode)
    {
        return workerNodeMapper.insertWorkerNode(workerNode);
    }

    /**
     * 修改DB WorkerID Assigner for UID Generator
     * 
     * @param workerNode DB WorkerID Assigner for UID Generator
     * @return 结果
     */
    @Override
    public int updateWorkerNode(WorkerNode workerNode)
    {
        return workerNodeMapper.updateWorkerNode(workerNode);
    }

    /**
     * 删除DB WorkerID Assigner for UID Generator对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteWorkerNodeByIds(String ids)
    {
        return workerNodeMapper.deleteWorkerNodeByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除DB WorkerID Assigner for UID Generator信息
     * 
     * @param ID DB WorkerID Assigner for UID GeneratorID
     * @return 结果
     */
    @Override
    public int deleteWorkerNodeById(Long ID)
    {
        return workerNodeMapper.deleteWorkerNodeById(ID);
    }

    @Override
    public long genUid() {
//        Long uu_id = UidGeneratorComponent.uu_id;
        return uidGenerator.getUID();
    }
}
