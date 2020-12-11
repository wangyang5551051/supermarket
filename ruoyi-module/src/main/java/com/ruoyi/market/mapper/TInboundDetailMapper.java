package com.ruoyi.market.mapper;

import com.ruoyi.market.domain.TInboundDetail;

import java.util.List;

/**
 * 入库单明细Mapper接口
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public interface TInboundDetailMapper 
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
     * 删除入库单明细
     * 
     * @param id 入库单明细ID
     * @return 结果
     */
    public int deleteTInboundDetailById(Long id);

    /**
     * 批量删除入库单明细
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTInboundDetailByIds(String[] ids);

    List<TInboundDetail> selectTInboundDetailByCode(String inboundCode);
}
