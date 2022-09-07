
-- 1. Simply pull hospital visits  (THIS ONE)
-- 2. Add in hospital numbers (MRN) and handle patient merges 
-- 3. Add in patient demographics

-- Starting out with hospital visits
-- picking up the current MRN 
-- AND NOW adding in some basic demographics

SELECT
   vo.hospital_visit_id
  ,vo.encounter
  -- admission to hospital
  ,vo.admission_datetime
  ,vo.arrival_method
  ,vo.presentation_datetime
  -- discharge from hospital
  -- NB: Outpatients have admission events but not discharge events
  ,vo.discharge_datetime
  ,vo.discharge_disposition

-- start from hospital visits
FROM star.hospital_visit vo
WHERE 
      -- hospital visits within the last 12 hours
      vo.presentation_datetime > NOW() - '12 HOURS'::INTERVAL	
      -- emergencies
  AND vo.patient_class = 'EMERGENCY'
      -- attending via ambulance
  AND vo.arrival_method = 'Ambulance'
      -- sort descending
ORDER BY vo.presentation_datetime DESC
; 