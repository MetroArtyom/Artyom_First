package com.example.service;

import com.example.pojo.Contact;

import java.util.List;
import java.util.Map;

public interface ContactService {
    List<Contact> getAllContacts(Map<String, Object> params);//用于获取联系人列表。它接受一个包含分页和搜索参数的Map对象。分页参数通常包括起始记录的偏移量和每页的记录数，而搜索参数可能包括联系人的名称或其他属性。返回值是一个Contact对象的列表，表示查询结果。
    void addContact(Contact contact); // 添加保存联系人的方法声明
    void editContact(Contact contact);//编辑现有的联系人信息。它接受一个Contact对象，该对象包含了要更新的联系人的新信息。方法执行后，数据库中相应联系人的信息将被更新。
    void deleteContact(Integer id);//删除一个联系人。它接受一个Integer类型的id作为参数，该id代表了要删除的联系人的唯一标识。方法执行后，具有指定id的联系人将被从数据库中删除。
    Contact findByname(String name);//用于根据名称搜索联系人。它接受一个String类型的name作为参数，表示要搜索的联系人的名称。方法返回一个Contact对象，如果找到了匹配的联系人；如果没有找到，可能返回null。
    int getAllContactsCount(Map<String, Object> params);//用于获取联系人的总数量。它接受一个包含搜索参数的Map对象。返回值是一个int类型的数值，表示数据库中联系人的总数量。
    Contact findById(Integer id);
}
