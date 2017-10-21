package dream.development.service;

import dream.development.dao.interfaces.MenuDao;
import dream.development.model.Menu;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Администратор on 15.08.2017.
 */
public class MenuService {

    private MenuDao menuDao;

    @Transactional
    public List<Menu> getMenu() {
        return menuDao.getAll();
    }

    @Transactional
    public Menu getMenuByName(String menu) {
        return menuDao.getByName(menu);
    }

    @Transactional
    public Menu getMenuById(Long id) {
        return menuDao.getById(id);
    }

    @Transactional
    public void insertMenu(Menu menu) {
        menuDao.insert(menu);
    }

    @Transactional
    public void removeMenuById(Long id) {
        menuDao.removeById(id);
    }

    @Transactional
    public List<Menu> getMenuByNameValue(String menuValue) {
        return menuDao.getByNameValue(menuValue);
    }

    @Transactional
    public void updateMenu(Menu menu) {
        menuDao.update(menu);
    }

    public void setMenuDao(MenuDao menuDao) {
        this.menuDao = menuDao;
    }
}
