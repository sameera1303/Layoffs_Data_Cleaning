-- DATA CLEANING

SELECT *
FROM layoffs;

-- 1. Remove Duplicates
-- 2.Standardize the data
-- 3.Null Values or blank values
-- 4.Remove Any Columns

CREATE TABLE layoffs_staging 
LIKE layoffs;
 
 SELECT *
 FROM layoffs_staging ;
 
 INSERT layoffs_staging
 SELECT *
 FROM layoffs ;
 
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, 'date', stage, country ,funds_raised_millions) AS row_num
FROM layoffs_staging ;

 WITH duplicate_cte AS
 (
 SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, 'date' ,stage, country ,funds_raised_millions) AS row_num
FROM layoffs_staging 
)
SELECT *
FROM duplicate_cte 
WHERE row_num > 1;

 SELECT *
 FROM layoffs_staging
 WHERE company = 'Casper';
 
 
 WITH duplicate_cte AS
(
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY company,
                            location,
                            industry,
                            total_laid_off,
                            percentage_laid_off,
                            `date`,
                            stage,
                            country,
                            funds_raised_millions
           ) AS duplicate_row_num
    FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE duplicate_row_num > 1;CREATE TABLE `layoffs_staging` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT *
 FROM layoffs_staging2
 WHERE duplicate_row_num > 1;
 
 DROP TABLE IF EXISTS layoffs_staging2;
 
 CREATE TABLE layoffs_staging2 AS
SELECT *,
       ROW_NUMBER() OVER (
           PARTITION BY company,
                        location,
                        industry,
                        total_laid_off,
                        percentage_laid_off,
                        `date`,
                        stage,
                        country,
                        funds_raised_millions
       ) AS duplicate_row_num
FROM layoffs_staging;
 

 SELECT *
FROM layoffs_staging2
WHERE duplicate_row_num > 1;


SELECT *
FROM layoffs_staging2;

-- STANDARDIZING DATA
SELECT  DISTINCT company, TRIM(company)
FROM layoffs_staging2;


UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT  DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

SELECT  *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%' ;

UPDATE layoffs_staging2
SET indsutry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT  DISTINCT location 
FROM layoffs_staging2
ORDER BY 1;


SELECT  DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1 ;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT `date`
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');


ALTER TABLE  layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

UPDATE laysoffs_staging2
SET industry = NULL
WHERE industry = '';

SELECT  *
FROM layoffs_staging2
WHERE company = 'Airbnb'; 



SELECT t1.industry, t2.inndustry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industrY IS NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE industry IS NULL 
AND t2.industrY IS NULL;

SELECT *
FROM layoffs_staging2
WHERE industry = '';

UPDATE layoffs_staging2
SET industry = null
WHERE industry = '';

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE industry IS NULL 
AND t2.industrY IS NULL;

SELECT *
FROM layoffs_staging2
WHERE industry = '';

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE industry IS NULL 
AND t2.industrY IS NULL;

SELECT *
FROM layoffs_staging2
WHERE industry = '';


UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE industry IS NULL 
AND t2.industrY IS NULL;

SELECT *
FROM layoffs_staging2
WHERE industry = '';

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE industry IS NULL 
AND t2.industrY IS NULL;

SELECT *
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

