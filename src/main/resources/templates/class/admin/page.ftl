<#assign ctx=request.contextPath/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>班级管理-新东方优能中学助教工作平台</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="icon" href="${ctx}/custom/img/favicon/favicon.ico"/>
    <link rel="stylesheet" href="${ctx}/plugins/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctx}/plugins/layuiadmin/style/admin.css" media="all">
</head>
<body>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-form layui-card-header layuiadmin-card-header-auto">
            <div class="layui-form-item" id="form">
                <div class="layui-inline">
                    <label class="layui-form-label">年份-季度</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" placeholder="yyyy" id="year" name="year">
                    </div>
                    <div class="layui-input-inline">
                        <select name="season" id="season">
                            <option value="">请选择季度</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">校区</label>
                    <div class="layui-input-inline">
                        <select name="campus" id="campus" lay-filter="campus" lay-search>
                            <option value="">请选择校区</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">班级编码</label>
                    <div class="layui-input-inline">
                        <select name="classId" id="classId" lay-search>
                            <option value="">请输入或选择班级编码</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">班级名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="className" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">助教</label>
                    <div class="layui-input-inline">
                        <input type="text" name="assistantName" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">上课教师</label>
                    <div class="layui-input-inline">
                        <input type="text" name="teacherName" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">上课时间</label>
                    <div class="layui-input-inline">
                        <input type="text" name="classTime" placeholder="8:00-10:00" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">上课教室</label>
                    <div class="layui-input-inline">
                        <select name="classroom" id="classroom"
                                lay-search>
                            <option value="">请选择教室</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">年级</label>
                    <div class="layui-input-inline">
                        <select name="grade" id="grade">
                            <option value="">请选择年级</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">学科</label>
                    <div class="layui-input-inline">
                        <select name="subject" id="subject">
                            <option value="">请选择学科</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">班型</label>
                    <div class="layui-input-inline">
                        <select name="type" id="type">
                            <option value="">请选择班型</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">筛选排序</label>
                    <div class="layui-input-inline">
                        <select id="condition1" name="condition1" lay-filter="condition1">
                            <option value="">请选择要排序的类别</option>
                            <option value="classId">按班号排序</option>
                            <option value="className">按班级名称排序</option>
                            <option value="assistantName">按班级助教排序</option>
                            <option value="teacherName">按班级教师排序</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select id="condition2" name="condition2" lay-filter="condition2">
                            <option value="">请选择要排序方式</option>
                            <option value="asc">从低到高</option>
                            <option value="desc">从高到低</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <button class="layui-btn layuiadmin-btn-comm" data-type="reload" lay-submit
                            lay-filter="LAY-app-contcomm-search">
                        <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                    </button>
                    <button class="layui-btn layuiadmin-btn-comm" data-type="reload"
                            id="clear">
                        清空
                    </button>
                    <button class="layui-btn layuiadmin-btn-comm" data-type="batchdel" style="background-color: #5FB878"
                            id="query-my-class-assistant" lay-submit
                            lay-filter="query-my-class-assistant">助教-查询我的班级
                    </button>
                </div>
            </div>
        </div>
        <div class="layui-card-body">
            <div style="padding-bottom: 10px;">
                <button class="layui-btn layuiadmin-btn-list" data-type="batchdel">删除</button>
                <button class="layui-btn layuiadmin-btn-list" data-type="add">添加</button>
            </div>
            <table id="classTables" lay-filter="LAY-app-content-comm"></table>
            <script type="text/html" id="test-table-operate-barDemo1">
                <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="show-class-student">查看该班学生</a>
            </script>
            <script type="text/html" id="table-content-list1">
                <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i
                        class="layui-icon layui-icon-edit"></i>编辑</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i
                        class="layui-icon layui-icon-delete"></i>删除</a>
            </script>
        </div>
    </div>
</div>

<script src="${ctx}/custom/js/external/jquery-3.3.1.min.js"></script>
<script src="${ctx}/custom/js/myButton.js"></script>

