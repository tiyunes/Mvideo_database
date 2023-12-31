-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS database__mvideo.address_books
(
    user_id integer NOT NULL,
    city character varying COLLATE pg_catalog."default" NOT NULL,
    street character varying COLLATE pg_catalog."default" NOT NULL,
    building character varying COLLATE pg_catalog."default" NOT NULL,
    entrance character varying COLLATE pg_catalog."default" NOT NULL,
    apartment character varying COLLATE pg_catalog."default" NOT NULL,
    commentary text COLLATE pg_catalog."default",
    CONSTRAINT address_books_pkey PRIMARY KEY (user_id, apartment, entrance, building, street, city)
);

CREATE TABLE IF NOT EXISTS database__mvideo.bonus_cards
(
    user_id integer NOT NULL,
    card_number character varying COLLATE pg_catalog."default" NOT NULL,
    bonus_cash_amount numeric DEFAULT 0,
    CONSTRAINT bonus_cards_pkey PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.cameras
(
    id integer NOT NULL DEFAULT nextval('database__mvideo.cameras_id_seq'::regclass),
    matrix_resolution numeric NOT NULL,
    zoom numeric NOT NULL,
    matrix_size integer[] NOT NULL,
    focus_min integer NOT NULL,
    focus_max integer NOT NULL,
    quality character varying(100) COLLATE pg_catalog."default" NOT NULL,
    matrix_type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    frame_frequency integer NOT NULL,
    is_wifi boolean NOT NULL,
    description text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cameras_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.carts
(
    user_id integer NOT NULL,
    item_id bigint NOT NULL,
    item_quantity integer NOT NULL,
    accessories json,
    additional_services json,
    CONSTRAINT carts_pkey PRIMARY KEY (user_id, item_id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.favourite_items
(
    item_name character varying COLLATE pg_catalog."default" NOT NULL,
    user_id bigint NOT NULL,
    CONSTRAINT favourite_items_pkey PRIMARY KEY (item_name, user_id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.favourite_stores
(
    user_id integer NOT NULL,
    store character varying COLLATE pg_catalog."default",
    CONSTRAINT favourite_stores_pkey PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.fridges
(
    id bigint NOT NULL DEFAULT nextval('database__mvideo.fridges_id_seq'::regclass),
    color character varying COLLATE pg_catalog."default",
    freezer_volume integer,
    cooling_chamber_volume integer,
    is_freezer_frost boolean,
    is_cooling_frost boolean,
    is_indication boolean,
    regulated_shelves_number integer,
    control_type character varying COLLATE pg_catalog."default",
    CONSTRAINT fridges_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.game_consoles
(
    id integer NOT NULL DEFAULT nextval('database__mvideo.game_consoles_id_seq'::regclass),
    ssd_size integer NOT NULL,
    is_hdr boolean NOT NULL,
    wifi character varying(50) COLLATE pg_catalog."default" NOT NULL,
    guarantee_period integer NOT NULL,
    is_wireless_gamepad boolean NOT NULL,
    CONSTRAINT game_consoles_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.grinders
(
    id integer NOT NULL DEFAULT nextval('database__mvideo.grinders_id_seq'::regclass),
    max_wheel_diameter integer NOT NULL,
    landing_hole_diameter numeric NOT NULL,
    max_rotation_speed integer NOT NULL,
    power_consumption integer NOT NULL,
    guarantee_period integer NOT NULL,
    wheels_number integer NOT NULL,
    description text COLLATE pg_catalog."default",
    CONSTRAINT grinders_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.headphones
(
    id bigint NOT NULL DEFAULT nextval('database__mvideo.headphones_id_seq'::regclass),
    connection_type character varying COLLATE pg_catalog."default",
    color character varying COLLATE pg_catalog."default",
    min_frequency integer,
    max_frequency integer,
    sensitivity integer,
    ear_pads_material character varying COLLATE pg_catalog."default",
    guarantee_period integer,
    is_headset boolean,
    CONSTRAINT headphones_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.hoovers
(
    id integer NOT NULL DEFAULT nextval('database__mvideo.hoovers_id_seq'::regclass),
    suction_power integer NOT NULL,
    nozzles_number integer NOT NULL,
    power_cord_length integer NOT NULL,
    power_consumption integer NOT NULL,
    is_upright boolean NOT NULL,
    weight integer NOT NULL,
    guarantee_period integer NOT NULL,
    description text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT hoovers_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.item_categories
(
    id integer NOT NULL DEFAULT nextval('database__mvideo.item_categories_id_seq'::regclass),
    name character varying COLLATE pg_catalog."default",
    CONSTRAINT item_categories_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE database__mvideo.item_categories
    IS 'Contains existing items'' categories';

CREATE TABLE IF NOT EXISTS database__mvideo.items
(
    id bigint NOT NULL DEFAULT nextval('database__mvideo.items_id_seq'::regclass),
    price numeric NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    description character varying COLLATE pg_catalog."default",
    available_amount integer,
    category_id integer,
    discount numeric DEFAULT 0,
    manufacturer_id integer,
    CONSTRAINT items_pkey PRIMARY KEY (id),
    CONSTRAINT items_name_key UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS database__mvideo.items_within_stores
(
    item_id bigint NOT NULL,
    store_id integer NOT NULL,
    CONSTRAINT items_within_stores_pkey PRIMARY KEY (item_id, store_id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.laptops
(
    id bigint NOT NULL DEFAULT nextval('database__mvideo.laptops_id_seq'::regclass),
    display_resolution character varying COLLATE pg_catalog."default",
    cpu_type text COLLATE pg_catalog."default",
    ssd_size integer,
    os character varying COLLATE pg_catalog."default",
    video_card_type text COLLATE pg_catalog."default",
    ram_size integer,
    weight integer,
    CONSTRAINT laptops_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.manufacturers
(
    id integer NOT NULL DEFAULT nextval('database__mvideo.manufacturers_id_seq'::regclass),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT manufacturers_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.orders
(
    id integer NOT NULL DEFAULT nextval('database__mvideo.orders_id_seq'::regclass),
    user_id integer NOT NULL,
    order_address character varying COLLATE pg_catalog."default" NOT NULL,
    order_date date NOT NULL,
    delivery_method character varying COLLATE pg_catalog."default" NOT NULL,
    order_price numeric NOT NULL,
    item_id bigint NOT NULL,
    CONSTRAINT orders_pkey PRIMARY KEY (id, user_id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.personal_discounts
(
    item_id bigint NOT NULL,
    user_id integer NOT NULL,
    discount numeric,
    CONSTRAINT personal_discounts_pkey PRIMARY KEY (item_id, user_id)
);

COMMENT ON TABLE database__mvideo.personal_discounts
    IS 'Раздел "скидки" в личном кабинете М.ВИДЕО';

CREATE TABLE IF NOT EXISTS database__mvideo.preferenced_delivery_methods
(
    user_id integer NOT NULL,
    delivery_method character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT preferenced_delivery_methods_pkey PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.preferenced_payment_methods
(
    user_id integer NOT NULL,
    payment_method character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT preferenced_payment_methods_pkey PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.smartphones
(
    id bigint NOT NULL DEFAULT nextval('database__mvideo.smartphones_id_seq'::regclass),
    display numeric,
    cpu_type character varying COLLATE pg_catalog."default",
    rom integer,
    camera_quality bigint[],
    CONSTRAINT smartphones_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.stores
(
    id integer NOT NULL DEFAULT nextval('database__mvideo.stores_id_seq'::regclass),
    name character varying COLLATE pg_catalog."default",
    city character varying COLLATE pg_catalog."default" NOT NULL,
    street character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT stores_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.system_units
(
    id bigint NOT NULL DEFAULT nextval('database__mvideo.system_units_id_seq'::regclass),
    cpu_type character varying COLLATE pg_catalog."default",
    ram_size integer,
    video_card character varying COLLATE pg_catalog."default",
    ssd_size integer,
    vram_size integer,
    os text COLLATE pg_catalog."default",
    guarantee_period integer,
    CONSTRAINT system_units_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.tablets
(
    id bigint NOT NULL DEFAULT nextval('database__mvideo.tablets_id_seq'::regclass),
    display_size numeric,
    rom_size integer,
    ram_size integer,
    cores_number integer,
    cpu_frequency numeric,
    bluetooth_module integer,
    internet_standard character varying COLLATE pg_catalog."default",
    CONSTRAINT tablets_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.tvs
(
    id bigint NOT NULL DEFAULT nextval('database__mvideo.tvs_id_seq'::regclass),
    is_hdr boolean,
    hdr_type character varying COLLATE pg_catalog."default",
    is_smarttv boolean,
    is_bluetooth_module boolean,
    os text COLLATE pg_catalog."default",
    is_wifi boolean,
    CONSTRAINT tvs_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.users
(
    id integer NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    surname character varying COLLATE pg_catalog."default" NOT NULL,
    patronymic character varying COLLATE pg_catalog."default",
    email character varying COLLATE pg_catalog."default" NOT NULL,
    gender character varying COLLATE pg_catalog."default",
    date_of_birth date,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    phone character varying COLLATE pg_catalog."default" NOT NULL,
    extra_phone character varying COLLATE pg_catalog."default",
    CONSTRAINT personal_data_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.users_appeals
(
    user_id integer NOT NULL,
    appeal_text text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_appeals_pkey PRIMARY KEY (user_id, appeal_text)
);

CREATE TABLE IF NOT EXISTS database__mvideo.users_linked_social_networks
(
    user_id integer NOT NULL,
    social_network character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_linked_social_networks_pkey PRIMARY KEY (user_id, social_network)
);

CREATE TABLE IF NOT EXISTS database__mvideo.users_mailing
(
    user_id integer NOT NULL,
    email_mailing boolean NOT NULL DEFAULT false,
    sms_mailing boolean NOT NULL DEFAULT false,
    CONSTRAINT users_mailing_pkey PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS database__mvideo.video_recorders
(
    id integer NOT NULL DEFAULT nextval('database__mvideo.video_recorders_id_seq'::regclass),
    fps character varying(100) COLLATE pg_catalog."default" NOT NULL,
    viewing_angle integer NOT NULL,
    max_frame_frequency integer NOT NULL,
    max_resolution integer NOT NULL,
    is_night_shooting boolean NOT NULL,
    recording_interval character varying(10) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT video_recorders_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS database__mvideo.address_books
    ADD CONSTRAINT fkey FOREIGN KEY (user_id)
    REFERENCES database__mvideo.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.bonus_cards
    ADD CONSTRAINT fkey FOREIGN KEY (user_id)
    REFERENCES database__mvideo.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS bonus_cards_pkey
    ON database__mvideo.bonus_cards(user_id);


ALTER TABLE IF EXISTS database__mvideo.cameras
    ADD CONSTRAINT fkey FOREIGN KEY (id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS cameras_pkey
    ON database__mvideo.cameras(id);


ALTER TABLE IF EXISTS database__mvideo.carts
    ADD CONSTRAINT fkey_1 FOREIGN KEY (user_id)
    REFERENCES database__mvideo.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.carts
    ADD CONSTRAINT fkey_2 FOREIGN KEY (item_id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.favourite_items
    ADD CONSTRAINT fkey1 FOREIGN KEY (item_name)
    REFERENCES database__mvideo.items (name) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.favourite_items
    ADD CONSTRAINT fkey_2 FOREIGN KEY (user_id)
    REFERENCES database__mvideo.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.favourite_stores
    ADD CONSTRAINT fkey FOREIGN KEY (user_id)
    REFERENCES database__mvideo.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS favourite_stores_pkey
    ON database__mvideo.favourite_stores(user_id);


ALTER TABLE IF EXISTS database__mvideo.fridges
    ADD CONSTRAINT fkey FOREIGN KEY (id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fridges_pkey
    ON database__mvideo.fridges(id);


ALTER TABLE IF EXISTS database__mvideo.game_consoles
    ADD CONSTRAINT fkey FOREIGN KEY (id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS game_consoles_pkey
    ON database__mvideo.game_consoles(id);


ALTER TABLE IF EXISTS database__mvideo.grinders
    ADD CONSTRAINT fkey FOREIGN KEY (id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS grinders_pkey
    ON database__mvideo.grinders(id);


ALTER TABLE IF EXISTS database__mvideo.headphones
    ADD CONSTRAINT fkey FOREIGN KEY (id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS headphones_pkey
    ON database__mvideo.headphones(id);


ALTER TABLE IF EXISTS database__mvideo.hoovers
    ADD CONSTRAINT fkey FOREIGN KEY (id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS hoovers_pkey
    ON database__mvideo.hoovers(id);


ALTER TABLE IF EXISTS database__mvideo.items
    ADD CONSTRAINT fkey1 FOREIGN KEY (manufacturer_id)
    REFERENCES database__mvideo.manufacturers (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.items
    ADD CONSTRAINT fkey2 FOREIGN KEY (category_id)
    REFERENCES database__mvideo.item_categories (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.items_within_stores
    ADD CONSTRAINT fkey1 FOREIGN KEY (item_id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.items_within_stores
    ADD CONSTRAINT fkey2 FOREIGN KEY (store_id)
    REFERENCES database__mvideo.stores (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.laptops
    ADD CONSTRAINT fkey FOREIGN KEY (id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS laptops_pkey
    ON database__mvideo.laptops(id);


ALTER TABLE IF EXISTS database__mvideo.orders
    ADD CONSTRAINT fkey1 FOREIGN KEY (user_id)
    REFERENCES database__mvideo.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.orders
    ADD CONSTRAINT fkey2 FOREIGN KEY (item_id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.personal_discounts
    ADD CONSTRAINT fkey1 FOREIGN KEY (item_id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.personal_discounts
    ADD CONSTRAINT fkey2 FOREIGN KEY (user_id)
    REFERENCES database__mvideo.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.preferenced_delivery_methods
    ADD CONSTRAINT fkey FOREIGN KEY (user_id)
    REFERENCES database__mvideo.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS preferenced_delivery_methods_pkey
    ON database__mvideo.preferenced_delivery_methods(user_id);


ALTER TABLE IF EXISTS database__mvideo.preferenced_payment_methods
    ADD CONSTRAINT fkey FOREIGN KEY (user_id)
    REFERENCES database__mvideo.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS preferenced_payment_methods_pkey
    ON database__mvideo.preferenced_payment_methods(user_id);


ALTER TABLE IF EXISTS database__mvideo.smartphones
    ADD CONSTRAINT fkey FOREIGN KEY (id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS smartphones_pkey
    ON database__mvideo.smartphones(id);


ALTER TABLE IF EXISTS database__mvideo.system_units
    ADD CONSTRAINT fkey FOREIGN KEY (id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS system_units_pkey
    ON database__mvideo.system_units(id);


ALTER TABLE IF EXISTS database__mvideo.tablets
    ADD CONSTRAINT fkey FOREIGN KEY (id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS tablets_pkey
    ON database__mvideo.tablets(id);


ALTER TABLE IF EXISTS database__mvideo.tvs
    ADD CONSTRAINT fkey FOREIGN KEY (id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS tvs_pkey
    ON database__mvideo.tvs(id);


ALTER TABLE IF EXISTS database__mvideo.users_appeals
    ADD CONSTRAINT fkey FOREIGN KEY (user_id)
    REFERENCES database__mvideo.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.users_linked_social_networks
    ADD CONSTRAINT fkey FOREIGN KEY (user_id)
    REFERENCES database__mvideo.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS database__mvideo.users_mailing
    ADD CONSTRAINT fkey FOREIGN KEY (user_id)
    REFERENCES database__mvideo.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS users_mailing_pkey
    ON database__mvideo.users_mailing(user_id);


ALTER TABLE IF EXISTS database__mvideo.video_recorders
    ADD CONSTRAINT fkey FOREIGN KEY (id)
    REFERENCES database__mvideo.items (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS video_recorders_pkey
    ON database__mvideo.video_recorders(id);

END;