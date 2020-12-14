package com.ruoyi.market.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商品对象 t_goods
 * 
 * @author ruoyi
 * @date 2020-12-09
 */
public class TGoods extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 名称 */
    @Excel(name = "类型名称")
    private String typeName;

    /** 类型ID */
    private Long typeId;

    /** 库存 */
    @Excel(name = "库存")
    private BigDecimal num;

    /** 价格 */
    @Excel(name = "价格")
    private BigDecimal price;

    /** 单位 */
    @Excel(name = "单位")
    private String unit;

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
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setTypeId(Long typeId) 
    {
        this.typeId = typeId;
    }

    public Long getTypeId() 
    {
        return typeId;
    }
    public void setNum(BigDecimal num) 
    {
        this.num = num;
    }

    public BigDecimal getNum() 
    {
        return num;
    }
    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
    }
    public void setUnit(String unit) 
    {
        this.unit = unit;
    }

    public String getUnit() 
    {
        return unit;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("name", getName())
            .append("typeId", getTypeId())
            .append("num", getNum())
            .append("price", getPrice())
            .append("unit", getUnit())
            .toString();
    }
}
