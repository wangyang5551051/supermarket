package com.ruoyi.market.service.impl;

import java.util.Date;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroCommonUtils;
import com.ruoyi.common.utils.StringUtils;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.market.mapper.TInboundMapper;
import com.ruoyi.market.domain.TInbound;
import com.ruoyi.market.service.ITInboundService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.transaction.annotation.Transactional;

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
        tInbound.setInboundCode(getCode());
        tInbound.setStatus("1");
        tInbound.setCreateBy(ShiroCommonUtils.getSysUser().getUserName());
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
    @Transactional
    public int updateTInbound(TInbound tInbound)
    {
        TInbound inbound = tInboundMapper.selectTInboundById(tInbound.getId());
        if("2".equals(inbound.getStatus())){
            throw new RuntimeException("入库失败，入库单已经完成！");
        }
        tInbound.setStatus("2");
        return tInboundMapper.updateTInbound(tInbound);
    }

    /**
     * 删除入库单对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteTInboundByIds(String ids)
    {
        String[] strings = Convert.toStrArray(ids);
        int i = tInboundMapper.deleteTInboundByIds(Convert.toStrArray(ids));
        if(i < strings.length){
            throw new RuntimeException("删除失败，入库单已经完成！");
        }
        return i;
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

    private synchronized String getCode(){
        String time = DateUtils.getDateYMD();
        String code =  tInboundMapper.getCodeMax(time);
        if(!StringUtils.isEmpty(code)){
            return time+String.format("%02d", Integer.valueOf(code)+1);
        }
        return time+"01";
    }
}
