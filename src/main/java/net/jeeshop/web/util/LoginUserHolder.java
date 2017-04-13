package net.jeeshop.web.util;

import javax.servlet.http.HttpSession;

import net.jeeshop.core.FrontContainer;
import net.jeeshop.core.ManageContainer;
import net.jeeshop.core.system.bean.Role;
import net.jeeshop.core.system.bean.User;

/**
 * Created by dylan on 15-2-11.
 */
public class LoginUserHolder {
    public static User getLoginUser(){
        HttpSession session = RequestHolder.getSession();
        return session == null ? null : (User)session.getAttribute(ManageContainer.manage_session_user_info);
    }
   
    //获取用户角色
    public static Role getUserRole(){
        HttpSession session = RequestHolder.getSession();
        return session == null ? null : (Role)session.getAttribute(ManageContainer.manage_session_role_info);
    }
}
