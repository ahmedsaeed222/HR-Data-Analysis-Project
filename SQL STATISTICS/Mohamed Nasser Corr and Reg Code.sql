-- Correlation Part
SELECT
(
AVG(Age * Attrition) - AVG(Age) * AVG(Attrition)
)
/
(STDDEV(Age) * STDDEV(Attrition))
AS corr_Age,

-- DailyRate
(
AVG(DailyRate * Attrition) - AVG(DailyRate) * AVG(Attrition)
)
/
(STDDEV(DailyRate) * STDDEV(Attrition))
AS corr_DailyRate,

-- Travel Frequencey
(
AVG(BusinessTravel* Attrition) - AVG(BusinessTravel) * AVG(Attrition)
)
/
(STDDEV(BusinessTravel) * STDDEV(Attrition))
AS corr_travelfrequency,

-- DistanceFromHome
(
AVG(DistanceFromHome * Attrition) - AVG(DistanceFromHome) * AVG(Attrition)
)
/
(STDDEV(DistanceFromHome) * STDDEV(Attrition))
AS corr_DistanceFromHome,

-- Education
(
AVG(Education * Attrition) - AVG(Education) * AVG(Attrition)
)
/
(STDDEV(Education) * STDDEV(Attrition))
AS corr_Education,

-- HourlyRate
(
AVG(HourlyRate * Attrition) - AVG(HourlyRate) * AVG(Attrition)
)
/
(STDDEV(HourlyRate) * STDDEV(Attrition))
AS corr_HourlyRate,

-- JobInvolvement
(
AVG(JobInvolvement * Attrition) - AVG(JobInvolvement) * AVG(Attrition)
)
/
(STDDEV(JobInvolvement) * STDDEV(Attrition))
AS corr_JobInvolvement,

-- JobLevel
(
AVG(JobLevel * Attrition) - AVG(JobLevel) * AVG(Attrition)
)
/
(STDDEV(JobLevel) * STDDEV(Attrition))
AS corr_JobLevel,

-- JobSatisfaction
(
AVG(JobSatisfaction * Attrition) - AVG(JobSatisfaction) * AVG(Attrition)
)
/
(STDDEV(JobSatisfaction) * STDDEV(Attrition))
AS corr_JobSatisfaction,

-- MonthlyIncome
(
AVG(MonthlyIncome * Attrition) - AVG(MonthlyIncome) * AVG(Attrition)
)
/
(STDDEV(MonthlyIncome) * STDDEV(Attrition))
AS corr_MonthlyIncome,

-- MonthlyRate
(
AVG(MonthlyRate * Attrition) - AVG(MonthlyRate) * AVG(Attrition)
)
/
(STDDEV(MonthlyRate) * STDDEV(Attrition))
AS corr_MonthlyRate,

-- NumCompaniesWorked
(
AVG(NumCompaniesWorked * Attrition) - AVG(NumCompaniesWorked) * AVG(Attrition)
)
/
(STDDEV(NumCompaniesWorked) * STDDEV(Attrition))
AS corr_NumCompaniesWorked,

-- PercentSalaryHike
(
AVG(PercentSalaryHike * Attrition) - AVG(PercentSalaryHike) * AVG(Attrition)
)
/
(STDDEV(PercentSalaryHike) * STDDEV(Attrition))
AS corr_PercentSalaryHike,

-- PerformanceRating
(
AVG(PerformanceRating * Attrition) - AVG(PerformanceRating) * AVG(Attrition)
)
/
(STDDEV(PerformanceRating) * STDDEV(Attrition))
AS corr_PerformanceRating,

-- RelationshipSatisfaction
(
AVG(RelationshipSatisfaction * Attrition) - AVG(RelationshipSatisfaction) * AVG(Attrition)
)
/
(STDDEV(RelationshipSatisfaction) * STDDEV(Attrition))
AS corr_RelationshipSatisfaction,

-- StockOptionLevel
(
AVG(StockOptionLevel * Attrition) - AVG(StockOptionLevel) * AVG(Attrition)
)
/
(STDDEV(StockOptionLevel) * STDDEV(Attrition))
AS corr_StockOptionLevel,

-- TotalWorkingYears
(
AVG(TotalWorkingYears * Attrition) - AVG(TotalWorkingYears) * AVG(Attrition)
)
/
(STDDEV(TotalWorkingYears) * STDDEV(Attrition))
AS corr_TotalWorkingYears,

-- TrainingTimesLastYear
(
AVG(TrainingTimesLastYear * Attrition) - AVG(TrainingTimesLastYear) * AVG(Attrition)
)
/
(STDDEV(TrainingTimesLastYear) * STDDEV(Attrition))
AS corr_TrainingTimesLastYear,

