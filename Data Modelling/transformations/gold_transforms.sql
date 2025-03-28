CREATE OR REPLACE LIVE VIEW baggage_data_transformed AS
  SELECT 
    bag_id,
    passenger_id,
    flight_id,
    weight_kg,
    status ,
    event_time,
    ROW_NUMBER() OVER (PARTITION BY bag_id ORDER BY event_time DESC) AS rn
  FROM live.baggage_events;

CREATE OR REPLACE LIVE TABLE gshen_eia_catalog.eia_gold.bag_status AS
  SELECT 
    bag_id,
    passenger_id,
    flight_id,
    weight_kg,
    event_time,
    status as current_status
  FROM live.baggage_data_transformed
  where rn = 1;


