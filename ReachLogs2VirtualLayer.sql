--This script create a Qgis virtual layer with reach rtk logs for insert data on a postgis table
--Maintainer: Julien Ancelin
-------------------------------------------------------
--Connect to your emlid reach rover and download logs (solution).
  --rename solution_123.erb to solution_123.csv
    --import solution_123.csv in Qgis
      --open dbmanager-->virtualLayers-->QgisLayers
        --open a SQL windows
          -- copy paste this script and modify the FROM name
            -- copy paste data on your db postgresql

SELECT
uuid(),
s.field_1 gps_week,
s.field_2 gps_secondweek, 
--s.field_8 lat, 
--s.field_5 long,
make_point(s.field_8,s.field_5,4326) geom,
s.field_12 height,
s.field_15 rtk_fix_float_sbas_dgps_single_ppp,
s.field_18 satellites,
s.field_21 sdn,
s.field_24 sde,
s.field_27 sdu,
s.field_29 sdne,
s.field_31 sdeu,
s.field_34 sdun,
s.field_37 age,
s.field_41 ratio
FROM solution_201701121152 as s
