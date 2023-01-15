-- VIEW DATASETS
select *
from location_ev

select *
from charging_facility_avail

select *
from charging_sanc_stn


-- REMOVING AND CHECKING WHITE SPACES
select length("States") as l1, length(trim("States"))  as l2
from location_ev
where length("States") !=  length(trim("States"))


-- FULL JOIN ON AVAIL AND SANC CHARGING STATIONS PER STATES
select *
from charging_facility_avail as avail
full join charging_sanc_stn as sanc
on sanc."States" = avail."States"

   -- filling missing states name using case statement
select  
case
    when avail."States" is null then sanc."States"
    else avail."States" end as States_ind ,
"charging_avail" , "num_Sanc"                
from charging_facility_avail as avail
full join charging_sanc_stn as sanc
on avail."States" = sanc."States"

-- CHECKING NULLS IN GEOSPACIAL LOCATION DATASET
  -- missing values are filled with lat-long values from google earth 
select *
from charging_facility_avail as avail
full join location_ev as loc
on loc."States" = avail."States"
where "Latitude" is null or "Longitude" is null

-- missing values are filled with lat-long values from google earth 
insert into location_ev ("States", "Latitude" , "Longitude")
values ('Chandigarh' , 30.741482 , 76.768066)

insert into location_ev ("States", "Latitude" , "Longitude")
values('Leh' , 34.152588, 77.577049 ) , 
('Puducherry' , 11.916064 , 79.812325 )

-- MAINTAING CONSISTENCY IN STATES NAME BY UPDATING THE STRING WITH STANDARD NAMING. 
update location_ev
set "States" = replace("States" , 'Andaman and Nicobar Islands' , 
                       'Andaman and Nicobar (Port Blair)')





