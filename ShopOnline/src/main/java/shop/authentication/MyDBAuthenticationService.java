package shop.authentication;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import shop.dao.AccountDAO;
import shop.entity.Account;
 
@Service  //dùng để đánh dấu các lớp Service. Tất cả xử lý nghiệp vụ logic sẽ đặt trong các lớp Service.
public class MyDBAuthenticationService implements UserDetailsService {
 
    @Autowired //Tự động liên kết các bean được sử dụng trong các class với các bean được Spring Container sinh ra và quản lý.
    private AccountDAO accountDAO;
 
    @Override //được sử dụng cho các method ghi đè của method trong một class cha (superclass)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Account account = accountDAO.findAccount(username); //Lấy tài khoản đăng nhập
        System.out.println("Tài khoản= " + account); //in ra tên tài khoản
 
        if (account == null) {
            throw new UsernameNotFoundException("Tài khoản " //
                    + username + "Không tìm thấy trong sql");
        }
 
        // EMPLOYEE,MANAGER,..
        String role = account.getUserRole();
 
        List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
 
        // ROLE_EMPLOYEE, ROLE_MANAGER
        GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + role);
 
        grantList.add(authority);
 
        boolean enabled = account.isActive();
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;
 
        UserDetails userDetails = (UserDetails) new User(account.getUserName(), //
                account.getPassword(), enabled, accountNonExpired, //
                credentialsNonExpired, accountNonLocked, grantList);
 
        return userDetails;
    }
 
}
