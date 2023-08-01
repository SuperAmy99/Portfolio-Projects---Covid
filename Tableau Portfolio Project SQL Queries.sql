/*

Queries used for Tableau Project

*/



-- 1. Global Numbers

SELECT SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent is not null 
ORDER BY 1,2


-- 2. Total Deaths Per Continent

SELECT location, SUM(cast(new_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent is null 
and location not in ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount desc


-- 3. Percent Population Infected Per Country

SELECT Location, COALESCE(Population, 0) AS Population, MAX(COALESCE(total_cases, 0)) as HighestInfectionCount,  Max(COALESCE((total_cases / population), 0))*100 as PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY Location, Population
ORDER BY PercentPopulationInfected desc



-- 4. Percent Population Infected


SELECT Location, COALESCE(Population, 0) AS Population, date, COALESCE(MAX(total_cases), 0) as HighestInfectionCount,  Max(COALESCE((total_cases/population), 0))*100 as PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected desc












