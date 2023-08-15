package ra.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ra.model.entity.Student;
import ra.model.service.StudentService;

import java.util.List;

@Controller
@RequestMapping("studentController")
public class StudentController {
    private StudentService studentService;

    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping("/getAll")
    public ModelAndView getAllStudent() {
        ModelAndView mav = new ModelAndView("student");
        List<Student> studentList = studentService.findAll();
        mav.addObject("list", studentList);
        return mav;
    }

    @GetMapping("/add")
    public String showAddStudent(Model model) {
        Student student = new Student();
        model.addAttribute("newStudent", student);
        return "newStudent";
    }

    @PostMapping("create")
    public String createStudent(@ModelAttribute("newStudent") Student newStudent) {
        studentService.saveOfUpdate(newStudent);
        return "redirect:getAll";
    }

    @GetMapping("update")
    public String showUpdate(Model model, int id) {
        Student stUpdate = studentService.findById(id);
        model.addAttribute("updateStudent", stUpdate);
        return "updateStudent";
    }

    @PostMapping("update")
    public String updateStudent(@ModelAttribute("updateStudent") Student student) {
        studentService.saveOfUpdate(student);
        return "redirect:getAll";
    }
    @GetMapping("delete")
    public String deleteStudent(int id){
        studentService.delete(id);
        return "redirect:getAll";
    }
}