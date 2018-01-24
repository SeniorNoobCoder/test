package ${basepackage}.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.turingoal.common.annotation.TgMethodLog;
import com.turingoal.common.constants.TgConstantYesNo;
import ${basepackage}.commons.TgSystemHelper;
import ${basepackage}.domain.${table.className};
import ${basepackage}.domain.form.${table.className}Form;
import ${basepackage}.domain.query.${table.className}Query;
import ${basepackage}.repository.${table.className}Dao;
import ${basepackage}.service.${table.className}Service;


/**
 * [${table.className}]Service ${table.remarks!""}
 */
@Service
public class ${table.className}ServiceImpl implements ${table.className}Service {
    @Autowired 
    private ${table.className}Dao ${table.classNameFirstLower}Dao;
    
    /**
     * 查询[${table.className}]
     */
    @TgMethodLog(name = "查询[${table.className}]", description = "根据条件查询[${table.className}]")
    public List<${table.className}> find(final ${table.className}Query query) {
        return ${table.classNameFirstLower}Dao.find(query);
    }
    
    /**
     * 分页查询[${table.className}]
     */
    @TgMethodLog(name = "分页查询[${table.className}]", description = "根据条件分页查询[${table.className}]")
    public Page<${table.className}> findByPage(final ${table.className}Query query) {
        PageHelper.startPage(query.getPage().intValue(), query.getLimit().intValue());
        return (Page<${table.className}>) ${table.classNameFirstLower}Dao.find(query);
    }
    
    /**
     * 查询全部[${table.className}]
     */
    @TgMethodLog(name = "查询全部[${table.className}]", description = "查询全部[${table.className}]")
    public List<${table.className}> findAll() {
        return ${table.classNameFirstLower}Dao.findAll();
    }
    
    /**
     * 查询启用的[${table.className}]
     */
    @TgMethodLog(name = "查询启用的[${table.className}]", description = "查询启用的[${table.className}]")
    public List<${table.className}> findEnabled() {
        return ${table.classNameFirstLower}Dao.findEnabled();
    }

    /**
     * 通过id得到一个[${table.className}]
     */
    @TgMethodLog(name = "通过id得到一个[${table.className}]", description = "得到id为(######REPLACE{['id']})的[${table.className}]")
    public ${table.className} get(final String id) {
        return ${table.classNameFirstLower}Dao.get(id);
    }
    
    /**
     * 通过编码得到一个[${table.className}]
     */
    @TgMethodLog(name = "通过编码得到一个[${table.className}]", description = "得到编码为(######REPLACE{['codeNum']})的[${table.className}]")
    public ${table.className} getByCodeNum(final String codeNum) {
        return ${table.classNameFirstLower}Dao.getByCodeNum(codeNum);
    }
    
    /**
     * 新增[${table.className}]
     */
    @TgMethodLog(name = "新增[${table.className}]", description = "新增id为(######REPLACE{['form'].id})的[${table.className}]")
    public void add(final ${table.className}Form form) {
        form.setCreateDataUsername(TgSystemHelper.getCurrentUsername());
        ${table.classNameFirstLower}Dao.add(form);
    }

    /**
     * 修改[${table.className}]
     */
    @TgMethodLog(name = "修改[${table.className}]", description = "修改id为(######REPLACE{['form'].id})的[${table.className}]")
    public int update(final ${table.className}Form form) {
        form.setUpdateDataUsername(TgSystemHelper.getCurrentUsername());
        return ${table.classNameFirstLower}Dao.update(form);
    }
    
    /**
     * 根据id删除一个[${table.className}]
     */
    @TgMethodLog(name = "删除[${table.className}]", description = "删除id为(######REPLACE{['id']})的[${table.className}]")
    public int delete(final String id) {
        return ${table.classNameFirstLower}Dao.delete(id);
    }
    
     /**
     * 启用[${table.className}]
     */
    @TgMethodLog(name = "启用[${table.className}]", description = "启用id为(######REPLACE{['id']})的[${table.className}]")
    public void enable(final String id) {
        ${table.classNameFirstLower}Dao.changeEnabled(id, TgConstantYesNo.YES);
    }

    /**
     * 停用[${table.className}]
     */
    @TgMethodLog(name = "停用[${table.className}]", description = "停用id为(######REPLACE{['id']})的[${table.className}]")
    public void disable(final String id) {
        ${table.classNameFirstLower}Dao.changeEnabled(id, TgConstantYesNo.NO);
    }
}