-- WorkLifeBalance
(
AVG(WorkLifeBalance * Attrition) - AVG(WorkLifeBalance) * AVG(Attrition)
)
/
(STDDEV(WorkLifeBalance) * STDDEV(Attrition))
AS corr_WorkLifeBalance,

-- YearsAtCompany
(
AVG(YearsAtCompany * Attrition) - AVG(YearsAtCompany) * AVG(Attrition)
)
/
(STDDEV(YearsAtCompany) * STDDEV(Attrition))
AS corr_YearsAtCompany,

-- YearsInCurrentRole
(
AVG(YearsInCurrentRole * Attrition)
- AVG(YearsInCurrentRole) * AVG(Attrition)
)
/
(
STDDEV(YearsInCurrentRole) * STDDEV(Attrition)
)
AS corr_YearsInCurrentRole,

-- YearsSinceLastPromotion
(
AVG(YearsSinceLastPromotion * Attrition)
- AVG(YearsSinceLastPromotion) * AVG(Attrition)
)
/
(
STDDEV(YearsSinceLastPromotion) * STDDEV(Attrition)
)
AS corr_YearsSinceLastPromotion,

-- YearsWithCurrManager
(
AVG(YearsWithCurrManager * Attrition)
- AVG(YearsWithCurrManager) * AVG(Attrition)
)
/
(
STDDEV(YearsWithCurrManager) * STDDEV(Attrition)
)
AS corr_YearsWithCurrManager

FROM new_schema.`hr_cleaned_1(sheet1)`;

-- Regression part

SELECT

-- Age
(
(
AVG(Age * Attrition)
- AVG(Age) * AVG(Attrition)
)
/
(
AVG(Age * Age)
- POWER(AVG(Age), 2)
)
)
AS beta_Age,

-- BusinessTravel
(
(
AVG(BusinessTravel * Attrition)
- AVG(BusinessTravel) * AVG(Attrition)
)
/
(
AVG(BusinessTravel * BusinessTravel)
- POWER(AVG(BusinessTravel), 2)
)
)
AS beta_BusinessTravel,

-- DailyRate
(
(
AVG(DailyRate * Attrition)
- AVG(DailyRate) * AVG(Attrition)
)
/
(
AVG(DailyRate * DailyRate)
- POWER(AVG(DailyRate), 2)
)
)
AS beta_DailyRate,

-- DistanceFromHome
(
(
AVG(DistanceFromHome * Attrition)
- AVG(DistanceFromHome) * AVG(Attrition)
)
/
(
AVG(DistanceFromHome * DistanceFromHome)
- POWER(AVG(DistanceFromHome), 2)
)
)
AS beta_DistanceFromHome,

-- Education
(
(
AVG(Education * Attrition)
- AVG(Education) * AVG(Attrition)
)
/
(
AVG(Education * Education)
- POWER(AVG(Education), 2)
)
)
AS beta_Education,

-- HourlyRate
(
(
AVG(HourlyRate * Attrition)
- AVG(HourlyRate) * AVG(Attrition)
)
/
(
AVG(HourlyRate * HourlyRate)
- POWER(AVG(HourlyRate), 2)
)
)
AS beta_HourlyRate,

-- JobInvolvement
(
(
AVG(JobInvolvement * Attrition)
- AVG(JobInvolvement) * AVG(Attrition)
)
/
(
AVG(JobInvolvement * JobInvolvement)
- POWER(AVG(JobInvolvement), 2)
)
)
AS beta_JobInvolvement,

-- JobLevel
(
(
AVG(JobLevel * Attrition)
- AVG(JobLevel) * AVG(Attrition)
)
/
(
AVG(JobLevel * JobLevel)
- POWER(AVG(JobLevel), 2)
)
)
AS beta_JobLevel,

-- JobSatisfaction
(
(
AVG(JobSatisfaction * Attrition)
- AVG(JobSatisfaction) * AVG(Attrition)
)
/
(
AVG(JobSatisfaction * JobSatisfaction)
- POWER(AVG(JobSatisfaction), 2)
)
)
AS beta_JobSatisfaction,

-- MonthlyIncome
(
(
AVG(MonthlyIncome * Attrition)
- AVG(MonthlyIncome) * AVG(Attrition)
)
/
(
AVG(MonthlyIncome * MonthlyIncome)
- POWER(AVG(MonthlyIncome), 2)
)
)
AS beta_MonthlyIncome,

