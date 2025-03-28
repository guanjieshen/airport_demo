CREATE LIVE TABLE gshen_eia_catalog.eia_gold.passenger_360 AS
SELECT 
  p.passenger_id,
  p.name,
  p.flight_id,
  p.airline,
  p.origin,
  p.seat_number,
  f.scheduled_arrival,
  f.actual_arrival,
  g.gate_number,
  b.bag_id,
  b.weight_kg,
  b.current_status,
  b.event_time 
FROM live.passenger_details p
JOIN live.flight_details f ON p.flight_id = f.flight_id
LEFT JOIN live.gate_assignments g ON p.flight_id = g.flight_id
LEFT JOIN gshen_eia_catalog.eia_gold.bag_status b on p.passenger_id = b.passenger_id