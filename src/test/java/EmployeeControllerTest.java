import dream.development.model.Employee;
import dream.development.service.EmployeeService;
import dream.development.web.EmployeeController;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.hamcrest.Matchers.hasSize;
import static org.mockito.Mockito.verifyZeroInteractions;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

public class EmployeeControllerTest {

    @Mock
    private EmployeeService employeeService;

    @InjectMocks
    private EmployeeController employeeController;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        MockitoAnnotations.initMocks(this);

        mockMvc = MockMvcBuilders.standaloneSetup(employeeController).build();
    }

    @Test
    public void testList() throws Exception {
        List<Employee> employees = new ArrayList<>();
        employees.add(new Employee());
        employees.add(new Employee());

        when(employeeService.getEmployees()).thenReturn((List) employees);

        mockMvc.perform(get("/employees"))
                .andExpect(status().isOk())
                .andExpect(view().name("content/employees"))
                .andExpect(model().attribute("employees", hasSize(2)));
    }

    @Test
    public void testShow() throws Exception {
        Long id=1L;

        when(employeeService.getEmployeeById(id)).thenReturn(new Employee());

        mockMvc.perform(get("/employee/1_Smith_John"))
                .andExpect(status().isOk())
                .andExpect(view().name("content/employee"))
                .andExpect(model().attribute("employee", instanceOf(Employee.class)));
    }

    @Test
    public void testNewEmployee() throws Exception {
        verifyZeroInteractions(employeeService);

        mockMvc.perform(get("/employees"))
                .andExpect(status().isOk())
                .andExpect(view().name("content/employees"))
                .andExpect(model().attribute("employee", instanceOf(Employee.class)));
    }
}
