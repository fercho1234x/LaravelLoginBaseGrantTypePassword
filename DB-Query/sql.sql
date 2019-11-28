CREATE TABLE walls(
    id INT AUTO_INCREMENT,
    provider_id INT,
    wall_id TEXT,
    country TEXT,
    state TEXT,
    town_hall_delegation TEXT,
    suburb TEXT,
    street TEXT,
    location_number TEXT,
    postal_code TEXT,
    latitude TEXT,
    longitude TEXT,
    vertical_horizontal TEXT,
    measured_in_meters TEXT,
    average_monthly_impacts TEXT,
    average_speed TEXT,
    local_currency TEXT,
    description TEXT,
    main_img TEXT,
    created_at DATETIME DEFAULT NULL,
    updated_at DATETIME DEFAULT NULL,
    CONSTRAINT pk_walls PRIMARY KEY(id),
    CONSTRAINT fk_walls_companies FOREIGN KEY(provider_id) REFERENCES companies(id));

CREATE TABLE campaign_walls(
    id INT AUTO_INCREMENT,
    campaign_id INT,
    wall_id INT,
    flag TEXT,
    created_at DATETIME DEFAULT NULL,
    updated_at DATETIME DEFAULT NULL,
    CONSTRAINT pk_campaign_walls PRIMARY KEY( id ),
    CONSTRAINT fk_campaign_w FOREIGN KEY( campaign_id ) REFERENCES campaigns( id ),
    CONSTRAINT fk_walls_c FOREIGN KEY( wall_id ) REFERENCES walls( id ) );

CREATE TABLE wall_gallery(
    id INT AUTO_INCREMENT,
    wall_id INT,
    img TEXT,
    created_at DATETIME DEFAULT NULL,
    updated_at DATETIME DEFAULT NULL,
    CONSTRAINT pk_wall_gallery PRIMARY KEY( id ),
    CONSTRAINT fk_wall_g FOREIGN KEY( wall_id ) REFERENCES walls( id )
)

ALTER TABLE walls ADD reserved BOOLEAN default 0 AFTER main_img;