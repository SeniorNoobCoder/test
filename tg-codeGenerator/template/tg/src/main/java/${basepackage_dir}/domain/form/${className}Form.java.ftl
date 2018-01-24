package ${basepackage}.domain.form;

import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import com.turingoal.common.bean.TgBaseFormBean;
import com.turingoal.common.util.validator.TgValidGroupUpdate;

/**
 * [${table.className}]Form ${table.remarks!""}
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ${table.className}Form extends TgBaseFormBean implements Serializable {
    private static final long serialVersionUID = 1L;
    <#list table.columns as column>
       <#if column.sqlName == "id">
       <#elseif column.sqlName == "sort_order">
       <#elseif column.sqlName == "priority">
       <#elseif column.sqlName == "editable">
       <#elseif column.sqlName == "deletable">
       <#elseif column.sqlName == "enabled">
       <#elseif column.sqlName == "domain">
       <#elseif column.sqlName == "create_data_time">
       <#elseif column.sqlName == "create_data_username">
       <#elseif column.sqlName == "update_data_time">
       <#elseif column.sqlName == "update_data_username">
       <#else>
    private ${column.possibleShortJavaType} ${column.columnNameFirstLower}; // ${column.columnAlias}
       </#if>
   </#list>
}