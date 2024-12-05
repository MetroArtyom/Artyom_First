package com.example.controller;

import com.example.pojo.Contact;
import com.example.service.ContactService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ContactController {

    @Autowired
    private ContactService contactService;

    @RequestMapping(value = "/listContacts")
    public String showContactList(Model model, Integer page, @RequestParam(value = "username", required = false) String username) {
        // 计算分页
        int pageNum = page == null ? 1 : page;// 如果page参数为null，则默认显示第1页，否则使用传递的页码
        int pageSize = 5;// 每页显示5条记录

        Map<String, Object> params = new HashMap<>();// 创建一个参数映射，用于存储分页和搜索参数
        params.put("pageNum", (pageNum - 1) * pageSize);// 计算起始记录的偏移量，由于页码从1开始，而偏移量从0开始，所以需要减1
        params.put("pageSize", pageSize);// 设置每页显示的记录数
        params.put("name", username);// 如果提供了用户名，则作为搜索参数添加到映射中

        List<Contact> contacts = contactService.getAllContacts(params);// 调用服务层的getAllContacts方法，获取分页和搜索结果
        int totalCount = contactService.getAllContactsCount(params);//获取总记录数，用于计算总页数
        model.addAttribute("contacts", contacts);// 将联系人列表添加到模型中，用于在视图中显示
        int pageTotal = totalCount / pageSize; // 计算总页数，通过总记录数除以每页记录数
        model.addAttribute("totalPage", (totalCount % pageSize) == 0 ? pageTotal : pageTotal + 1);// 如果总记录数不能被每页记录数整除，则总页数加1
        model.addAttribute("totalCount", totalCount);// 将总记录数添加到模型中
        model.addAttribute("page", pageNum);// 将当前页码添加到模型中
        model.addAttribute("searchUsername", username);// 将搜索的用户名（如果有的话）添加到模型中，以便在视图中显示

        return "listContacts";// 返回视图名称，用于渲染联系人列表页面
    }

    @RequestMapping("addContact")
    public String addContact(Contact contact) {
        contactService.addContact(contact);
        return "redirect:listContacts";
    }

    @RequestMapping("toEdit")
    public String editContact(Model model, Integer id) {
        Contact contact = contactService.findById(id);
        model.addAttribute("contact", contact);
        return "editContact";
    }

    @RequestMapping("editContact")
    public String editContact(Contact contact) {
        contactService.editContact(contact);
        return "redirect:listContacts";
    }

    @RequestMapping("deleteContact")
    public String deleteContact(Integer id) {
        contactService.deleteContact(id);
        return "redirect:listContacts";
    }

    @RequestMapping("findByname")
    public String findByid(String name, Model model) {
        Contact contact = contactService.findByname(name);
        model.addAttribute("contact", contact);
        return "editContact";
    }
}
