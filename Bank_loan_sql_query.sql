select * from [financial_loan.csv]

--Monthly trend by issue date
select 
      MONTH(issue_date) as Month_number,
	  DATENAME(Month,issue_date) as Month_Name,
	  count(id) as Total_loan_applications,
	  sum(loan_amount) as Total_funded_amount,
	  sum(total_payment) as Total_Recived_amount
from [financial_loan.csv]
group by MONTH(issue_date),DATENAME(Month,issue_date)
order by MONTH(issue_date)

--regional analysis by state

select 
      address_state,
	  count(id) as Total_loan_applications,
	  sum(loan_amount) as Total_funded_amount,
	  sum(total_payment) as Total_Recived_amount
from [financial_loan.csv]
group by address_state
order by sum(loan_amount) desc


--Loan Term Analysis


select 
      term,
	  count(id) as Total_loan_applications,
	  sum(loan_amount) as Total_funded_amount,
	  sum(total_payment) as Total_Recived_amount
from [financial_loan.csv]
group by term
order by term

--Employee Length Analysis

select 
      emp_length,
	  count(id) as Total_loan_applications,
	  sum(loan_amount) as Total_funded_amount,
	  sum(total_payment) as Total_Recived_amount
from [financial_loan.csv]
group by emp_length
order by emp_length

--Loan Purpose Breakdown

select 
      purpose,
	  count(id) as Total_loan_applications,
	  sum(loan_amount) as Total_funded_amount,
	  sum(total_payment) as Total_Recived_amount
from [financial_loan.csv]
group by purpose
order by sum(loan_amount) desc


--Home Ownership Analysis

select 
      home_ownership,
	  count(id) as Total_loan_applications,
	  sum(loan_amount) as Total_funded_amount,
	  sum(total_payment) as Total_Recived_amount
from [financial_loan.csv]
where grade='A' and address_state='CA'
group by home_ownership
order by sum(loan_amount) desc
