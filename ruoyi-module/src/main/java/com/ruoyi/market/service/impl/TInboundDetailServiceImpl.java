package com.ruoyi.market.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroCommonUtils;
import com.ruoyi.market.domain.TInbound;
import com.ruoyi.market.mapper.TInboundMapper;
import com.ruoyi.market.service.ITInboundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.market.mapper.TInboundDetailMapper;
import com.ruoyi.market.domain.TInboundDetail;
import com.ruoyi.market.service.ITInboundDetailService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.transaction.annotation.Transactional;

/**
 * 入库单明细Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
@Service
public class TInboundDetailServiceImpl implements ITInboundDetailService 
{
    @Autowired
    private TInboundMapper tInboundMapper;
    @Autowired
    private TInboundDetailMapper tInboundDetailMapper;

    /**
     * 查询入库单明细
     * 
     * @param id 入库单明细ID
     * @return 入库单明细
     */
    @Override
    public TInboundDetail selectTInboundDetailById(Long id)
    {
        return tInboundDetailMapper.selectTInboundDetailById(id);
    }

    /**
     * 查询入库单明细列表
     * 
     * @param tInboundDetail 入库单明细
     * @return 入库单明细
     */
    @Override
    public List<TInboundDetail> selectTInboundDetailList(TInboundDetail tInboundDetail)
    {
        return tInboundDetailMapper.selectTInboundDetailList(tInboundDetail);
    }

    /**
     * 新增入库单明细
     * 
     * @param tInboundDetail 入库单明细
     * @return 结果
     */
    @Override
    @Transactional
    public int insertTInboundDetail(TInboundDetail tInboundDetail)
    {
        TInbound inbound = tInboundMapper.selectTInboundByCode(tInboundDetail.getInboundCode());
        if(inbound == null){
            throw new RuntimeException("新增失败，入库单未找到！");
        }
        if("2".equals(inbound.getStatus())){
            throw new RuntimeException("新增失败，入库单已经完成！");
        }
        tInboundDetail.setCreateBy(ShiroCommonUtils.getSysUser().getUserName());
        tInboundDetail.setCreateTime(DateUtils.getNowDate());
        return tInboundDetailMapper.insertTInboundDetail(tInboundDetail);
    }

    /**
     * 修改入库单明细
     * 
     * @param tInboundDetail 入库单明细
     * @return 结果
     */
    @Override
    @Transactional
    public int updateTInboundDetail(TInboundDetail tInboundDetail)
    {
        TInbound inbound = tInboundMapper.selectTInboundByCode(tInboundDetail.getInboundCode());
        if(inbound == null){
            throw new RuntimeException("修改失败，入库单未找到！");
        }
        if("2".equals(inbound.getStatus())){
            throw new RuntimeException("修改失败，入库单已经完成！");
        }
        return tInboundDetailMapper.updateTInboundDetail(tInboundDetail);
    }

    /**
     * 删除入库单明细对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteTInboundDetailByIds(String ids)
    {
        String[] strings = Convert.toStrArray(ids);
        for (String id : strings) {
            TInboundDetail tInboundDetail = tInboundDetailMapper.selectTInboundDetailById(Long.valueOf(id));
            TInbound tInbound = tInboundMapper.selectTInboundByCode(tInboundDetail.getInboundCode());
            if(tInbound == null){
                throw new RuntimeException("删除失败，入库单未找到！");
            }
            if("2".equals(tInbound.getStatus())){
                throw new RuntimeException("删除失败，入库单已经完成！");
            }
        }
        return tInboundDetailMapper.deleteTInboundDetailByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除入库单明细信息
     * 
     * @param id 入库单明细ID
     * @return 结果
     */
    @Override
    public int deleteTInboundDetailById(Long id)
    {
        return tInboundDetailMapper.deleteTInboundDetailById(id);
    }
}
