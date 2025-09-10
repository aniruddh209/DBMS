--delete row by delete
-- Delete all the records of DEPOSIT_DETAIL table having amount less than and equals to 4000.
DELETE FROM DEPOSIT_DETAIL
WHERE AMOUNT>=4000

SELECT *from DEPOSIT_DETAIL

-- Delete all the accounts CHANDI BRANCH.
DELETE FROM DEPOSIT_DETAIL
WHERE BNAME='chandi'

SELECT *from DEPOSIT_DETAIL

-- Delete all the accounts having account number (ANO) is greater than 102 and less than 105.
DELETE FROM DEPOSIT_DETAIL
WHERE ANO>102 AND ANO<105

-- Delete all the accounts whose branch is ‘AJNI’ or ‘POWAI’
DELETE FROM DEPOSIT_DETAIL
WHERE BNAME='AJNI' OR BNAME='POWAI'

SELECT *from DEPOSIT_DETAIL

-- Delete all the accounts whose account number is NULL.
DELETE FROM DEPOSIT_DETAIL
WHERE ANO IS NULL
SELECT *from DEPOSIT_DETAIL


-- Delete all the remaining records using Delete command.
DELETE FROM DEPOSIT_DETAIL
SELECT *from DEPOSIT_DETAIL


-- Delete all the records of Deposit_Detail table. (Use Truncate)
TRUNCATE TABLE DEPOSIT_DETAIL
 SELECT *from DEPOSIT_DETAIL


-- Remove Deposit_Detail table. (Use Drop)
DROP TABLE DEPOSIT_DETAIL
SELECT *from DEPOSIT_DETAIL