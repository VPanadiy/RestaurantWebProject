package dream.development.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "group_members")
public class GroupMembers {

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "id")
    private long id;

    @Column(name = "username")
    private String username;

    @Column(name = "group_id", nullable = false, columnDefinition = "int default 2") // 1 - admin; 2 - user
    private int groupId = 2;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    @Override
    public String toString() {
        return "GroupMembers{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", groupId=" + groupId +
                '}';
    }
}
