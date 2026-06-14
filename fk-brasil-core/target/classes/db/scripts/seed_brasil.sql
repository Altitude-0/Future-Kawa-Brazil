INSERT INTO country (id, code_iso) VALUES (gen_random_uuid(), 'BR') ON CONFLICT DO NOTHING;

INSERT INTO warehouse (id, name, fk_country)
SELECT gen_random_uuid(), 'Armazém Central São Paulo', id 
FROM country WHERE code_iso = 'BR';

INSERT INTO containers (id, reference, status, entry_date, fk_warehouse)
SELECT gen_random_uuid(), 'CONT-BR-' || LPAD(s.id::text, 3, '0'), 'COMPLIANT', now(), (SELECT id FROM warehouse LIMIT 1)
FROM generate_series(1, 100) AS s(id);

INSERT INTO sensors_type (id, sensor_type) VALUES (gen_random_uuid(), 'DHT22') ON CONFLICT DO NOTHING;

INSERT INTO sensors (id, reference, entry_date, fk_sensor_type)
SELECT gen_random_uuid(), 'SN-BR-' || LPAD(s.id::text, 3, '0'), now(), (SELECT id FROM sensors_type WHERE sensor_type = 'DHT22' LIMIT 1)
FROM generate_series(1, 100) AS s(id);

UPDATE containers SET id_sensor = (SELECT id FROM sensors WHERE reference = 'SN-BR-' || SUBSTRING(containers.reference FROM 9))
WHERE reference LIKE 'CONT-BR-%';

INSERT INTO measurements (id, temperature, humidity, created_at, fk_sensors)
SELECT gen_random_uuid(), 28.0 + (random() * 4.0), 50.0 + (random() * 10.0), now() - (m.id * interval '1 hour'), s.id
FROM sensors s CROSS JOIN generate_series(1, 5) AS m(id);

-- Check before inserting users to prevent conflict with default users if they are already created by the code
INSERT INTO users (id, username, password, email, role, enabled, created_at) VALUES 
(gen_random_uuid(), 'admin_br', '$2a$10$x.jS5J/3fVv8Z3v3v3v3v.v3v3v3v3v3v3v3v3v3v3v3v3v3v3v3', 'admin_br@futurekawa.br', 'ADMIN', true, now()),
(gen_random_uuid(), 'manager_br', '$2a$10$x.jS5J/3fVv8Z3v3v3v3v.v3v3v3v3v3v3v3v3v3v3v3v3v3v3v3', 'manager_br@futurekawa.br', 'OPERATOR', true, now());
