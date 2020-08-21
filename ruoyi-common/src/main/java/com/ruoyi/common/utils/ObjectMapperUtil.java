package com.ruoyi.common.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ObjectMapperUtil {

    //1.创建工具API 对象
    private final static ObjectMapper MAPPER = new ObjectMapper();

    //2.封装APi 将对象转化为JSON
    public static String toJson(Object object){

        if ( object == null ){
            throw new RuntimeException("传入对象不能为空");
        }
        try {
            String json = MAPPER.writeValueAsString(object);
            return json;
        }catch (JsonProcessingException e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }

    public static <T> T toObject(String json,Class<T> target){
        //1.校验参数是否有效
        if( json == null || "".equals(json) ){
            throw new RuntimeException("参数不能为空");
        }

        try {
            T t = MAPPER.readValue(json, target);
            return t;
        }catch (java.io.IOException e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }


}
