package shop.config;
 
import java.util.Properties;
 
import javax.sql.DataSource;
 
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import shop.dao.AccountDAO;
import shop.dao.OrderDAO;
import shop.dao.ProductDAO;
import shop.dao.impl.AccountDAOImpl;
import shop.dao.impl.OrderDAOImpl;
import shop.dao.impl.ProductDAOImpl;
 
//là annotation cho biết đây là file java config và trong file config này có thể định nghĩa các bean, 
//nếu không muốn dùng annotation để config chúng ta có thể sử dụng xml file để config
@Configuration
@ComponentScan("shop.*")
@EnableTransactionManagement //cho phép quản lý giao dịch của spring-tx
// Load to Environment.
@PropertySource("classpath:hibernate.properties") //khai báo các properties file
public class ApplicationContextConfig {
 
  
 
   // Lưu trữ các giá thuộc tính load bởi @PropertySource.
   //Tự động liên kết các bean được sử dụng trong các class với các bean được Spring Container sinh ra và quản lý.
   @Autowired
   private Environment env;
 
   @Bean //Thực hiện gọi các method có đánh dấu @Bean để lấy ra các Bean và đưa vào `Context.
   public ResourceBundleMessageSource messageSource() {
       ResourceBundleMessageSource rb = new ResourceBundleMessageSource();
       rb.setBasenames(new String[] { "messages/validator" });/// thông báo
       return rb;
   }
 
   @Bean(name = "viewResolver")
   public InternalResourceViewResolver getViewResolver() {
       InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
       viewResolver.setPrefix("/WEB-INF/pages/");
       viewResolver.setSuffix(".jsp");
       return viewResolver;
   }
    
  
   // Cấu hình để Upload.
   @Bean(name = "multipartResolver")
   public CommonsMultipartResolver multipartResolver() {
       CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
        
       // Set Max Size...
       // commonsMultipartResolver.setMaxUploadSize(...);
        
       return commonsMultipartResolver;
   }
 
   @Bean(name = "dataSource")
   public DataSource getDataSource() {
       DriverManagerDataSource dataSource = new DriverManagerDataSource();
 
  
       // Xem: hibernate.properties
       dataSource.setDriverClassName(env.getProperty("ds.database-driver"));
       dataSource.setUrl(env.getProperty("ds.url"));
       dataSource.setUsername(env.getProperty("ds.username"));
       dataSource.setPassword(env.getProperty("ds.password"));
        
       System.out.println("## getDataSource: " + dataSource);
        
       return dataSource;
   }
 
   @Autowired
   @Bean(name = "sessionFactory")
   public SessionFactory getSessionFactory(DataSource dataSource) throws Exception {
       Properties properties = new Properties();
 
  
       // Xem: hibernate.properties
       properties.put("hibernate.dialect", env.getProperty("hibernate.dialect"));
       properties.put("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
       properties.put("current_session_context_class", env.getProperty("current_session_context_class"));
        
 
       LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
  
       // Package chứa các entity class.
       factoryBean.setPackagesToScan(new String[] { "shop.entity" });
       factoryBean.setDataSource(dataSource);
       factoryBean.setHibernateProperties(properties);
       factoryBean.afterPropertiesSet();
       //
       SessionFactory sf = factoryBean.getObject();
       System.out.println("## getSessionFactory: " + sf);
       return sf;
   }
 
   @Autowired
   @Bean(name = "transactionManager")
   public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
       HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
 
       return transactionManager;
   }
 
   @Bean(name = "accountDAO")
   public AccountDAO getApplicantDAO() {
       return new AccountDAOImpl();
   }
 
   @Bean(name = "productDAO")
   public ProductDAO getProductDAO() {
       return new ProductDAOImpl();
   }
 
   @Bean(name = "orderDAO")
   public OrderDAO getOrderDAO() {
       return new OrderDAOImpl();
   }
    
   @Bean(name = "accountDAO")
   public AccountDAO getAccountDAO()  {
       return new AccountDAOImpl();
   }
 
}