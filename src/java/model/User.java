package model;

public class User {
    private int id;  
    private String name;
    private String email;
    private String password;
    private String phone;
    private String role;

    // Constructor for user registration (without userId)
    public User(String name, String email, String password, String phone, String role) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.role = role;
    }

    // Constructor with userId (for fetching users from the database)
    public User(int Id, String name, String email, String password, String phone, String role) {
        this.id = Id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.role = role;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int Id) { this.id = Id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}
