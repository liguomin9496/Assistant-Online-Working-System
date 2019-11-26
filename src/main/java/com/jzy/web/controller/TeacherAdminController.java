package com.jzy.web.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.jzy.manager.constant.Constants;
import com.jzy.manager.util.TeacherUtils;
import com.jzy.model.dto.MyPage;
import com.jzy.model.dto.TeacherSearchCondition;
import com.jzy.model.entity.Teacher;
import com.jzy.model.vo.ResultMap;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName TeacherAdminController
 * @Author JinZhiyun
 * @Description 教师管理的控制器
 * @Date 2019/11/24 16:57
 * @Version 1.0
 **/
@Controller
@RequestMapping("/teacher/admin")
public class TeacherAdminController extends AbstractController{
    private final static Logger logger = Logger.getLogger(TeacherAdminController.class);

    /**
     * 跳转教师管理页面
     *
     * @return
     */
    @RequestMapping("/page")
    public String page(Model model) {
        return "teacher/admin/page";
    }

    /**
     * 查询教师信息的ajax交互
     *
     * @param myPage    分页{页号，每页数量}
     * @param condition 查询条件入参
     * @return
     */
    @RequestMapping("/getTeacherInfo")
    @ResponseBody
    public ResultMap<List<Teacher>> getTeacherInfo(MyPage myPage, TeacherSearchCondition condition) {
        PageInfo<Teacher> pageInfo = teacherService.listTeachers(myPage, condition);
        return new ResultMap<>(0, "", (int) pageInfo.getTotal(), pageInfo.getList());
    }

    /**
     * 重定向到编辑助教权限iframe子页面并返回相应model
     *
     * @param model
     * @param teacher 当前要被编辑的教师信息
     * @return
     */
    @RequestMapping("/updateForm")
    public String updateForm(Model model, Teacher teacher) {
        return "teacher/admin/teacherForm";
    }


    /**
     * 教师管理中的编辑教师请求，由id修改
     *
     * @param teacher 修改后的教师信息
     * @return
     */
    @RequestMapping("/updateById")
    @ResponseBody
    public Map<String, Object> updateById( Teacher teacher) {
        Map<String, Object> map = new HashMap<>(1);

        if (!TeacherUtils.isValidTeacherUpdateInfo(teacher)) {
            String msg = "updateById方法错误入参";
            logger.error(msg);
            throw new InvalidParameterException(msg);
        }

        map.put("data", teacherService.updateTeacherInfo(teacher));

        return map;
    }

    /**
     * 教师管理中的添加教师请求
     *
     * @param teacher 新添加教师的信息
     * @return
     */
    @RequestMapping("/insert")
    @ResponseBody
    public Map<String, Object> insert( Teacher teacher) {
        Map<String, Object> map = new HashMap<>(1);

        if (!TeacherUtils.isValidTeacherUpdateInfo(teacher)) {
            String msg = "insert方法错误入参";
            logger.error(msg);
            throw new InvalidParameterException(msg);
        }
        map.put("data", teacherService.insertTeacher(teacher));

        return map;
    }

    /**
     * 删除一个教师ajax交互
     *
     * @param id 被删除教师的id
     * @return
     */
    @RequestMapping("/deleteOne")
    @ResponseBody
    public Map<String, Object> deleteOne(@RequestParam("id") Long id) {
        Map<String, Object> map = new HashMap(1);

        teacherService.deleteOneTeacherById(id);
        map.put("data", Constants.SUCCESS);
        return map;
    }

    /**
     * 删除多个教师ajax交互
     *
     * @param teachers 多个教师的json串，用fastjson转换为list
     * @return
     */
    @RequestMapping("/deleteMany")
    @ResponseBody
    public Map<String, Object> deleteMany(@RequestParam("teachers") String teachers) {
        Map<String, Object> map = new HashMap(1);

        List<Teacher> teachersParsed = JSON.parseArray(teachers, Teacher.class);
        List<Long> ids = new ArrayList<>();
        for (Teacher teacher : teachersParsed) {
            ids.add(teacher.getId());
        }
        teacherService.deleteManyTeachersByIds(ids);
        map.put("data", Constants.SUCCESS);
        return map;
    }
}