<script src="${ctx}/plugins/layuiadmin/layui/layui.js"></script>
<script src="${ctx}/custom/js/myLayVerify.js"></script>
<script>
    layui.config({
        base: '${ctx}/plugins/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'user', 'upload', 'laydate'], function () {
        var $ = layui.$
                , admin = layui.admin
                , form = layui.form
                , table = layui.table
                , laypage = layui.laypage
                , laytpl = layui.laytpl
                , upload = layui.upload
                , laydate = layui.laydate;

        laydate.render({
            elem: '#year'
            ,type: 'year'
            ,value: '${currentYear!""}'
        });


        var campusNames = eval('(' + '${campusNames}' + ')');
        for (var i = 0; i < campusNames.length; i++) {
            var json = campusNames[i];
            var str = "";
            str += '<option value="' + json + '">' + json + '</option>';
            $("#campus").append(str);
        }

        var seasons = eval('(' + '${seasons}' + ')');
        for (var i = 0; i < seasons.length; i++) {
            var json = seasons[i];
            var str = "";
            str += '<option value="' + json + '">' + json + '</option>';
            $("#season").append(str);
        }

        var classIds = eval('(' + '${classIds}' + ')');
        for (var i = 0; i < classIds.length; i++) {
            var json = classIds[i];
            var str = "";
            str += '<option value="' + json + '">' + json + '</option>';
            $("#classId").append(str);
        }

        var grades = eval('(' + '${grades}' + ')');
        for (var i = 0; i < grades.length; i++) {
            var json = grades[i];
            var str = "";
            str += '<option value="' + json + '">' + json + '</option>';
            $("#grade").append(str);
        }

        var subjects = eval('(' + '${subjects}' + ')');
        for (var i = 0; i < subjects.length; i++) {
            var json = subjects[i];
            var str = "";
            str += '<option value="' + json + '">' + json + '</option>';
            $("#subject").append(str);
        }

        var types = eval('(' + '${types}' + ')');
        for (var i = 0; i < types.length; i++) {
            var json = types[i];
            var str = "";
            str += '<option value="' + json + '">' + json + '</option>';
            $("#type").append(str);
        }

        $("#season").val('${currentSeason!""}');

        form.render();

        //联动监听select
        form.on('select(campus)', function (data) {
            $("#classroom").empty();
            $("#classroom").append('<option value="">请选择教室</option>');
            var campus_name = $(this).attr("lay-value");
            $.ajax({
                type: "get",
                data: {campusName: campus_name},
                url: "${ctx}/class/getClassroomsByCampus",
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {
                        var json = data[i];
                        $("#classroom").append('<option value="' + json + '">' + json + '</option>');
                    }
                    form.render('select');
                }
            });
        });

        //方法级渲染
        table.render({
            elem: '#classTables'
            , url: '${ctx}/class/admin/getClassInfo' //向后端默认传page和limit
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                , layEvent: 'LAYTABLE_TIPS'
                , icon: 'layui-icon-tips'
            }]
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'id', sort: true, hide: true}
                , {field: 'createTime', title: '创建时间', sort: true, hide: true}
                , {field: 'updateTime', title: '更新时间', sort: true, hide: true}
                , {field: 'classId', title: '班级编码', width: 150, sort: true}
                , {field: 'className', title: '班级名称', sort: true}
                , {field: 'classCampus', title: '校区', width: 80, sort: true}
                , {field: 'classGrade', title: '年级', width: 110, sort: true, hide: true}
                , {field: 'classSubject', title: '学科', width: 80, sort: true, hide: true}
                , {field: 'classType', title: '班型', width: 80, sort: true, hide: true}
                , {field: 'classYear', title: '年份', width: 80, sort: true}
                , {field: 'classSeason', title: '季度', width: 80, sort: true}
                , {field: 'classTime', title: '详细上课时间', hide: true}
                , {field: 'classSimplifiedTime', title: '上课时间', width: 120}
                , {field: 'classTimes', title: '上课次数', width: 110, hide: true}
                , {field: 'assistantName', title: '助教', width: 110, sort: true}
                , {field: 'teacherName', title: '任课教师', width: 110, sort: true}
                , {field: 'classroom', title: '上课教室', width: 110}
                , {field: 'classTeacherRequirement', title: '任课老师要求', hide: true}
                , {field: 'classRemark', title: '备注', hide: true}
                , {field: 'classStudentsCount', title: '班级人数', width: 110}
                , {width: 130, title: '', toolbar: '#test-table-operate-barDemo1'}
                , {title: '操作', minWidth: 150, align: 'center', fixed: 'right', toolbar: '#table-content-list1'}
            ]]
            , where: {
                classYear: '${currentYear!""}'
                , classSeason: '${currentSeason!""}'
            }
            , page: true
            , limit: 10
            , limits: [5, 10, 15, 20, 9999999]
            , request: {
                pageName: 'pageNum',
                limitName: 'pageSize'  //如不配置，默认为page=1&limit=10
            }
            , done: function (res, curr, count) {
                //如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                //console.log(res);

                //得到当前页码
                //console.log(curr);

                //得到数据总量
                //console.log(count);
            }

        });

        $("#clear").click(function () {
            $("#form input").val("");
            $("#form select").val("");
        });

        //监听搜索
        form.on('submit(query-my-class-assistant)', function (data) {
            var field = data.field;
            //执行重载
            table.reload('classTables', {
                url: '${ctx}/class/admin/getOwnClassInfoByAssistant' //向后端默认传page和limit
                , where: { //设定异步数据接口的额外参数，任意设
                    classYear: field.year
                    , classSeason: field.season
                    , classCampus: field.campus
                }
                , request: {
                    pageName: 'pageNum',
                    limitName: 'pageSize'  //如不配置，默认为page=1&limit=10
                }
                , page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
        });

        //监听查询我的班级
        form.on('submit(LAY-app-contcomm-search)', function (data) {
            var field = data.field;
            //执行重载
            table.reload('classTables', {
                url: '${ctx}/class/admin/getClassInfo' //向后端默认传page和limit
                , where: { //设定异步数据接口的额外参数，任意设
                    classYear: field.year
                    , classSeason: field.season
                    , classCampus: field.campus
                    , classId: field.classId
                    , className: field.className
                    , assistantName: field.assistantName
                    , teacherName: field.teacherName
                    , classTime: field.classTime
                    , classGrade: field.grade
                    , classSubject: field.subject
                    , classType: field.type
                    , classroom: field.classroom
                    , condition1: field.condition1
                    , condition2: field.condition2
                }
                , request: {
                    pageName: 'pageNum',
                    limitName: 'pageSize'  //如不配置，默认为page=1&limit=10
                }
                , page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
        });


        var $ = layui.$, active = {
            batchdel: function () {
                var checkStatus = table.checkStatus('classTables')
                        , checkData = checkStatus.data; //得到选中的数据

                if (checkData.length === 0) {
                    return layer.msg('请选择数据');
                }

                // console.log(JSON.stringify(checkData));
                // console.log(checkStatus);
                // console.log(checkData);
                layer.confirm('确定要删除' + checkData.length + '条数据吗？', function (index) {
                    //执行 Ajax 后重载
                    $.ajax({
                        type: 'post',
                        data: {assistants: JSON.stringify(checkData)},
                        url: "${ctx}/assistant/admin/deleteMany",
                        beforeSend: function (data) {
                            layer.load(1, {shade: [0.1, '#fff']}); //上传loading
                        }
                        , success: function (data) {
                            layer.closeAll('loading'); //关闭loading
                            if (data.data === "success") {
                                layer.msg('已删除');
                                table.reload('classTables', {
                                    url: '${ctx}/assistant/admin/getAssistantInfo' //向后端默认传page和limit); //重载表格
                                    , request: {
                                        pageName: 'pageNum',
                                        limitName: 'pageSize'  //如不配置，默认为page=1&limit=10
                                    }
                                    , page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                });
                            } else {
                                layer.msg('未知错误');
                            }
                        }

                    });

                });
            },
            add: function () {
                var index = layer.open({
                    type: 2
                    , title: '添加助教'
                    , content: '${ctx}/assistant/admin/updateForm'
                    , maxmin: true
                    , btn: ['确定', '取消']
                    , yes: function (index, layero) {
                        //点击确认触发 iframe 内容中的按钮提交
                        var iframeWindow = window['layui-layer-iframe' + index]
                                , submit = layero.find('iframe').contents().find("#layuiadmin-app-form-submit");

                        iframeWindow.layui.form.on('submit(layuiadmin-app-form-submit)', function (data) {
                            var field = data.field; //获取提交的字段
                            // var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                            var json = {
                                    assistantWorkId: field.workId
                                    , assistantName: field.name
                                    , assistantSex: field.sex
                                    , assistantDepart: field.depart
                                    , assistantCampus: field.campus
                                    , assistantPhone: field.phone
                                    , assistantRemark: field.remark
                            };

                            //提交 Ajax 成功后，关闭当前弹层并重载表格
                            $.ajax({
                                data: json,
                                type: 'post',
                                url: "${ctx}/assistant/admin/insert",
                                beforeSend: function (data) {
                                    layer.load(1, {shade: [0.1, '#fff']}); //上传loading
                                }
                                , success: function (data) {
                                    layer.closeAll('loading'); //关闭loading
                                    if (data.data === "success") {
                                        layer.msg('添加成功', {
                                            icon: 1
                                            , time: 1000
                                        });

                                        layer.close(index); //再执行关闭
                                    } else if (data.data === "workIdRepeat") {
                                        return layer.msg('对不起，该工号已存在！');
                                    } else if (data.data === "nameRepeat") {
                                        return layer.msg('对不起，该助教姓名已存在！');
                                    } else {
                                        return layer.msg('未知错误');
                                    }
                                }
                            });

                        });
                        submit.trigger('click');

                    }
                });
                layer.full(index);
            }
        };

        $('.layui-btn.layuiadmin-btn-list').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


        //监听工具条
        table.on('tool(LAY-app-content-comm)', function (obj) {
            var data = obj.data;
            if (obj.event === 'show-class-student') {
                <#--location.href = '${ctx}/studentAndClass/admin/page';-->
                //打开一个新页面
                var othis = $(this)
                        , href = '${ctx}/studentAndClass/admin/page?classId='+data.classId
                        , text = "上课信息"
                        , router = layui.router();


                var topLayui = parent === self ? layui : top.layui;
                topLayui.index.openTabsPage(href, text || othis.text());
            } else if (obj.event === 'del') {
                layer.confirm('确定删除此助教吗？', function (index) {
                    //提交删除ajax
                    $.ajax({
                        data: data,
                        type: 'post',
                        url: "${ctx}/assistant/admin/deleteOne",
                        beforeSend: function (data) {
                            layer.load(1, {shade: [0.1, '#fff']}); //上传loading
                        }
                        , success: function (data) {
                            layer.closeAll('loading'); //关闭loading
                            if (data.data === "success") {
                                layer.msg('删除成功', {
                                    icon: 1
                                    , time: 1000
                                });

                                obj.del();

                                layer.close(index); //关闭弹层
                            } else {
                                return layer.msg('未知错误');
                            }
                        }
                    });
                });
            } else if (obj.event === 'edit') {
                var index = layer.open({
                    type: 2
                    ,
                    title: '编辑班级'
                    ,
                    content: '${ctx}/class/admin/updateForm?id=' + data.id + '&classCampus=' + data.classCampus+ '&classGrade=' + data.classGrade
                    + '&classSubject=' + data.classSubject + '&classType=' + data.classType
                    +'&classSeason=' + data.classSeason +'&classroom=' + data.classroom
                    ,
                    maxmin: true
                    ,
                    btn: ['确定', '取消']
                    ,
                    yes: function (index, layero) {
                        var iframeWindow = window['layui-layer-iframe' + index]
                                , submit = layero.find('iframe').contents().find("#layuiadmin-app-form-edit");

                        //监听提交
                        iframeWindow.layui.form.on('submit(layuiadmin-app-form-edit)', function (data) {
                            var field = data.field; //获取提交的字段
                            var json = {
                                id: field.id
                                , assistantWorkId: field.workId
                                , assistantName: field.name
                                , assistantSex: field.sex
                                , assistantDepart: field.depart
                                , assistantCampus: field.campus
                                , assistantPhone: field.phone
                                , assistantRemark: field.remark
                            };

                            $.ajax({
                                data: json,
                                type: 'post',
                                url: "${ctx}/assistant/admin/updateById",
                                beforeSend: function (data) {
                                    layer.load(1, {shade: [0.1, '#fff']}); //上传loading
                                }
                                , success: function (data) {
                                    layer.closeAll('loading'); //关闭loading
                                    if (data.data === "success") {
                                        layer.msg('修改成功', {
                                            icon: 1
                                            , time: 1000
                                        });

                                        obj.update(json); //数据更新

                                        form.render();

                                        layer.close(index); //关闭弹层
                                    } else if (data.data === "classIdRepeat") {
                                        return layer.msg('对不起，该班号已存在！');
                                    } else if (data.data === "assistantNotExist") {
                                        return layer.msg('对不起，该助教不存在！');
                                    } else if (data.data === "teacherNotExist") {
                                        return layer.msg('对不起，该教师不存在！');
                                    } else {
                                        return layer.msg('未知错误');
                                    }
                                }
                            });

                        });

                        submit.trigger('click');
                    }
                    ,
                    success: function (layero, index) {
                        console.log(data.assistantSex)
                        //给iframe元素赋值
                        var othis = layero.find('iframe').contents().find("#layuiadmin-app-form-list").click();
                        othis.find('input[name="id"]').val(data.id);
                        othis.find('input[name="classId"]').val(data.classId);
                        othis.find('input[name="className"]').val(data.className);
                        othis.find('input[name="year"]').val(data.classYear);
                        othis.find('input[name="sex"][value="男"]').attr("checked", data.assistantSex === '男');
                        othis.find('input[name="sex"][value="女"]').attr("checked", data.assistantSex === '女');
                        othis.find('input[name="depart"]').val(data.assistantDepart);
                        othis.find('input[name="phone"]').val(data.assistantPhone);
                        othis.find('textarea[name="remark"]').val(data.assistantRemark);
                    }
                });
                layer.full(index);
            }
        });

    });
</script>
</body>
</html>