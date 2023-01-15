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
