package dream.development.dao.interfaces;

import dream.development.model.Menu;

import java.util.List;

/**
 * Menu Interface
 * Created by Splayd on 01.07.2017.
 */
public interface MenuDao {

    void insert(Menu menu);

    List<Menu> getAll();

    List<Menu> getByNameValue(String menuValue);

    Menu getById(Long id);

    Menu getByName(String name);

    void remove(String name);

    void removeById(Long id);

    void update(Menu menu);
}
