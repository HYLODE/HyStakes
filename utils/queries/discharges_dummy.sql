
SELECT
 left(md5(lv.hospital_visit_id::TEXT), 6) id
--,lv.location_visit_id
--,lv.admission_datetime admit_dt_bed
--,lv.discharge_datetime disch_dt_bed
--,hv.admission_datetime admit_dt_hosp
--,hv.discharge_datetime disch_dt_hosp
,ROUND(EXTRACT(epoch FROM 
    (hv.discharge_datetime - (NOW() - '336 HOURS'::INTERVAL)
    ))/3600) hours_to_discharge
--,hv.discharge_destination
--,hv.patient_class
--,lo.location_string
,dept.name department

-- include age rounded to 5
, ROUND(DATE_PART('year',AGE(cd.date_of_birth ))/5) * 5 AGE

-- add last heart rate
,hr.value_as_real pulse
--,hr.observation_datetime


FROM star.location_visit lv
LEFT JOIN star.location lo ON lv.location_id = lo.location_id
LEFT JOIN star.department dept ON lo.department_id = dept.department_id 
LEFT JOIN star.hospital_visit hv ON lv.hospital_visit_id = hv.hospital_visit_id
LEFT JOIN star.core_demographic cd ON hv.mrn_id = cd.mrn_id
LEFT JOIN (
    WITH obs AS (
        SELECT

         vo.visit_observation_id
        ,vo.hospital_visit_id
        ,vo.observation_datetime
        ,vo.value_as_real
        ,ot.name

        FROM star.visit_observation vo
        LEFT JOIN star.visit_observation_type ot ON vo.visit_observation_type_id = ot.visit_observation_type_id
        WHERE 
        ot.id_in_application = '8' -- heart rate
        AND
        vo.observation_datetime < NOW() - '336 HOURS'::INTERVAL 
        AND
        vo.observation_datetime > NOW() - '360 HOURS'::INTERVAL 
    ),
    obs_tail AS (
        SELECT 
         obs.*
        ,row_number() over (partition BY obs.hospital_visit_id ORDER BY obs.observation_datetime DESC) obs_tail
        FROM obs
    )
    SELECT 
     visit_observation_id
    ,hospital_visit_id
    ,observation_datetime
    ,value_as_real
    ,NAME
    FROM obs_tail 
    WHERE obs_tail = 1
) hr -- heart rate
ON lv.hospital_visit_id = hr.hospital_visit_id

WHERE 
dept.name IN (
'UCH T03 INTENSIVE CARE'
,'UCH SDEC'
,'UCH T01 ACUTE MEDICAL'
,'UCH T01 ENHANCED CARE'
,'UCH T06 HEAD (T06H)'
,'UCH T06 CENTRAL (T06C)'
,'UCH T06 SOUTH PACU'
,'UCH T06 GYNAE (T06G)'
,'UCH T07 NORTH (T07N)'
,'UCH T07 CV SURGE'
,'UCH T07 SOUTH'
,'UCH T07 SOUTH (T07S)'
,'UCH T07 HDRU'
,'UCH T08 NORTH (T08N)'
,'UCH T08 SOUTH (T08S)'
,'UCH T08S ARCU'
,'UCH T09 SOUTH (T09S)'
,'UCH T09 NORTH (T09N)'
,'UCH T09 CENTRAL (T09C)'
,'UCH T10 SOUTH (T10S)'
,'UCH T10 NORTH (T10N)'
,'UCH T10 MED (T10M)'
,'UCH T11 SOUTH (T11S)'
,'UCH T11 NORTH (T11N)'
,'UCH T11 EAST (T11E)'
,'UCH T11 NORTH (T11NO)'
,'UCH T12 SOUTH (T12S)'
,'UCH T12 NORTH (T12N)'
,'UCH T13 SOUTH (T13S)'
,'UCH T13 NORTH ONCOLOGY'
,'UCH T13 NORTH (T13N)'
,'UCH T14 NORTH TRAUMA'
,'UCH T14 NORTH (T14N)'
,'UCH T14 SOUTH ASU'
,'UCH T14 SOUTH (T14S)'
,'UCH T15 SOUTH DECANT'
,'UCH T15 SOUTH (T15S)'
,'UCH T15 NORTH (T15N)'
,'UCH T15 NORTH DECANT'
,'UCH T16 NORTH (T16N)'
,'UCH T16 SOUTH (T16S)'
,'UCH T16 SOUTH WINTER'

)
AND
lv.admission_datetime < NOW() - '336 HOURS'::INTERVAL 
AND
    (lv.discharge_datetime > NOW() - '336 HOURS'::INTERVAL 
     OR
      -- confirm both bed and hospital discharge is null else ghosts!
      (lv.discharge_datetime IS NULL AND hv.discharge_datetime IS NULL)
    )
AND 
lo.location_string NOT LIKE '%WAIT%'
AND 
lo.location_string NOT LIKE '%null%'
;