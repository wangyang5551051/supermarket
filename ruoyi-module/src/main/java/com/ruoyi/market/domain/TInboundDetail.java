package com.ruoyi.market.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 入库单明细对象 t_inbound_detail
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public class TInboundDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 入库单号 */
    @Excel(name = "入库单号")
    private String inboundCode;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String name;

    @Excel(name = "单位")
    private String unit;

    @Excel(name = "类型名称")
    private String typeName;

    /** 商品ID */
    private Long goodsId;

    /** 类型ID */
    private Long typeId;

    /** 数量 */
    @Excel(name = "数量")
    private Long num;

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setInboundCode(String inboundCode) 
    {
        this.inboundCode = inboundCode;
    }

    public String getInboundCode() 
    {
        return inboundCode;
    }
    public void setGoodsId(Long goodsId) 
    {
        this.goodsId = goodsId;
    }

    public Long getGoodsId() 
    {
        return goodsId;
    }
    public void setNum(Long num) 
    {
        this.num = num;
    }

    public Long getNum() 
    {
        return num;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("inboundCode", getInboundCode())
            .append("goodsId", getGoodsId())
            .append("num", getNum())
            .toString();
    }
}
