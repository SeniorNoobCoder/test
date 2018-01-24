package ${basepackage}.repository;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ${basepackage}.domain.${table.className};
import ${basepackage}.domain.form.${table.className}Form;
import ${basepackage}.domain.query.${table.className}Query;

/**
 * [${table.className}]Dao ${table.remarks!""}
 */
public interface ${table.className}Dao {
    /**
     * 查询[${table.className}]
     */
    List<${table.className}> find(final ${table.className}Query query);
    
    /**
     * 查询全部[${table.className}]
     */
    List<${table.className}> findAll();
    
    /**
     * 查询启用的[${table.className}]
     */
    List<${table.className}> findEnabled();

    /**
     * 通过id得到一个[${table.className}]
     */
    ${table.className} get(final String id);
    
    /**
     * 通过编码得到一个[${table.className}]
     */
    ${table.className} getByCodeNum(final String codeNum);
    
    /**
     * 新增[${table.className}]
     */
    void add(final ${table.className}Form form);

    /**
     * 修改[${table.className}]
     */
    int update(final ${table.className}Form form);
    
    /**
     * 根据id删除一个[${table.className}]
     */
    int delete(final String id);
    
    /**
     * 修改[${table.className}]是否可用
     */
    int changeEnabled(@Param("id") final String id, @Param("enabled") final Integer enabled);
}