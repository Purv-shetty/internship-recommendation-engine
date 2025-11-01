import dao.UserProfileDAO;
import model.UserProfile;
import java.util.List;

public class TestFetch {
    public static void main(String[] args) {
        UserProfileDAO dao = new UserProfileDAO();
        List<UserProfile> users = dao.getAllUsers();

        for (UserProfile user : users) {
            System.out.println("Name: " + user.getName());
            System.out.println("Contact: " + user.getContact());
            System.out.println("Skills: " + user.getSkills());
            System.out.println("----------------------");
        }
    }
}
