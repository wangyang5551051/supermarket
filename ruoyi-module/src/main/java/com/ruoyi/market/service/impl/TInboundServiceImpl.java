package com.ruoyi.market.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.market.mapper.TInboundMapper;
import com.ruoyi.market.domain.TInbound;
import com.ruoyi.market.service.ITInboundService;
import com.ruoyi.common.core.text.Convert;

/**
 * 入库单Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Service
public class TInboundServiceImpl implements ITInboundService 
{
    @Autowired
    private TInboundMapper tInboundMapper;

    /**
     * 查询入库单
     * 
     * @param id 入库单ID
     * @return 入库单
     */
    @Override
    public TInbound selectTInboundById(Long id)
    {
        return tInboundMapper.selectTInboundById(id);
    }

    /**
     * 查询入库单列表
     * 
     * @param tInbound 入库单
     * @return 入库单
     */
    @Override
    public List<TInbound> selectTInboundList(TInbound tInbound)
    {
        return tInboundMapper.selectTInboundList(tInbound);
    }

    /**
     * 新增入库单
     * 
     * @param tInbound 入库单
     * @return 结果
     */
    @Override
    public int insertTInbound(TInbound tInbound)
    {
        tInbound.setCreateTime(DateUtils.getNowDate());
        return tInboundMapper.insertTInbound(tInbound);
    }

    /**
     * 修改入库单
     * 
     * @param tInbound 入库单
     * @return 结果
     */
    @Override
    public int updateTInbound(TInbound tInbound)
    {
        return tInboundMapper.updateTInbound(tInbound);
    }

    /**
     * 删除入库单对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTInboundByIds(String ids)
    {
        return tInboundMapper.deleteTInboundByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除入库单信息
     * 
     * @param id 入库单ID
     * @return 结果
     */
    @Override
    public int deleteTInboundById(Long id)
    {
        return tInboundMapper.deleteTInboundById(id);
    }
}
