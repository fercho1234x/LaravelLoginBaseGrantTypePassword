Usuarios
ALTER TABLE usuarios RENAME users;

alter table users drop registro;
alter table users drop apellido_materno;
alter table users drop sexo;
alter table users drop fecha_nacimiento;
alter table users drop estatus;
alter table users drop nombre_empresa_cliente;

ALTER TABLE users CHANGE empresa_id company_id INTEGER;
ALTER TABLE users CHANGE nombre name TEXT;
ALTER TABLE users CHANGE apellido_paterno surnames TEXT;
ALTER TABLE users CHANGE tipo_usuario user_type TEXT;
ALTER TABLE users CHANGE correo_electronico email TEXT;
ALTER TABLE users CHANGE contrasenia password TEXT;
ALTER TABLE users CHANGE img_perfil img_profile TEXT;
ALTER TABLE users CHANGE ultima_session last_session TEXT;
ALTER TABLE users CHANGE vendedor_id user_registry_id INTEGER;
ALTER TABLE users CHANGE usuario_registro_id admin_registry_id INTEGER;

ALTER TABLE users ADD created_at DATETIME DEFAULT NULL;
ALTER TABLE users ADD updated_at DATETIME DEFAULT NULL;
ALTER TABLE users ADD remember_token VARCHAR(100);

ALTER TABLE users MODIFY user_registry_id INT AFTER company_id;
ALTER TABLE users MODIFY admin_registry_id INT AFTER user_registry_id;

Empresas
ALTER TABLE empresas RENAME companies;
ALTER TABLE companies CHANGE nombre_empresa name_company TEXT;
ALTER TABLE companies CHANGE numero_celular cell_phone TEXT;
ALTER TABLE companies CHANGE numero_local phone_number TEXT;
ALTER TABLE companies CHANGE pais country TEXT;
ALTER TABLE companies CHANGE clave_fiscal fiscal_key TEXT;
ALTER TABLE companies CHANGE direccion_fiscal fiscal_address TEXT;
ALTER TABLE companies CHANGE razon_social bussiness_name TEXT;
ALTER TABLE companies CHANGE correo_facturacion billing_mail TEXT;
ALTER TABLE companies CHANGE billing_mail billing_email TEXT;
ALTER TABLE companies CHANGE rol role TEXT;

ALTER TABLE companies ADD created_at DATETIME DEFAULT NULL;
ALTER TABLE companies ADD updated_at DATETIME DEFAULT NULL;

alter table companies drop registro;

Pantallas
ALTER TABLE pantallas RENAME screens;
ALTER TABLE screens CHANGE empresa_id company_id INTEGER;
ALTER TABLE screens CHANGE pantalla_id provider_screen_id TEXT;
ALTER TABLE screens CHANGE tipo type TEXT;
ALTER TABLE screens CHANGE pais country TEXT;
ALTER TABLE screens CHANGE estado state TEXT;
ALTER TABLE screens CHANGE municipio_delegacion town_hall_delegation TEXT;
ALTER TABLE screens CHANGE colonia suburb TEXT;
ALTER TABLE screens CHANGE calle street TEXT;
ALTER TABLE screens CHANGE numero location_number TEXT;
ALTER TABLE screens CHANGE codigo_postal postal_code TEXT;
ALTER TABLE screens CHANGE latitud latitude TEXT;
ALTER TABLE screens CHANGE longitud longitude TEXT;
ALTER TABLE screens CHANGE medidas_pixeles measure_in_pixels TEXT;
ALTER TABLE screens CHANGE medidas_metros measured_in_meters TEXT;
ALTER TABLE screens CHANGE impactos_promedio_mensual average_monthly_impacts TEXT;
ALTER TABLE screens CHANGE velocidad_promedio average_speed TEXT;
ALTER TABLE screens CHANGE testigo_fotografico photographic_witness TEXT;
ALTER TABLE screens CHANGE tiempo_spot_segundos spot_time_seconds TEXT;
ALTER TABLE screens CHANGE moneda_local local_currency TEXT;
ALTER TABLE screens CHANGE descripcion description TEXT;
ALTER TABLE screens CHANGE observaciones_compra purchase_remarks TEXT;
ALTER TABLE screens CHANGE tiempo_testigos witness_time TEXT;
ALTER TABLE screens CHANGE tipo_negocio business_type TEXT;
ALTER TABLE screens CHANGE nombre_negocio business_name TEXT;
ALTER TABLE screens CHANGE numero_pantallas number_screens TEXT;
ALTER TABLE screens CHANGE pantalla_nombre display_name TEXT;
ALTER TABLE screens CHANGE imagen_soportado supports_image TEXT;
ALTER TABLE screens CHANGE video_soportado supports_video TEXT;
ALTER TABLE screens CHANGE imagen_gif_soportado supports_image_gif TEXT;
ALTER TABLE screens CHANGE dias_minimos minimum_days TEXT;
ALTER TABLE screens CHANGE spots_minimos minimum_spots TEXT;
ALTER TABLE screens CHANGE programatic_tradicional programatic_traditional TEXT;
ALTER TABLE screens CHANGE circuito_id circuit_id INTEGER;
ALTER TABLE screens CHANGE id_data name_of_the_data_provider TEXT;
ALTER TABLE screens CHANGE data_proveedor provider_data_id TEXT;

