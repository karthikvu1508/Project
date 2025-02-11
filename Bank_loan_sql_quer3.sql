select * from [financial_loan.csv]


--loan status

select loan_status from [financial_loan.csv]

--Good loan percentage

select 
 (count( case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end)*100)
 /
 count(id) as Good_loan_percentage
 from [financial_loan.csv]


 --Good_loan_application

 select count(id) as Good_loan_application 
 from [financial_loan.csv]
 where loan_status='Fully Paid' or loan_status ='Current'

 --Good_loan_funded_amount
  select sum(loan_amount) as Good_loan_Funded_amount 
 from [financial_loan.csv]
 where loan_status='Fully Paid' or loan_status ='Current'



 --Good_loan_Received_Amount

 select sum(total_payment) as Good_loan_Received_amount 
 from [financial_loan.csv]
 where loan_status='Fully Paid' or loan_status ='Current'


 

--Bad_loan_percentage

select 
(count(case when loan_status = 'Charged Off' then id end)*100)
/
count(id) as Bad_loan_percentage 
from [financial_loan.csv]

--Bad_loan_application

select count(id) as Bad_loan_application 
 from [financial_loan.csv]
 where loan_status='Charged Off'

 --Bad_loan_funded_amount

 select sum(loan_amount) as Bad_loan_Funded_amount 
 from [financial_loan.csv]
 where loan_status='Charged Off'


 --Bad_loan_received_amount

  select sum(total_payment) as Bad_loan_Received_amount 
 from [financial_loan.csv]
 where loan_status='Charged Off'



 --Loan Status


 select 
    loan_status,
    count(id) as Total_loan_applications,
    sum(loan_amount) as Total_funded_amount,
    sum(total_payment) as Total_received_amount,
    AVG(int_rate * 100) as Interest_rate,
    avg(dti * 100) as DTI
 from [financial_loan.csv]
 group by loan_status

 --Month to date


 select 
       loan_status,
	   sum(total_payment) as Total_funded_amount,
	   sum(loan_amount) as Total_Amount_received
from [financial_loan.csv]
where month(issue_date) =12
group by loan_status

