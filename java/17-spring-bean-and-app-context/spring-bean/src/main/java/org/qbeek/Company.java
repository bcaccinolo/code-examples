package org.qbeek;

import org.springframework.stereotype.Component;

@Component
public class Company {
    private String name;
    private Address address;

    public Company(Address address) {
        this.name = "My Company Name";
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Company{" +
                "name='" + name + '\'' +
                ", address=" + address +
                '}';
    }
}
