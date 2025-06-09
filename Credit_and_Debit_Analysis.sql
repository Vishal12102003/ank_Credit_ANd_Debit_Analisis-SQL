Create database Credit_and_Debit_Analysis;
use Credit_and_Debit_Analysis;
Select * from debit_and_credit;

#1
Select Transaction_Type, 
		concat(
        Left(
        Round(
        sum(amount)),3),"M") as Cr_Loan 
from debit_and_credit
where Transaction_Type="Credit";

#2
Select Transaction_Type, 
		concat(
        Left(
        Round(
        sum(amount)),3),"M") as Dr_Loan 
from debit_and_credit
where Transaction_Type="Debit";

#3
select 
	(Round(
		(select sum(
        case when transaction_type= "Credit" 
        then Amount 
        else 0 
        end) as Cr_Loan)
		/
		(select sum(
        case when transaction_type= "Debit" 
        then Amount 
        else 0 
        end) as Dr_Loan)))
	as Cr_To_Dr_Ratio
from debit_and_credit;

#4
select
	(concat(
    Left(
    round(
    (Select(sum(case when transaction_type= "Credit" then amount else 0 end)))
    -
	(Select(sum(case when transaction_type= "Debit" then amount else 0 end)))
    )
    ,3)
    ,"K"))
    as Net_transaction_Amt
    from debit_and_credit;
    
#5
Select * from debit_and_credit;

select Count(Account_Number) * 1.0 / nullif(sum(Balance), 0) as Acc_activity_ratio
from debit_and_credit;

#6
describe debit_and_credit;

-------------------------------------------------------------------
#updated transaction date (text) column to Tran_date as date Format 
-------------------------------------------------------------------
alter table debit_and_credit
add column Tran_date Date;

set sql_safe_updates=0;
-----------------------
start transaction;

update debit_and_credit
set Tran_date= str_to_date(Transaction_Date,"%d-%m-%Y");

commit;
-------------------------------------------------------
start transaction;
Alter table debit_and_credit
drop column Transaction_Date;

commit;
-------------------------------------------------------
describe debit_and_credit;
-------------------------------------------------------

#day
select dayofmonth(Tran_date) as Days, count(amount) as N0_transaction
from debit_and_credit
group by dayofmonth(Tran_date)
order by Count(amount) desc;
-----------------------------------------------------------------------
select dayofyear(Tran_date) as Days, count(amount) as N0_transaction
from debit_and_credit
group by dayofyear(Tran_date)
order by Count(amount) desc;
-----------------------------------------------------------------------

#week
select week(Tran_date) as Week_num, count(amount) as N0_transaction
from debit_and_credit
group by week(Tran_date)
order by Count(amount) desc;
-----------------------------------------------------------------------

#month
select monthname(tran_date) as Months, Count(amount) as No_transactiom
from debit_and_credit
group by monthname(tran_date)
order by Count(amount) desc;
------------------------------------------------------------------------

#&
select * from debit_and_credit;

select branch, 
	   concat(
       left(
       round(
       sum(amount)),3)," Lakhs") as loan_amt
from debit_and_credit
group by Branch
order by Loan_amt desc;

#8
select Bank_Name, 
		concat(
        left(
        round(
        sum(amount)),3)," Lakhs") as Loan_amt
from debit_and_credit
group by Bank_Name
order by Loan_amt Desc;
    
#9
select * from debit_and_credit;

select Transaction_Method, 
		concat(
        round(
        count(amount) 
        / (select count(amount) from debit_and_credit)
        *100)
        , "%") 
        as "Method_%"
from debit_and_credit
group by Transaction_Method;

#10
select branch, 
		monthname(tran_date) as  Months, 
			round(
            sum(amount) / (select sum(amount) from debit_and_credit)*100 , 3) as percent_Change
from debit_and_credit
group by monthname(tran_date), Branch
order by percent_Change desc;

#11
Select Customer_name,  count(Tran_date) as SUS_trans, round(sum(Amount)) As SUS_Amount
from debit_and_credit
group by Customer_Name
having SUS_amount>80000
order by SUS_Trans desc;

select customer_name, sum(amount) as sus_amt, count(Tran_date) as SUS_trans, Transaction_Type
from debit_and_credit
where Transaction_Type="credit"
group by Customer_Name
having sus_amt>50000
order by sus_amt desc;

#12
create view HFT as
Select Customer_name,  count(Tran_date) as SUS_trans, round(Sum(Amount))  As SUS_Amount
from debit_and_credit
group by Customer_Name
having SUS_amount>80000
order by SUS_Trans desc;

Select * from HFT;

select monthname(Tran_date), count(h_t.Sus_trans) as Sus_Transaction
from debit_and_credit as DC
right join HFT as h_T on DC.Customer_name = H_T.Customer_name
group by monthname(Tran_date)
order by Sus_Transaction desc;















