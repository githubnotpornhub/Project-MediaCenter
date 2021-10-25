package media.entity;

public class User {
    private String username;
    private String password;
    private String information;
    private Integer level;
    private String passwordagain;



    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordagain() {
        return passwordagain;
    }

    public void setPasswordagain(String passwordagain) {
        this.passwordagain = passwordagain;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public User() {

    }

    public User(String username, String password, String information, Integer level, String passwordagain) {
        this.username = username;
        this.password = password;
        this.information = information;
        this.level = level;
        this.passwordagain = passwordagain;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", information='" + information + '\'' +
                ", level=" + level +
                ", passwordagain='" + passwordagain + '\'' +
                '}';
    }
}
