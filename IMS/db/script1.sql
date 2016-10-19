CREATE VIEW [CBUDGET] 
AS 
SELECT a.CWID,a.CNumber,a.LastCNumber,a.PID,b.CPrice,
a.LastCNumber * (b.CPrice) AS CTotal
FROM CBudget_WBS a left join Pro_Resource b on a.PriceID=b.PriceID
;

CREATE VIEW [EBUDGET]
AS
SELECT          a.EWID, a.ENumber, a.LastENumber, a.PID, b.EPrice, a.LastENumber * b.CPrice AS ETotal
FROM              dbo.EBudget_WBS AS a LEFT OUTER JOIN
                            dbo.Pro_Resource AS b ON a.PriceID = b.PriceID
;

CREATE VIEW [dbo].[Report_3in1]
AS
SELECT          A.RPID, A.ReportID, A.ProgressID, A.CompleteProgress, B.ReportID AS Expr1, B.ProjectID, B.ReportDate, 
                            B.MorningWeather, B.AfternoonWeather, B.DataDate, B.ReporterID, B.MorningWork, B.AfternoonWork, 
                            C.ProgressID AS Expr2, C.WBSID, C.WBSName, C.WIID, C.WIName, C.Duration, C.PreWorkID, C.ES, C.EE, C.LS, 
                            C.LE, C.ProjectID AS Expr3, C.CP, C.StartDate, C.EndDate
FROM              dbo.Report_Progress AS A INNER JOIN
                            dbo.Report_Base AS B ON A.ReportID = B.ReportID INNER JOIN
                            dbo.Progress_WIINF AS C ON A.ProgressID = C.ProgressID

