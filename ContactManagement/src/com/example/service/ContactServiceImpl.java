package com.example.service;

import com.example.mapper.ContactMapper;
import com.example.pojo.Contact;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class ContactServiceImpl implements ContactService{//定义了一个名为ContactServiceImpl的类，它实现了ContactService接口。

    @Autowired
    private ContactMapper contactMapper;


    @Override
    public List<Contact> getAllContacts(Map<String, Object> params) {
        return contactMapper.getAllContacts(params);
    }

    @Override
    public int getAllContactsCount(Map<String, Object> params) {
        return contactMapper.getAllContactsCount(params);
    }

    @Override
    public void addContact(Contact contact) {
        contactMapper.addContact(contact);
    }

    @Override
    public void editContact(Contact contact) {
        contactMapper.editContact(contact);
    }

    @Override
    public void deleteContact(Integer id) {
        contactMapper.deleteContact(id);
    }

    @Override
    public Contact findByname(String name) {
        return contactMapper.findByname(name);
    }

    @Override
    public Contact findById(Integer id) {
        return contactMapper.findById(id);
    }
}
