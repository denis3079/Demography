WITH Demography (Name, PepCount, Year) AS 
(SELECT
      L.Name,
      D.PepCount,
	  D.Year
   FROM
      dbo.Demo D
      INNER JOIN dbo.Location L
         ON L.ID = D.ID
    WHERE L.Name in ('Кош-Агачский район', 'Башкоркастан', 'Адыгея') AND D.PepCount > 30000 AND D.PepCount < 45000) 
SELECT * FROM Demography
PIVOT (SUM(PepCount) FOR YEAR IN ([2010], [2011], [2012], [2013], [2014], [2015], [2016], [2017], [2018], [2019], [2020])) AS pvt;