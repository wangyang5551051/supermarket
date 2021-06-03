package com.ruoyi.config;

import com.ruoyi.uidgenerator.domain.WorkerNode;
import com.ruoyi.uidgenerator.mapper.WorkerNodeMapper;
import com.xfvape.uid.utils.DockerUtils;
import com.xfvape.uid.utils.NetUtils;
import com.xfvape.uid.worker.WorkerIdAssigner;
import com.xfvape.uid.worker.WorkerNodeType;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * DisposableWorkerIdAssigner
 */
@Service
public class DisposableWorkerIdAssigner implements WorkerIdAssigner {
    @Autowired
    private WorkerNodeMapper workerNodeMapper;

    @Override
    @Transactional
    public long assignWorkerId() {
        WorkerNode workerNode = buildWorkerNode();

        workerNodeMapper.insertWorkerNode(workerNode);

        return workerNode.getID();
    }

    private WorkerNode buildWorkerNode() {
        WorkerNode workNode = new WorkerNode();
        if (DockerUtils.isDocker()) {
            workNode.setTYPE(WorkerNodeType.CONTAINER.value().longValue());
            workNode.setHostName(DockerUtils.getDockerHost());
            workNode.setPORT(DockerUtils.getDockerPort());
        } else {
            workNode.setTYPE(WorkerNodeType.ACTUAL.value().longValue());
            workNode.setHostName(NetUtils.getLocalAddress());
            workNode.setPORT(System.currentTimeMillis() + "-" + RandomUtils.nextInt(100000));
        }
        workNode.setLaunchDate(new Date());
        workNode.setMODIFIED(new Date());
        workNode.setCREATED(new Date());
        return workNode;
    }
}