package dream.development.service;

import dream.development.dao.interfaces.EmployeeDao;
import dream.development.model.Employee;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Администратор on 14.08.2017.
 */
public class EmployeeService {

    private EmployeeDao employeeDao;

    @Transactional
    public void insertEmployee(Employee employee) {
        employeeDao.insert(employee);
    }

    @Transactional
    public List<Employee> getEmployees() {
        return employeeDao.getAll();
    }

    @Transactional
    public Employee getEmployeeByName(String employeeName) {
        return employeeDao.getByName(employeeName);
    }

    @Transactional
    public Employee getEmployeeById(Long id) {
        return employeeDao.getById(id);
    }

    @Transactional
    public void updateEmployee(Employee employee) {
        employeeDao.update(employee);
    }

    @Transactional
    public void removeEmployeeById(Long id) {
        employeeDao.removeByID(id);
    }

    public void setEmployeeDao(EmployeeDao employeeDao) {
        this.employeeDao = employeeDao;
    }
}
