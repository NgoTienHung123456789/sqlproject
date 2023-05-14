SELECT * FROM employee.employee;
-- Tìm những nhân viên có trên 5 năm kinh nghiệm làm việc với độ tuổi của họ là từ 27 đến 35
SELECT * FROM employee.employee
Where Age between 27 and 35
and TotalWorkingYears >= 5;
-- Tìm những nhân viên có mức lương tối đa và tối thiểu làm việc ở các bộ phận khác nhau và những người đã nhận được ít hơn 13 lần tăng lương
SELECT Department, max(MonthlyIncome), min(MonthlyIncome) FROM employee.employee
where PercentSalaryHike < 13
group by Department;
-- Tính mức lương trung bình mỗi tháng của những nhân viên có thâm niên hơn 3 năm và có học vân là y tế
SELECT avg(MonthlyIncome) FROM employee.employee
where YearsAtCompany > 3 and EducationField = 'Medical';
-- Kiểm tra xem có bao nhiêu nhân viên nam, nhân viên nữ đã kết hôn và không có sự thăng tiến trong 2 năm qua
SELECT gender, count(YearsWithCurrManager) FROM employee.employee
where MaritalStatus = 'Married' and YearsSinceLastPromotion = 2 and Attrition = 'Yes'
group by gender;
-- Tìm nhân viên nào có năng suất lao động cao nhất mà lại không được thăng tiến trong vòng 4 năm qua
SELECT * FROM employee.employee
where PerformanceRating = (select max(PerformanceRating) from employee.employee)
and YearsSinceLastPromotion >= 4;

