package ${basepackage}.domain.query;

import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import com.turingoal.common.bean.TgBaseQueryBean;

/**
 * [${table.className}]Query ${table.remarks!""}
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ${table.className}Query extends TgBaseQueryBean implements Serializable {
    private static final long serialVersionUID = 1L;
    <#list table.columns as column>
       <#if column.sqlName == "create_data_time">
       <#elseif column.sqlName == "create_data_username">
       <#elseif column.sqlName == "update_data_time">
       <#elseif column.sqlName == "update_data_username">
       <#else>
    private ${column.possibleShortJavaType} ${column.columnNameFirstLower}; // ${column.columnAlias}
       </#if>
   </#list>
}