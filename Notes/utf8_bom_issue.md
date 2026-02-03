\# UTF-8 BOM Column Name Issue



\## Problem

While executing joins involving the Disease table, MySQL returned:



Error 1054: Unknown column 'Disease.diseaseID'



On inspecting the table structure using:



DESCRIBE Disease;



the column name appeared as:



ï»¿diseaseID



\## Root Cause

The Disease table was created from a CSV file saved using UTF-8 with BOM encoding.

The BOM bytes (EF BB BF) were interpreted by MySQL as part of the column name.



As a result, the first column name contained invisible characters.



\## Fix

The column was renamed to remove the BOM characters:



```sql

ALTER TABLE Disease

CHANGE COLUMN `ï»¿diseaseID` diseaseID INT;

\## Outcome

Schema was corrected.

Join errors were resolved.

Queries became portable and readable.

