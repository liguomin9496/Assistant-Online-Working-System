package com.jzy.config;

import com.jzy.manager.util.FileUtils;
import com.jzy.model.CampusEnum;
import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import java.io.File;

/**
 * @author JinZhiyun
 * @version 1.0
 * @ClassName FilePathProperties
 * @description 读取自定义资源文件FilePath.properties的配置类
 * @date 2019/11/18 10:37
 **/
@Data
@Configuration
@PropertySource("classpath:myConfig/filePath.properties")
public class FilePathProperties {
    private static final String SEPARATOR =File.separator;

    @Value("${project.root.path}")
    private String root;

    @Value("${upload.userIcon.directory}")
    private String uploadUserIconDirectory;

    @Value("${toolbox.directory}")
    private String toolboxDirectory;

    @Value("${toolbox.example.directory}")
    private String toolboxExampleDirectory;

    @Value("${toolbox.template.directory}")
    private String toolboxTemplateDirectory;

    /**
     * 返回用户上传头像所存储目录
     *
     * @return
     */
    public String getUploadUserIconPath() {
        return root+ SEPARATOR +uploadUserIconDirectory+ SEPARATOR;
    }

    /**
     * 工具箱上传表格示例的目录
     *
     * @return
     */
    public String getToolboxExamplePath() {
        return root+ SEPARATOR +toolboxDirectory+ SEPARATOR +toolboxExampleDirectory+ SEPARATOR;
    }

    /**
     * 工具箱上传表格示例的全路径，根据key确定具体文件
     *
     * @return
     */
    public String getToolboxExamplePathAndNameByKey(Integer key) {
        return getToolboxExamplePath()+FileUtils.EXAMPLES.get(key);
    }

    /**
     * 工具箱表格模板的目录
     *
     * @return
     */
    public String getToolboxTemplatePath() {
        return root+ SEPARATOR +toolboxDirectory+ SEPARATOR +toolboxTemplateDirectory+ SEPARATOR;
    }

    /**
     * 工具箱指定校区的助教工作手册模板的目录
     *
     * @return
     */
    public String getToolboxAssistantTutorialTemplatePathAndName(String campus) {
        return getToolboxTemplatePath()+CampusEnum.getCampusEnumByNameString(campus)+SEPARATOR+FileUtils.TEMPLATES.get(1);
    }

    /**
     * 工具箱指定校区的座位表模板的目录
     *
     * @return
     */
    public String getToolboxSeatTableTemplatePathAndName(String campus) {
        return getToolboxTemplatePath()+CampusEnum.getCampusEnumByNameString(campus)+SEPARATOR+FileUtils.TEMPLATES.get(2);
    }

    /**
     * 工具箱指定校区的补课单模板的目录
     *
     * @return
     */
    public String getToolboxMissLessonTemplatePathAndName(String campus) {
        return getToolboxTemplatePath()+CampusEnum.getCampusEnumByNameString(campus)+SEPARATOR+FileUtils.TEMPLATES.get(3);
    }
}
