//package com.ruoyi.common.config;
//
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.context.annotation.PropertySource;
//import redis.clients.jedis.JedisPool;
//import redis.clients.jedis.JedisPoolConfig;
//
//@Configuration  //标识我是配置类
//@PropertySource("classpath:/properties/application.properties")
//public class RedisConfig {
//
//    @Value("${spring.redis.host}")
//    private String host;
//    @Value("${spring.redis.port}")
//    private Integer port;
//
////    @Bean
////    public Jedis jedis(){
////        return new Jedis(host,port);
////    }
//
//    @Bean
//    public JedisPool redisPoolFactory() throws Exception {
//        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
//        // 设置最大连接数，（根据并发请求合理设置）。
//        jedisPoolConfig.setMaxTotal(100);
//        // 设置最大空闲连接数，（根据并发请求合理设置）
//        jedisPoolConfig.setMaxIdle(20);
//        // 多长空闲时间之后回收空闲连接
//        jedisPoolConfig.setMinEvictableIdleTimeMillis(60000);
//        // 设置最小空闲连接数或者说初始化连接数
//        jedisPoolConfig.setMinIdle(10);
//        // 设置最大等待时间
//        jedisPoolConfig.setMaxWaitMillis(500);
//        JedisPool jedisPool = new JedisPool(jedisPoolConfig, host, port);
//        return jedisPool;
//    }
//}