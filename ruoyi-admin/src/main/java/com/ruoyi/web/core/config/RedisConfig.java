package com.ruoyi.web.core.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import redis.clients.jedis.Jedis;

@Configuration  //标识我是配置类
@PropertySource("classpath:/properties/redis.properties")
public class RedisConfig {

    @Value("${redis.host}")
    private String  host;
    @Value("${redis.port}")
    private Integer port;

    @Bean
    public Jedis jedis(){
        //数据写死?????????
        return new Jedis(host,port);
    }
}