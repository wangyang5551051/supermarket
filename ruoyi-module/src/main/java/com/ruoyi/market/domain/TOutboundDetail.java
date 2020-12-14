package com.ruoyi.market.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.math.BigDecimal;

/**
 * 出库单明细对象 t_outbound_detail
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public class TOutboundDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 出库单号 */
    @Excel(name = "出库单号")
    private String outboundCode;

    /** 商品ID */
    private Long goodsId;

    /** 类型ID */
    private Long typeId;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String name;


    @Excel(name = "类型名称")
    private String typeName;

    /** 数量 */
    @Excel(name = "数量")
    private BigDecimal num;

    @Excel(name = "单位")
    private String unit;

    public String getName() {
        return name;
    }

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }

    public void setName(String name) {
        this.name = name;
    }

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

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setOutboundCode(String outboundCode) 
    {
        this.outboundCode = outboundCode;
    }

    public String getOutboundCode() 
    {
        return outboundCode;
    }
    public void setGoodsId(Long goodsId) 
    {
        this.goodsId = goodsId;
    }

    public Long getGoodsId() 
    {
        return goodsId;
    }
    public void setNum(BigDecimal num)
    {
        this.num = num;
    }

    public BigDecimal getNum()
    {
        return num;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("outboundCode", getOutboundCode())
            .append("goodsId", getGoodsId())
            .append("num", getNum())
            .toString();
    }
}
