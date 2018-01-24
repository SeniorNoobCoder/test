package ${basepackage}.service;

import java.util.List;
import com.github.pagehelper.Page;
import com.turingoal.common.exception.BusinessException;
import ${basepackage}.domain.${table.className};
import ${basepackage}.domain.form.${table.className}Form;
import ${basepackage}.domain.query.${table.className}Query;

/**
 * [${table.className}]Service ${table.remarks!""}
 */
public interface ${table.className}Service {
    /**
     * 查询[${table.className}]
     */
    List<${table.className}> find(final ${table.className}Query query);
    
    /**
     * 分页查询[${table.className}]
     */
    Page<${table.className}> findByPage(final ${table.className}Query query);
    
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
     * 启用[${table.className}]
     */
    void enable(final String id);

    /**
     * 停用[${table.className}]
     */
    void disable(final String id);
}