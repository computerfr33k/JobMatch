package com.jobmatch.models;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.validator.constraints.Email;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
public class User implements Serializable {

    /**
     * Contains basic user account info.
     */

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected int id;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn
    protected Role role;
    @Column(unique = true)
    @Size(min = 2, max = 254)
    protected String username;
    @Size(min = 6)
    protected String password;
    @ColumnDefault("false")
    protected Boolean optIn;

    @Email
    private String email;

    @Size(max = 1000)
    protected String resume;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn
    protected Contact contact = new Contact();

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn
    protected Company company = new Company();

    @OneToMany(orphanRemoval = true, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    protected Set<Education> education = new HashSet<>();

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "USER_SKILLS",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "ranked_skill_id"))
    protected Set<RankedSkill> skills = new HashSet<>();

    @OneToMany(orphanRemoval = true, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    protected Set<Experience> experiences = new HashSet<>();

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "USER_FAVE_POSTS",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "job_post_id"))
    protected Set<JobPost> favePosts = new HashSet<>();

    @OneToMany(orphanRemoval = true, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    protected Set<Reference> references = new HashSet<>();

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "USER_CULTURES",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "ranked_culture_id"))
    protected Set<RankedCulture> cultures = new HashSet<>();


    /**
     * Default Constructor
     */
    public User() {
        contact = new Contact();
        company = new Company();
        this.optIn = false;
    }

    /**
     * Constructor
     *
     * @param role
     * @param username
     * @param password
     * @param optIn
     */
    public User(Role role, String username, String password, Boolean optIn, String email) {
        this.role = role;
        this.username = username;
        this.email = email;
        this.setPassword(password);
        this.optIn = optIn;
    }

    /**
     * Get User Id
     *
     * @return id
     */
    public int getId() {
        return id;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    /**
     * Hash User Password when setting it using bcrypt
     *
     * @param password
     */
    public void setPassword(String password) {
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        this.password = encoder.encode(password);
    }

    public Boolean getOptIn() {
        return optIn;
    }

    public void setOptIn(Boolean opt_in) {
        this.optIn = opt_in;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public Contact getContact() {
        return contact;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

    public Set<Education> getEducation() {
        return education;
    }

    public List<Education> getEducationList() {
        return new ArrayList<>(getEducation());
    }

    public Set<RankedSkill> getSkills() {
        return skills;
    }

    public Set<Experience> getExperiences() {
        return experiences;
    }

    public Set<JobPost> getFavePosts() {
        return favePosts;
    }

    public Set<Reference> getReferences() {
        return references;
    }

    public Set<RankedCulture> getCultures() {
        return cultures;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (!username.equals(user.username)) return false;
        if (!password.equals(user.password)) return false;
        return optIn != null ? optIn.equals(user.optIn) : user.optIn == null;

    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", role=" + role +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", optIn=" + optIn +
                ", email='" + email + '\'' +
                ", contact=" + contact +
                ", company=" + company +
                ", education=" + education +
                ", skills=" + skills +
                ", experiences=" + experiences +
                ", favePosts=" + favePosts +
                ", references=" + references +
                ", cultures=" + cultures +
                '}';
    }
}
