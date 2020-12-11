package com.ruoyi.market.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 盘点记录对象 t_inventory_record
 * 
 * @author ruoyi
 * @date 2020-12-10
 */
public class TInventoryRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 商品ID */
    private Long goodsId;

    /** 类型ID */
    private Long typeId;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 名称 */
    @Excel(name = "类型名称")
    private String typeName;

    /** 单位 */
    @Excel(name = "单位")
    private String unit;

    /** 原库存 */
    @Excel(name = "原库存")
    private BigDecimal oldNum;

    /** 新库存 */
    @Excel(name = "新库存")
    private BigDecimal newNum;

    @Excel(name = "变更库存")
    private BigDecimal num;

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }

    public BigDecimal getNum() {
        if(newNum !=null && oldNum !=null){
            return newNum.subtract(oldNum);
        }
        return num;
    }

    public void setNum(BigDecimal num) {
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setGoodsId(Long goodsId) 
    {
        this.goodsId = goodsId;
    }

    public Long getGoodsId() 
    {
        return goodsId;
    }
    public void setOldNum(BigDecimal oldNum) 
    {
        this.oldNum = oldNum;
    }

    public BigDecimal getOldNum() 
    {
        return oldNum;
    }
    public void setNewNum(BigDecimal newNum) 
    {
        this.newNum = newNum;
    }

    public BigDecimal getNewNum() 
    {
        return newNum;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("goodsId", getGoodsId())
            .append("oldNum", getOldNum())
            .append("newNum", getNewNum())
            .toString();
    }
}
