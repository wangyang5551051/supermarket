package com.ruoyi.market.service;

import java.util.List;
import com.ruoyi.market.domain.TInbound;

/**
 * 入库单Service接口
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public interface ITInboundService 
{
    /**
     * 查询入库单
     * 
     * @param id 入库单ID
     * @return 入库单
     */
    public TInbound selectTInboundById(Long id);

    /**
     * 查询入库单列表
     * 
     * @param tInbound 入库单
     * @return 入库单集合
     */
    public List<TInbound> selectTInboundList(TInbound tInbound);

    /**
     * 新增入库单
     * 
     * @param tInbound 入库单
     * @return 结果
     */
    public int insertTInbound(TInbound tInbound);

    /**
     * 修改入库单
     * 
     * @param tInbound 入库单
     * @return 结果
     */
    public int updateTInbound(TInbound tInbound);

    /**
     * 批量删除入库单
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTInboundByIds(String ids);

    /**
     * 删除入库单信息
     * 
     * @param id 入库单ID
     * @return 结果
     */
    public int deleteTInboundById(Long id);

    public TInbound selectTInboundByCode(String code);
}
