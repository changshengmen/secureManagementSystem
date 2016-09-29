package net.jeeshop.core.freemarker.fn;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;
import net.jeeshop.core.ManageContainer;
import net.jeeshop.core.system.bean.Role;
import net.jeeshop.core.system.bean.User;
import net.jeeshop.services.manage.secureProduct.SecureProductService;
import net.jeeshop.services.manage.system.impl.RoleService;
import net.jeeshop.web.util.RequestHolder;

/**
 * 控制按钮权限
 * @author lin
 */
public class checkDbPrivilege implements TemplateMethodModelEx {
	@Autowired
	private RoleService rs;

	public RoleService getRs() {
		return rs;
	}

	public void setRs(RoleService rs) {
		this.rs = rs;
	}

	@Override
	public Object exec(List arguments) throws TemplateModelException {
		HttpSession session = RequestHolder.getSession();
		//获取当前用户信息
		User u = (User) session.getAttribute(ManageContainer.manage_session_user_info);
		String rid = u.getRid();
		Role role = rs.selectById(rid);
		//获取当前角色权限
		String priv = role.getRole_dbPrivilege();
		if ("select".equals(priv)) {// 只有读权限
			return false;
		} else {
			// 其他权限
			return true;
		}
	}
}
