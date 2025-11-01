import dao.UserProfileDAO;
import model.UserProfile;

public class TestInsert {
    public static void main(String[] args) {
        UserProfile newUser = new UserProfile();
        newUser.setName("Aarav Mehta");
        newUser.setContact("aarav@example.com");
        newUser.setEducationQualification("B.Tech");
        newUser.setCurrentCourse("CSBS");
        newUser.setBranchMajor("CSE");
        newUser.setYearSemester("3rd Year");
        newUser.setPreferredLocations("Mumbai, Remote");
        newUser.setSkills("Java, SQL, React");
        newUser.setInterests("AI, Backend");
        newUser.setPreferredMode("Remote");
        newUser.setExperienceLevel("Beginner");
        newUser.setLanguagesKnown("English, Hindi");

        UserProfileDAO dao = new UserProfileDAO();
        boolean success = dao.insertUser(newUser);

        if (success) {
            System.out.println(" User inserted successfully!");
        } else {
            System.out.println("Failed to insert user.");
        }
    }
}
