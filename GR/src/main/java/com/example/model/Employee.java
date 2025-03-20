package com.example.model;

public class Employee {
    private int id;
    private String name;
    private String email;
    private String department;
    private String role;
    private double salary;
    private String hire_date;

    // Constructors
    public Employee() {}

    public Employee(int id, String name, String email, String department, String role, double salary, String hire_date) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.department = department;
        this.role = role;
        this.salary = salary;
        this.hire_date = hire_date;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getHire_date() {
        return hire_date;
    }

    public void setHire_date(String hire_date) {
        this.hire_date = hire_date;
    }

    // Method to get the hire date as a Date object
    public java.sql.Date getHireDate() {
        return java.sql.Date.valueOf(hire_date);
    }
}