\# Healthcare SQL Case Study



This repository contains SQL solutions for a healthcare analytics case study.

The project focuses on extracting meaningful insights from a normalized

healthcare database involving patients, treatments, pharmacies, diseases,

and insurance claims.



The goal of this project is to demonstrate practical SQL skills used in

real-world data analysis scenarios.



---



\## Database Schema



The database includes the following core entities:

\- Person, Patient, Address

\- Treatment, Disease

\- Pharmacy, Prescription, Medicine

\- Insurance and Claims



The ER diagram for the database schema is available here:

schema/healthcare\_schema.png



---



\## Problems Solved



1\. \*\*Pharmacy-wise hospital-exclusive medicine usage (2022)\*\*

&nbsp;  - Calculated total medicine quantities per pharmacy

&nbsp;  - Identified hospital-exclusive medicine usage

&nbsp;  - Computed percentage contribution per pharmacy



2\. \*\*State-wise treatments without insurance\*\*

&nbsp;  - Analyzed insurance claim behavior

&nbsp;  - Calculated percentage of treatments without insurance claims per state



3\. \*\*Most and least treated diseases per state (2022)\*\*

&nbsp;  - Identified disease trends by state

&nbsp;  - Handled ties using aggregation

&nbsp;  - Reported both most and least treated diseases



4\. \*\*City-wise patient to registered people ratio\*\*

&nbsp;  - Filtered cities with at least 10 registered people

&nbsp;  - Calculated percentage of registered people who are patients



5\. \*\*Top pharmaceutical companies using ranitidine\*\*

&nbsp;  - Identified companies manufacturing medicines containing ranitidine



---



\## SQL Concepts Used



\- Multi-table JOINs across a normalized schema

\- Conditional aggregation using CASE expressions

\- Common Table Expressions (CTEs)

\- HAVING vs WHERE filtering

\- NULL handling and division-by-zero protection

\- Text filtering and aggregation

\- Real-world schema debugging



---



\## Notable Debugging Case



During development, a schema-level issue was encountered where a column name

contained UTF-8 BOM characters due to CSV import.



The issue was identified and fixed by renaming the affected column.

Details are documented here:

notes/utf8\_bom\_issue.md



---



\## Project Structure



healthcare-sql-case-study/

│

├── schema/

│ └── healthcare\_schema.png

│

├── queries/

│ ├── problem\_1\_pharmacy\_exclusive.sql

│ ├── problem\_2\_insurance\_analysis.sql

│ ├── problem\_3\_disease\_trends.sql

│ ├── problem\_4\_city\_patient\_ratio.sql

│ └── problem\_5\_ranitidine\_companies.sql

│

└── notes/

└── utf8\_bom\_issue.md

---



\## Notes



\- SQL queries are written without table aliases for clarity.

\- Dataset files are excluded due to privacy and licensing considerations.

\- Sample data can be generated if required.

