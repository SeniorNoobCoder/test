<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.2//EN" 
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${basepackage}.repository.${table.className}Dao">
    
    <!-- 查询[${table.className}] -->
    <select id="find" parameterType="${basepackage}.domain.query.${table.className}Query" resultType="${basepackage}.domain.${table.className}">
        SELECT * FROM ${table.sqlName}
    </select>
    
    <!-- 查询全部[${table.className}] -->
    <select id="findAll" resultType="${basepackage}.domain.${table.className}">
        SELECT * FROM ${table.sqlName}
    </select>
    
    <!-- 查询启用的[${table.className}] -->
    <select id="findEnabled" resultType="${basepackage}.domain.${table.className}">
        SELECT * FROM ${table.sqlName} WHERE enabled = 1 
    </select>
    
    <!-- 通过id得到一个[${table.className}] -->
    <select id="get" parameterType="string" resultType="${basepackage}.domain.${table.className}">
        SELECT * FROM ${table.sqlName} WHERE id = ######REPLACE{id}
    </select>
    
    <!-- 通过编码得到一个[${table.className}]-->
    <select id="getByCodeNum" parameterType="String" resultType="${basepackage}.domain.${table.className}">
        SELECT * FROM ${table.sqlName} WHERE code_num = ######REPLACE{codeNum} LIMIT 1
    </select>
    
    <!-- 新增[${table.className}] -->
    <insert id="add" parameterType="${basepackage}.domain.form.${table.className}Form">
        INSERT INTO ${table.sqlName} (
            <#list table.columns as column><#if column.sqlName == "update_data_time"><#elseif column.sqlName == "update_data_username"><#else>${column.sqlName}<#if column_has_next>, </#if></#if></#list>
        )
        VALUES(
            <#list table.columns as column><#if column.sqlName == "update_data_time"><#elseif column.sqlName == "update_data_username"><#else>######REPLACE{${column.columnNameFirstLower}}<#if column_has_next>, </#if></#if></#list>
        )
    </insert>
    
    <!-- 修改[${table.className}] -->
    <update id="update" parameterType="${basepackage}.domain.form.${table.className}Form">
        UPDATE ${table.sqlName} SET
            <#list table.columns as column>
                <#if column.sqlName == "id">
                <#elseif column.sqlName == "create_data_time">
                <#elseif column.sqlName == "create_data_username">
                <#else>
            ${column.sqlName} = ######REPLACE{${column.columnNameFirstLower}}<#if column_has_next>, </#if>
                </#if>
            </#list>
        WHERE id = ######REPLACE{id}
    </update>

    <!-- 根据id删除一个[${table.className}] -->
    <delete id="delete" parameterType="string">
        DELETE FROM ${table.sqlName} WHERE id = ######REPLACE{id}
    </delete>

    <!-- 修改[${table.className}]是否可用 -->
    <update id="changeEnabled">
        UPDATE ${table.sqlName} SET enabled=######REPLACE{enabled} WHERE id = ######REPLACE{id}
    </update>
</mapper>
