package com.example.mapper;

import com.example.pojo.Contact;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ContactMapper {
    List<Contact> getAllContacts(@Param("params") Map<String, Object> params);
    void addContact(Contact contact);
    void editContact(Contact contact);
    void deleteContact(Integer id);
    Contact findByname(String name);
    int getAllContactsCount(@Param("params") Map<String, Object> params);
    Contact findById(Integer id);
}
