package ra.model.service;

import ra.model.entity.Student;

import java.util.List;


public interface StudentService<T, E> {
    List<T> findAll();

    Student findById(E id);

    boolean saveOfUpdate(T t);

    boolean delete(E id);
}