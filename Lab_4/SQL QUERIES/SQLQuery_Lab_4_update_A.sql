-- Part – A:
-- From the above given tables perform the following queries (UPDATE Operation):

-- 1. Update deposit amount of all customers from 3000 to 5000. (Use Deposit Table)
UPDATE DEPOSIT
SET AMOUNT=5000
WHERE AMOUNT=3000
-- 2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table)
UPDATE BORROW
SET BNAME='C.G.ROAD'
WHERE BNAME='VRCE'
-- 3. Update Account No of SANDIP to 111 & Amount to 5000. (Use Deposit Table)
UPDATE DEPOSIT
SET ACTION=111,AMOUNT=5000
WHERE CNAME='SANDIP'

-- 4. Update amount of KRANTI to 7000. (Use Deposit Table)


-- 5. Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table)

-- 6. Update branch name of MEHUL to NEHRU PALACE. (Use Deposit Table)

-- 7. Update deposit amount of all depositors to 5000 whose account no between 103 & 107. (Use Deposit
-- Table)

-- 8. 9. Update ADATE of ANIL to 1-4-95. (Use Deposit Table)
-- Update the amount of MINU to 10000. (Use Deposit Table)
-- 10. Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96 (Use Deposit Table)