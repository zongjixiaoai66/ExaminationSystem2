const menu = {
    list() {
        return [{"backMenu":[{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"用户","menuJump":"列表","tableName":"yonghu"}],"menu":"用户管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"考试统计","menuJump":"列表","tableName":"kaoshitongji"}],"menu":"考试统计管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"专业列表","menuJump":"列表","tableName":"zhuanyeliebiao"}],"menu":"专业列表管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"专业类型","menuJump":"列表","tableName":"zhuanyeleixing"}],"menu":"专业类型管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"考试规则","menuJump":"列表","tableName":"kaoshiguize"}],"menu":"考试规则管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"忘记密码人员登记","menuJump":"列表","tableName":"wangjimimarenyuandengji"}],"menu":"忘记密码人员登记管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"考试评分","menuJump":"列表","tableName":"kaoshipingfen"}],"menu":"考试评分管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"试卷管理","tableName":"exampaper"}],"menu":"试卷管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"试题管理","tableName":"examquestion"}],"menu":"试题管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"考试资讯","tableName":"news"},{"buttons":["查看","修改"],"menu":"轮播图管理","tableName":"config"}],"menu":"系统管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"试卷列表","tableName":"exampaperlist"},{"buttons":["新增","查看","修改","删除"],"menu":"考试记录","tableName":"examrecord"},{"buttons":["新增","查看","修改","删除"],"menu":"错题本","tableName":"examfailrecord"}],"menu":"考试管理"}],"frontMenu":[{"child":[{"buttons":["查看"],"menu":"考试规则列表","menuJump":"列表","tableName":"kaoshiguize"}],"menu":"考试规则模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"管理员","tableName":"users"},{"backMenu":[{"child":[{"buttons":["查看"],"menu":"考试评分","menuJump":"列表","tableName":"kaoshipingfen"}],"menu":"考试评分管理"}],"frontMenu":[{"child":[{"buttons":["查看"],"menu":"考试规则列表","menuJump":"列表","tableName":"kaoshiguize"}],"menu":"考试规则模块"}],"hasBackLogin":"否","hasBackRegister":"否","hasFrontLogin":"是","hasFrontRegister":"是","roleName":"用户","tableName":"yonghu"}]
    }
}
export default menu;
