package dao;

import java.sql.*;
import java.util.*;
import db.DBUtil;
import model.UserProfile;

public class UserProfileDAO {

    // ✅ Fetch all user profiles from DB
    public List<UserProfile> getAllUsers() {
        List<UserProfile> list = new ArrayList<>();
        String sql = "SELECT * FROM user_profiles";

        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                UserProfile user = new UserProfile();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setContact(rs.getString("contact"));
                user.setEducationQualification(rs.getString("education_qualification"));
                user.setCurrentCourse(rs.getString("current_course"));
                user.setBranchMajor(rs.getString("branch_major"));
                user.setYearSemester(rs.getString("year_semester"));
                user.setPreferredLocations(rs.getString("preferred_locations"));
                user.setSkills(rs.getString("skills"));
                user.setInterests(rs.getString("interests"));
                user.setPreferredMode(rs.getString("preferred_mode"));
                user.setExperienceLevel(rs.getString("experience_level"));
                user.setLanguagesKnown(rs.getString("languages_known"));
                list.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // ✅ Insert a new user into DB
    public boolean insertUser(UserProfile user) {
        String sql = "INSERT INTO user_profiles (name, contact, education_qualification, current_course, branch_major, year_semester, preferred_locations, skills, interests, preferred_mode, experience_level, languages_known) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getContact());
            pstmt.setString(3, user.getEducationQualification());
            pstmt.setString(4, user.getCurrentCourse());
            pstmt.setString(5, user.getBranchMajor());
            pstmt.setString(6, user.getYearSemester());
            pstmt.setString(7, user.getPreferredLocations());
            pstmt.setString(8, user.getSkills());
            pstmt.setString(9, user.getInterests());
            pstmt.setString(10, user.getPreferredMode());
            pstmt.setString(11, user.getExperienceLevel());
            pstmt.setString(12, user.getLanguagesKnown());

            int rows = pstmt.executeUpdate();
            return rows > 0; // return true if insert was successful

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
