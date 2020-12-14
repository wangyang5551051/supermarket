package com.ruoyi.market.service;

import java.util.List;
import com.ruoyi.market.domain.TOutbound;

/**
 * 出库单Service接口
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public interface ITOutboundService 
{
    /**
     * 查询出库单
     * 
     * @param id 出库单ID
     * @return 出库单
     */
    public TOutbound selectTOutboundById(Long id);

    /**
     * 查询出库单列表
     * 
     * @param tOutbound 出库单
     * @return 出库单集合
     */
    public List<TOutbound> selectTOutboundList(TOutbound tOutbound);

    /**
     * 新增出库单
     * 
     * @param tOutbound 出库单
     * @return 结果
     */
    public int insertTOutbound(TOutbound tOutbound);

    /**
     * 修改出库单
     * 
     * @param tOutbound 出库单
     * @return 结果
     */
    public int updateTOutbound(TOutbound tOutbound);

    /**
     * 批量删除出库单
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTOutboundByIds(String ids);

    /**
     * 删除出库单信息
     * 
     * @param id 出库单ID
     * @return 结果
     */
    public int deleteTOutboundById(Long id);

    TOutbound selectTInboundByCode(String outboundCode);
}
