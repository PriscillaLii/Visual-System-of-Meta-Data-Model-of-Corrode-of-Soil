package ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import Dao.UserDAO;
import Model.User;
import Service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserDAO ud;

	@Override
	public User login(String username) {
		// TODO Auto-generated method stub
		List list = ud.findByProperty("name", username);
		return (User) list.get(0);
	}

}
