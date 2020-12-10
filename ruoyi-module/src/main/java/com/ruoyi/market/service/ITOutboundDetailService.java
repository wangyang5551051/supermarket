package com.ruoyi.market.service;

import java.util.List;
import com.ruoyi.market.domain.TOutboundDetail;

/**
 * 出库单明细Service接口
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public interface ITOutboundDetailService 
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
     * 批量删除出库单明细
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTOutboundDetailByIds(String ids);

    /**
     * 删除出库单明细信息
     * 
     * @param id 出库单明细ID
     * @return 结果
     */
    public int deleteTOutboundDetailById(Long id);
}
