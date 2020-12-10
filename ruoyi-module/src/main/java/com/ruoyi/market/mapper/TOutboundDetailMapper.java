package com.ruoyi.market.mapper;

import com.ruoyi.market.domain.TOutboundDetail;

import java.util.List;

/**
 * 出库单明细Mapper接口
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public interface TOutboundDetailMapper 
{
    /**
     * 查询出库单明细
     * 
     * @param id 出库单明细ID
     * @return 出库单明细
     */
    public TOutboundDetail selectTOutboundDetailById(Long id);

    /**
     * 查询出库单明细列表
     * 
     * @param tOutboundDetail 出库单明细
     * @return 出库单明细集合
     */
    public List<TOutboundDetail> selectTOutboundDetailList(TOutboundDetail tOutboundDetail);

    /**
     * 新增出库单明细
     * 
     * @param tOutboundDetail 出库单明细
     * @return 结果
     */
    public int insertTOutboundDetail(TOutboundDetail tOutboundDetail);

    /**
     * 修改出库单明细
     * 
     * @param tOutboundDetail 出库单明细
     * @return 结果
     */
    public int updateTOutboundDetail(TOutboundDetail tOutboundDetail);

    /**
     * 删除出库单明细
     * 
     * @param id 出库单明细ID
     * @return 结果
     */
    public int deleteTOutboundDetailById(Long id);

    /**
     * 批量删除出库单明细
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTOutboundDetailByIds(String[] ids);
}