ALTER TABLE screens ADD created_at DATETIME DEFAULT NULL;
ALTER TABLE screens ADD updated_at DATETIME DEFAULT NULL;

alter table screens drop proveedor_nombre;
alter table screens drop url;
alter table screens drop usd;
alter table screens drop formato;

Circuito
ALTER TABLE circuitos RENAME circuits;
ALTER TABLE circuits CHANGE nombre name TEXT;
ALTER TABLE circuits ADD created_at DATETIME DEFAULT NULL;
ALTER TABLE circuits ADD updated_at DATETIME DEFAULT NULL;
ALTER TABLE circuits drop registro;

Campañas
ALTER TABLE campana RENAME campaigns;
ALTER TABLE campaigns CHANGE usuario_registro_id user_registry_id INTEGER;
ALTER TABLE campaigns CHANGE nombre name TEXT;
ALTER TABLE campaigns CHANGE comentario comentary TEXT;
ALTER TABLE campaigns CHANGE tipo_campana type_of_campaign TEXT;
ALTER TABLE campaigns CHANGE inversion investment TEXT;
ALTER TABLE campaigns CHANGE inicio start TEXT;
ALTER TABLE campaigns CHANGE fin finish TEXT;
ALTER TABLE campaigns CHANGE estatus status TEXT;
ALTER TABLE campaigns CHANGE cliente_campania_id customer_campaign_id INTEGER;
ALTER TABLE campaigns CHANGE pais country TEXT;
ALTER TABLE campaigns ADD created_at DATETIME DEFAULT NULL;
ALTER TABLE campaigns ADD updated_at DATETIME DEFAULT NULL;
ALTER TABLE campaigns drop registro;

ALTER TABLE campaigns ADD editable AFTER country NUMBER DEFAULT 1;

Campaña Pantallas Controller
ALTER TABLE pantallas_campania RENAME campaign_screens;
ALTER TABLE campaign_screens CHANGE campania_id campaign_id INTEGER;
ALTER TABLE campaign_screens CHANGE pantalla_id screen_id INTEGER;
ALTER TABLE campaign_screens ADD created_at DATETIME DEFAULT NULL;
ALTER TABLE campaign_screens ADD updated_at DATETIME DEFAULT NULL;
ALTER TABLE campaign_screens drop registro;

TAGS
ALTER TABLE tags CHANGE tag title_tag TEXT;
ALTER TABLE tags ADD created_at DATETIME DEFAULT NULL;
ALTER TABLE tags ADD updated_at DATETIME DEFAULT NULL;
ALTER TABLE tags drop registro;

PAISES
ALTER TABLE paises RENAME countries;
ALTER TABLE countries CHANGE nombre_pais country_name TEXT;
ALTER TABLE countries CHANGE cambio_dollar dollar_change TEXT;
ALTER TABLE countries CHANGE impuesto tax TEXT;
ALTER TABLE countries CHANGE tipo_moneda type_of_currency TEXT;
ALTER TABLE tags ADD created_at DATETIME DEFAULT NULL;
ALTER TABLE tags ADD updated_at DATETIME DEFAULT NULL;
ALTER TABLE tags drop registro;

POLIGONOS CAMPAÑA
ALTER TABLE campaign_polygons RENAME polygons;
ALTER TABLE campaign_polygons CHANGE campania_id campaign_id INT;
ALTER TABLE campaign_polygons CHANGE poligono polygon JSON;
ALTER TABLE campaign_polygons ADD created_at DATETIME DEFAULT NULL;
ALTER TABLE campaign_polygons ADD updated_at DATETIME DEFAULT NULL;
ALTER TABLE campaign_polygons drop registro;

PUNTOS INTERES CAMPANA
ALTER TABLE putnos_interes_campana RENAME campaign_points_of_interest;
ALTER TABLE campaign_points_of_interest RENAME points_of_interest;
ALTER TABLE points_of_interest CHANGE id_reg id INT;
ALTER TABLE points_of_interest CHANGE campania_id campaign_id INT;
ALTER TABLE points_of_interest CHANGE nombre name TEXT;
ALTER TABLE points_of_interest CHANGE direccion address TEXT;
ALTER TABLE points_of_interest CHANGE latitud latitude TEXT;
ALTER TABLE points_of_interest CHANGE longitud longitude TEXT;
ALTER TABLE points_of_interest ADD created_at DATETIME DEFAULT NULL;
ALTER TABLE points_of_interest ADD updated_at DATETIME DEFAULT NULL;
ALTER TABLE points_of_interest drop registro;

ALTER TABLE points_of_interest CHANGE id google_id TEXT;