SELECT DB_NAME() AS CurrentDatabase;
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES;

SELECT 
    COUNT(*) AS Total_Employees
FROM hr_data;
SELECT 
    ROUND(
        (SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0)
        / COUNT(*),
    2) AS Attrition_Rate
FROM hr_data;
SELECT
    Department,
    COUNT(*) AS Attrition_Count
FROM hr_data
WHERE Attrition = 1
GROUP BY Department
ORDER BY Attrition_Count DESC;
SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Above 50'
    END AS Age_Group,

    COUNT(*) AS Attrition_Count

FROM hr_data

WHERE Attrition = 1

GROUP BY
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Above 50'
    END

ORDER BY Attrition_Count DESC;
SELECT
    OverTime,
    COUNT(*) AS Attrition_Count
FROM hr_data
WHERE Attrition = 1
GROUP BY OverTime;
SELECT
    Attrition,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income
FROM hr_data
GROUP BY Attrition;
SELECT
    JobSatisfaction,
    COUNT(*) AS Attrition_Count
FROM hr_data
WHERE Attrition = 1
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;
SELECT
    WorkLifeBalance,
    COUNT(*) AS Attrition_Count
FROM hr_data
WHERE Attrition = 1
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;
SELECT
    JobRole,
    COUNT(*) AS Attrition_Count
FROM hr_data
WHERE Attrition = 1
GROUP BY JobRole
ORDER BY Attrition_Count DESC;
SELECT
    BusinessTravel,
    COUNT(*) AS Attrition_Count
FROM hr_data
WHERE Attrition = 1
GROUP BY BusinessTravel
ORDER BY Attrition_Count DESC;
SELECT
    Department,
    OverTime,

    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        ELSE 'Above 40'
    END AS Age_Group,

    COUNT(*) AS Attrition_Count

FROM hr_data

WHERE Attrition = 1

GROUP BY
    Department,
    OverTime,

    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        ELSE 'Above 40'
    END

ORDER BY Attrition_Count DESC;
SELECT
    Department,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Income
FROM hr_data
GROUP BY Department
ORDER BY Avg_Income DESC;
SELECT
    Gender,
    COUNT(*) AS Attrition_Count
FROM hr_data
WHERE Attrition = 1
GROUP BY Gender;
SELECT
    YearsAtCompany,
    COUNT(*) AS Attrition_Count
FROM hr_data
WHERE Attrition = 1
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;