-- The 'data_sources' folder contains definitions for all data sources
-- used by the pipeline. Keeping them separate provides a clear overview
-- of the data used and allows for easy swapping of sources during development.

CREATE LIVE TABLE flight_details AS
SELECT *
FROM gshen_eia_catalog.eia_bronze.flight_details_yeg;

CREATE LIVE TABLE gate_assignments AS
SELECT *
FROM gshen_eia_catalog.eia_bronze.gate_assignments_yeg;

CREATE LIVE TABLE passenger_details AS
SELECT *
FROM gshen_eia_catalog.eia_bronze.passenger_details_yeg;


CREATE LIVE TABLE baggage_events AS
SELECT *
FROM gshen_eia_catalog.eia_bronze.baggage_data_stream;