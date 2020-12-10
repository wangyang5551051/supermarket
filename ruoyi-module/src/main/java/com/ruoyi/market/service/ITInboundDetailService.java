package com.ruoyi.market.service;

import java.util.List;
import com.ruoyi.market.domain.TInboundDetail;

/**
 * 入库单明细Service接口
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public interface ITInboundDetailService 
{
    /**
     * 查询入库单明细
     * 
     * @param id 入库单明细ID
     * @return 入库单明细
     */
    public TInboundDetail selectTInboundDetailById(Long id);

    /**
     * 查询入库单明细列表
     * 
     * @param tInboundDetail 入库单明细
     * @return 入库单明细集合
     */
    public List<TInboundDetail> selectTInboundDetailList(TInboundDetail tInboundDetail);

    /**
     * 新增入库单明细
     * 
     * @param tInboundDetail 入库单明细
     * @return 结果
     */
    public int insertTInboundDetail(TInboundDetail tInboundDetail);

    /**
     * 修改入库单明细
     * 
     * @param tInboundDetail 入库单明细
     * @return 结果
     */
    public int updateTInboundDetail(TInboundDetail tInboundDetail);

    /**
     * 批量删除入库单明细
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTInboundDetailByIds(String ids);

    /**
     * 删除入库单明细信息
     * 
     * @param id 入库单明细ID
     * @return 结果
     */
    public int deleteTInboundDetailById(Long id);
}
