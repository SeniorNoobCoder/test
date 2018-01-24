package ${basepackage}.domain;

import java.io.Serializable;
import com.turingoal.common.util.lang.TgDateUtil;
import lombok.Data;

/**
 * [${table.className}] ${table.remarks!""}
 */
@Data
public class ${table.className} implements Serializable {
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
   
   <#list table.columns as column>
       <#if column.sqlName == "create_data_time">
       <#elseif column.sqlName == "create_data_username">
       <#elseif column.sqlName == "update_data_time">
       <#elseif column.sqlName == "update_data_username">
       <#else>
            <#if column.possibleShortJavaType == "Date">
    /**
     * ${column.columnAlias}
     */
    public String get${column.columnName}Str4Date() {
        return TgDateUtil.date2DateString(${column.columnNameFirstLower});
    }
    
    /**
     * ${column.columnAlias}
     */
    public String get${column.columnName}Str4DateTime() {
        return TgDateUtil.date2DateTimeString(${column.columnNameFirstLower});
    }
            </#if>
            
        </#if>
   </#list>
}