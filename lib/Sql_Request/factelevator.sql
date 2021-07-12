SELECT building_city , customerid , COUNT(*) AS nbElevatorPerCust
FROM factelevator
GROUP BY 1,2 ;