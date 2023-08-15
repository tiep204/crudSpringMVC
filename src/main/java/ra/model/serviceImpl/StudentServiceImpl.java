package ra.model.serviceImpl;

import org.springframework.stereotype.Service;
import ra.model.entity.Student;
import ra.model.service.StudentService;
import ra.model.util.ConnectionDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
@Service

public class StudentServiceImpl implements StudentService<Student, Integer> {
    @Override
    public List<Student> findAll() {
        Connection conn = null;
        CallableStatement callSt = null;
        List<Student> list = null;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call proc_getAllStudent()}");
            ResultSet rs = callSt.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                Student st = new Student();
                st.setId(rs.getInt("id"));
                st.setName(rs.getString("name"));
                st.setAge(rs.getInt("age"));
                st.setBirthDate(rs.getDate("birthDate"));
                st.setAddress(rs.getString("address"));
                st.setStatus(rs.getBoolean("status"));
                list.add(st);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return list;
    }

    @Override
    public Student findById(Integer id) {
        Connection conn = null;
        CallableStatement callSt = null;
        Student st = null;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call proc_getStudentById(?)}");
            callSt.setInt(1, id);
            ResultSet rs = callSt.executeQuery();
            st = new Student();
            while (rs.next()) {
                st.setId(rs.getInt("id"));
                st.setName(rs.getString("name"));
                st.setAge(rs.getInt("age"));
                st.setSex(rs.getBoolean("sex"));
                st.setAddress(rs.getString("address"));
                st.setBirthDate(rs.getDate("birthDate"));
                st.setStatus(rs.getBoolean("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return st;
    }

    @Override
    public boolean saveOfUpdate(Student student) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean result = false;
        try {
            conn = ConnectionDB.openConnection();
            if (student.getId() == 0) {
                //them moi
                callSt = conn.prepareCall("{call proc_insertStudent(?,?,?,?,?,?)}");
                callSt.setString(1, student.getName());
                callSt.setInt(2, student.getAge());
                callSt.setBoolean(3, student.isSex());
                callSt.setString(4, student.getAddress());
                callSt.setDate(5, new Date(student.getBirthDate().getTime()));
                callSt.setBoolean(6, student.isStatus());
                callSt.executeUpdate();
                result = true;
            } else {
                //update
                callSt = conn.prepareCall("{call proc_updateStudent(?,?,?,?,?,?,?)}");
                callSt.setInt(1, student.getId());
                callSt.setString(2, student.getName());
                callSt.setInt(3, student.getAge());
                callSt.setBoolean(4, student.isSex());
                callSt.setString(5, student.getAddress());
                callSt.setDate(6, new Date(student.getBirthDate().getTime()));
                callSt.setBoolean(7, student.isStatus());
                callSt.executeUpdate();
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return result;
    }

    @Override
    public boolean delete(Integer id) {
        Connection conn = null;
        CallableStatement callSt = null;
        boolean result = false;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call pro_deleteStudent(?)}");
            callSt.setInt(1,id);
            callSt.executeUpdate();
            result = true;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionDB.closeConnection(conn,callSt);
        }
        return result;
    }
}