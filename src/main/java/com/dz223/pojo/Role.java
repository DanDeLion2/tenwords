package com.dz223.pojo;

public class Role {
    private int id;//角色主键id
    private String rolename;//角色名称
    private String roleid;//角色编号
    private int rolestate;//角色状态
    private String createtime;//角色创建时间
    private String updatetime;//角色更新时间

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getRoleid() {
        return roleid;
    }

    public void setRoleid(String roleid) {
        this.roleid = roleid;
    }

    public int getRolestate() {
        return rolestate;
    }

    public void setRolestate(int rolestate) {
        this.rolestate = rolestate;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }
}
