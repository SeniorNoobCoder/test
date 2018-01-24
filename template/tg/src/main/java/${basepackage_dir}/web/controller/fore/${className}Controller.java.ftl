package ${basepackage}.web.controller.fore;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.github.pagehelper.Page;
import com.turingoal.common.bean.TgResponse4PageGridBean;
import com.turingoal.common.bean.TgResponseBean;
import com.turingoal.common.constants.TgConstantPattern4SimpleDateFormat;
import com.turingoal.common.exception.TgBusinessException;
import com.turingoal.common.exception.TgValidationException;
import com.turingoal.common.support.spring.TgSpringBaseController;
import com.turingoal.common.support.validator.TgSpringValidationUtil;
import ${basepackage}.domain.${table.className};
import ${basepackage}.domain.form.${table.className}Form;
import ${basepackage}.domain.query.${table.className}Query;
import ${basepackage}.service.${table.className}Service;

/**
 * [${table.className}]Controller   ${table.remarks!""}
 */
@Controller
@RequestMapping("/m/${table.classNameFirstLower}")
public class ${table.className}Controller extends TgSpringBaseController {
    private static final String LIST_PAGE = "fore/modules/${table.classNameFirstLower}/list";
    private static final String ADD_PAGE = "fore/modules/${table.classNameFirstLower}/add";
    private static final String EDIT_PAGE = "fore/modules/${table.classNameFirstLower}/edit";
    private static final String SHOW_PAGE = "fore/modules/${table.classNameFirstLower}/show";
    @Autowired
    private ${table.className}Service ${table.classNameFirstLower}Service;
    
    /**
     * [${table.className}]列表页面
     */
    @GetMapping(value = "/list.htm")
    public String listPage() throws TgBusinessException {
        return LIST_PAGE;
    }
    
    /**
     * 查询[${table.className}]
     */
    @RequestMapping(value = "/find.htm")
    @ResponseBody
    public TgResponseBean find(final ${table.className}Query query) throws TgBusinessException {
        List<${table.className}> result = ${table.classNameFirstLower}Service.find(query);
        return new TgResponseBean(result);
    }
    
    /**
     * 分页查询[${table.className}]
     */
    @RequestMapping(value = "/findByPage.htm")
    @ResponseBody
    public TgResponse4PageGridBean findByPage(final ${table.className}Query query) throws TgBusinessException {
        Page<${table.className}> result = ${table.classNameFirstLower}Service.findByPage(query);
        return new TgResponse4PageGridBean(result.getTotal(), result.getPageNum(), result.getPageSize(), result.getResult());
    }
    
    /**
     * 查询全部[${table.className}]
     */
    @RequestMapping(value = "/findAll.htm")
    @ResponseBody
    public TgResponseBean findAll() throws TgBusinessException {
        List<${table.className}> result = ${table.classNameFirstLower}Service.findAll();
        return new TgResponseBean(result);
    }
    
    /**
     * 查询启用的[${table.className}]
     */
    @RequestMapping(value = "/findEnabled.htm")
    @ResponseBody
    public TgResponseBean findEnabled() throws TgBusinessException {
        List<${table.className}> result = ${table.classNameFirstLower}Service.findEnabled();
        return new TgResponseBean(result);
    }
    
    /**
     * 通过id得到一个[${table.className}]
     */
    @RequestMapping(value = "/get.htm")
    @ResponseBody
    public TgResponseBean get(@RequestParam("id") final String id) throws TgBusinessException {
        ${table.className} ${table.classNameFirstLower} = ${table.classNameFirstLower}Service.get(id);
        return new TgResponseBean(${table.classNameFirstLower});
    }
    
    /**
     * 通过编码得到一个[${table.className}]
     */
    @RequestMapping(value = "/getByCodeNum.htm")
    @ResponseBody
    public TgResponseBean getByCodeNum(@RequestParam("codeNum") final String codeNum) throws TgBusinessException {
        ${table.className} ${table.classNameFirstLower} = ${table.classNameFirstLower}Service.getByCodeNum(codeNum);
        return new TgResponseBean(${table.classNameFirstLower});
    }
    
    /**
     * 新增[${table.className}]页面
     */
    @GetMapping(value = "/add.htm")
    public String addPage() throws TgBusinessException {
        return ADD_PAGE;
    }
    
    /**
     * 新增[${table.className}]
     */
    @PostMapping(value = "/add.htm")
    @ResponseBody
    public final TgResponseBean add(@Validated({ TgValidGroupAdd.class }) @ModelAttribute("form") final ${table.className}Form form, final BindingResult bindingResult) throws TgBusinessException, TgValidationException {
        TgSpringValidationUtil.checkBindingResult(bindingResult); // 数据校验
        ${table.classNameFirstLower}Service.add(form);
        return new TgResponseBean(TgResponseBean.SUCCESS);
    }
    
    /**
     * 修改[${table.className}]页面
     */
    @GetMapping(value = "/edit_{id}.htm")
    public ModelAndView editPage(@PathVariable final String id) throws TgBusinessException {
        ModelAndView mav = new ModelAndView(EDIT_PAGE);
        mav.addObject("result", ${table.classNameFirstLower}Service.get(id));
        return mav;
    }

    /**
     * 修改[${table.className}]
     */
    @PostMapping(value = "/update.htm")
    @ResponseBody
    public final TgResponseBean update(@Validated({ TgValidGroupUpdate.class }) @ModelAttribute("form") final ${table.className}Form form, final BindingResult bindingResult) throws TgBusinessException, TgValidationException {
        TgSpringValidationUtil.checkBindingResult(bindingResult); // 数据校验
        ${table.classNameFirstLower}Service.update(form);
        return new TgResponseBean(TgResponseBean.SUCCESS);
    }
    
    /**
     * 根据id删除一个[${table.className}]
     */
    @RequestMapping(value = "/delete_{id}.htm")
    @ResponseBody
    public final TgResponseBean delete(@PathVariable("id") final String id) throws TgBusinessException {
        ${table.classNameFirstLower}Service.delete(id);
        return new TgResponseBean(TgResponseBean.SUCCESS);
    }
    
    /**
     * 启用[${table.className}]
     */
    @RequestMapping(value = "/enable_{id}.htm")
    @ResponseBody
    public final TgResponseBean enable(@PathVariable("id") final String id) throws TgBusinessException {
        ${table.classNameFirstLower}Service.enable(id);
        return new TgResponseBean(TgResponseBean.SUCCESS);
    }
    
    /**
     * 停用[${table.className}]
     */
    @RequestMapping(value = "/disable_{id}.htm")
    @ResponseBody
    public final TgResponseBean disable(@PathVariable("id") final String id) throws TgBusinessException {
        ${table.classNameFirstLower}Service.disable(id);
        return new TgResponseBean(TgResponseBean.SUCCESS);
    }
    
    /**
     * 将form表单里面的String Date转换成Date型，字符串去掉空白。需要修改日期格式的话修改下面SimpleDateFormat的参数。
     */
    @InitBinder
    protected final void initBinder(final HttpServletRequest request, final ServletRequestDataBinder binder) throws Exception {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat(TgConstantPattern4SimpleDateFormat.YYYY_MM_DD), true));
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }
}