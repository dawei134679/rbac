package com.atguigu.atcrowdfunding.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.bean.AJAXResult;
import com.atguigu.atcrowdfunding.bean.Permission;
import com.atguigu.atcrowdfunding.service.PermissionService;

@Controller
@RequestMapping("/permission")
public class PermissionController {

	@Autowired
	private PermissionService permissionService;

	@ResponseBody
	@RequestMapping("/delete")
	public Object delete(Permission permission) {
		AJAXResult result = new AJAXResult();

		try {
			permissionService.deletePermission(permission);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("/update")
	public Object update(Permission permission) {
		AJAXResult result = new AJAXResult();

		try {
			permissionService.updatePermission(permission);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("/insert")
	public Object insert(Permission permission) {
		AJAXResult result = new AJAXResult();

		try {
			permissionService.insertPermission(permission);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@RequestMapping("/add")
	public String add() {
		return "permission/add";
	}

	@RequestMapping("/edit")
	public String edit(Integer id, Model model) {

		Permission permission = permissionService.queryById(id);
		model.addAttribute("permission", permission);

		return "permission/edit";
	}

	@RequestMapping("/index")
	public String index() {
		return "permission/index";
	}

	@ResponseBody
	@RequestMapping("/loadAssignData")
	public Object loadAssignData(Integer roleid) {
		List<Permission> permissions = new ArrayList<Permission>();
		List<Permission> ps = permissionService.queryAll();

		// 获取当前角色已经分配的许可信息
		List<Integer> permissionids = permissionService.queryPermissionidsByRoleid(roleid);

		Map<Integer, Permission> permissionMap = new HashMap<Integer, Permission>();
		for (Permission p : ps) {
			if (permissionids.contains(p.getId())) {
				p.setChecked(true);
			} else {
				p.setChecked(false);
			}
			permissionMap.put(p.getId(), p);
		}
		for (Permission p : ps) {
			Permission child = p;
			if (child.getPid() == 0) {
				permissions.add(p);
			} else {
				Permission parent = permissionMap.get(child.getPid());
				parent.getChildren().add(child);
			}
		}

		return permissions;
	}

	@ResponseBody
	@RequestMapping("/loadData")
	public Object loadData() {
		List<Permission> permissions = new ArrayList<Permission>();
		// 查询所有的许可数据
		List<Permission> ps = permissionService.queryAll();
		//key - value 存放权限
		Map<Integer, Permission> permissionMap = new HashMap<Integer, Permission>();
		
		for (Permission p : ps) {
								//权限id - 权限
			permissionMap.put(p.getId(), p);
		}
		//循环遍历树结构
		for (Permission p : ps) {
			Permission child = p;
			if (child.getPid() == 0) {
				//加入根节点
				permissions.add(p);
			} else {
				//添加子节点
				Permission parent = permissionMap.get(child.getPid());
				parent.getChildren().add(child);
			}
			
		}
		return permissions;
	}
}