-- MonthlyRate
(
(
AVG(MonthlyRate * Attrition)
- AVG(MonthlyRate) * AVG(Attrition)
)
/
(
AVG(MonthlyRate * MonthlyRate)
- POWER(AVG(MonthlyRate), 2)
)
)
AS beta_MonthlyRate,

-- NumCompaniesWorked
(
(
AVG(NumCompaniesWorked * Attrition)
- AVG(NumCompaniesWorked) * AVG(Attrition)
)
/
(
AVG(NumCompaniesWorked * NumCompaniesWorked)
- POWER(AVG(NumCompaniesWorked), 2)
)
)
AS beta_NumCompaniesWorked,

-- PercentSalaryHike
(
(
AVG(PercentSalaryHike * Attrition)
- AVG(PercentSalaryHike) * AVG(Attrition)
)
/
(
AVG(PercentSalaryHike * PercentSalaryHike)
- POWER(AVG(PercentSalaryHike), 2)
)
)
AS beta_PercentSalaryHike,

-- PerformanceRating
(
(
AVG(PerformanceRating * Attrition)
- AVG(PerformanceRating) * AVG(Attrition)
)
/
(
AVG(PerformanceRating * PerformanceRating)
- POWER(AVG(PerformanceRating), 2)
)
)
AS beta_PerformanceRating,

-- RelationshipSatisfaction
(
(
AVG(RelationshipSatisfaction * Attrition)
- AVG(RelationshipSatisfaction) * AVG(Attrition)
)
/
(
AVG(RelationshipSatisfaction * RelationshipSatisfaction)
- POWER(AVG(RelationshipSatisfaction), 2)
)
)
AS beta_RelationshipSatisfaction,

-- StockOptionLevel
(
(
AVG(StockOptionLevel * Attrition)
- AVG(StockOptionLevel) * AVG(Attrition)
)
/
(
AVG(StockOptionLevel * StockOptionLevel)
- POWER(AVG(StockOptionLevel), 2)
)
)
AS beta_StockOptionLevel,

-- TotalWorkingYears
(
(
AVG(TotalWorkingYears * Attrition)
- AVG(TotalWorkingYears) * AVG(Attrition)
)
/
(
AVG(TotalWorkingYears * TotalWorkingYears)
- POWER(AVG(TotalWorkingYears), 2)
)
)
AS beta_TotalWorkingYears,

-- TrainingTimesLastYear
(
(
AVG(TrainingTimesLastYear * Attrition)
- AVG(TrainingTimesLastYear) * AVG(Attrition)
)
/
(
AVG(TrainingTimesLastYear * TrainingTimesLastYear)
- POWER(AVG(TrainingTimesLastYear), 2)
)
)
AS beta_TrainingTimesLastYear,

-- WorkLifeBalance
(
(
AVG(WorkLifeBalance * Attrition)
- AVG(WorkLifeBalance) * AVG(Attrition)
)
/
(
AVG(WorkLifeBalance * WorkLifeBalance)
- POWER(AVG(WorkLifeBalance), 2)
)
)
AS beta_WorkLifeBalance,

-- YearsAtCompany
(
(
AVG(YearsAtCompany * Attrition)
- AVG(YearsAtCompany) * AVG(Attrition)
)
/
(
AVG(YearsAtCompany * YearsAtCompany)
- POWER(AVG(YearsAtCompany), 2)
)
)
AS beta_YearsAtCompany,

-- YearsInCurrentRole
(
(
AVG(YearsInCurrentRole * Attrition)
- AVG(YearsInCurrentRole) * AVG(Attrition)
)
/
(
AVG(YearsInCurrentRole * YearsInCurrentRole)
- POWER(AVG(YearsInCurrentRole), 2)
)
)
AS beta_YearsInCurrentRole,

-- YearsSinceLastPromotion
(
(
AVG(YearsSinceLastPromotion * Attrition)
- AVG(YearsSinceLastPromotion) * AVG(Attrition)
)
/
(
AVG(YearsSinceLastPromotion * YearsSinceLastPromotion)
- POWER(AVG(YearsSinceLastPromotion), 2)
)
)
AS beta_YearsSinceLastPromotion,

-- YearsWithCurrManager
(
(
AVG(YearsWithCurrManager * Attrition)
- AVG(YearsWithCurrManager) * AVG(Attrition)
)
/
(
AVG(YearsWithCurrManager * YearsWithCurrManager)
- POWER(AVG(YearsWithCurrManager), 2)
)
)
AS beta_YearsWithCurrManager

FROM new_schema.`hr_cleaned_1(sheet1)`;