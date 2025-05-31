A. Set up project BookShopWeb
1. Tạo Database
   Mở MySQL Workbench → Open SQL Script → Execute bookshopdb.sql
2. Nạp project vào IDEA
   Mở IDEA → Get from VCS (màn hình Welcome) hoặc File | New | Project from Version Control (màn hình bình thường) → Clone project theo URL: https://github.com/Bang0409/Book-Shop-Web-Java.git
3. Cấu hình TomCat
   [Add Configuration...] → [+] Tomcat Server Local
   [Fix] → BookShopWeb:war exploded
4. Run (Shift F10)

B. Cấu hình utils.ConstantUtils
  Mặc định, DB_NAME là bookshopdb, DB_USERNAME là root, DB_PASSWORD là 12345.
  Có thể thay đổi nếu như khác

Sơ Đồ CSDL 
![image](https://github.com/user-attachments/assets/3a15bbb0-7d26-44ac-a34f-8103ae165d74)       

![image](https://github.com/user-attachments/assets/73d964d1-cf90-4a61-ab8b-8c1ae3806711)


