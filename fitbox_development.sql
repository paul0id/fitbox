--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: fit_boxes; Type: TABLE; Schema: public; Owner: raven; Tablespace: 
--

CREATE TABLE fit_boxes (
    id integer NOT NULL,
    name character varying,
    description text,
    manager_id integer,
    client_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.fit_boxes OWNER TO raven;

--
-- Name: fit_boxes_id_seq; Type: SEQUENCE; Schema: public; Owner: raven
--

CREATE SEQUENCE fit_boxes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fit_boxes_id_seq OWNER TO raven;

--
-- Name: fit_boxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: raven
--

ALTER SEQUENCE fit_boxes_id_seq OWNED BY fit_boxes.id;


--
-- Name: fit_boxes_items; Type: TABLE; Schema: public; Owner: raven; Tablespace: 
--

CREATE TABLE fit_boxes_items (
    item_id integer,
    fit_box_id integer
);


ALTER TABLE public.fit_boxes_items OWNER TO raven;

--
-- Name: items; Type: TABLE; Schema: public; Owner: raven; Tablespace: 
--

CREATE TABLE items (
    id integer NOT NULL,
    name character varying,
    description text,
    kind integer,
    upc character varying,
    color character varying,
    size character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    picture character varying
);


ALTER TABLE public.items OWNER TO raven;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: raven
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO raven;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: raven
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: raven; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO raven;

--
-- Name: users; Type: TABLE; Schema: public; Owner: raven; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying,
    manager_id integer,
    first_name character varying,
    last_name character varying,
    avatar character varying,
    sport character varying,
    "where" character varying,
    body character varying,
    address text,
    phone character varying,
    city character varying,
    country character varying,
    zip character varying,
    foot_size character varying,
    up_size character varying,
    down_size character varying
);


ALTER TABLE public.users OWNER TO raven;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: raven
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO raven;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: raven
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: raven
--

ALTER TABLE ONLY fit_boxes ALTER COLUMN id SET DEFAULT nextval('fit_boxes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: raven
--

ALTER TABLE ONLY items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: raven
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: fit_boxes; Type: TABLE DATA; Schema: public; Owner: raven
--

COPY fit_boxes (id, name, description, manager_id, client_id, created_at, updated_at) FROM stdin;
55	\N	\N	2	3	2016-02-11 20:34:43.536718	2016-02-11 20:34:43.536718
\.


--
-- Name: fit_boxes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raven
--

SELECT pg_catalog.setval('fit_boxes_id_seq', 55, true);


--
-- Data for Name: fit_boxes_items; Type: TABLE DATA; Schema: public; Owner: raven
--

COPY fit_boxes_items (item_id, fit_box_id) FROM stdin;
9	55
10	55
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: raven
--

COPY items (id, name, description, kind, upc, color, size, created_at, updated_at, picture) FROM stdin;
6	2015 Polaroid Mens Glasses Design	Четкие стекла	0	123456789087	yellow	ХЗ	2016-02-11 14:36:11.218712	2016-02-11 14:36:11.218712	2015_Polaroid_Mens_Glasses_Design.jpg
7	Polaroid-sunglasses-brand-price-list-in-india	Стильные окуляры	0	7843095983	темные	XLLLL	2016-02-11 14:37:28.323277	2016-02-11 14:37:28.323277	Polaroid-sunglasses-brand-price-list-in-india.jpg
8	P4247B-Polaroid-Sunglasses	Крутячие оооочки	0	435435234523	сэпия	Нормальные	2016-02-11 14:38:37.984026	2016-02-11 14:38:37.984026	P4247B-Polaroid-Sunglasses.jpg
9	Nike - Park Plus Crew Training Top	Моднявая штука	1	348523749753	Темный	XXL	2016-02-11 14:41:47.270634	2016-02-11 14:41:47.270634	k_194114_schwarz.jpg
11	Nike Pants 	Четкие	1	34582430	малинка	XL	2016-02-11 14:46:12.875784	2016-02-11 14:46:12.875784	nike-535689-656.jpg
10	nike green mens miami	офигенский пулл	2	28455824	вялая зелень	XL	2016-02-11 14:43:01.182065	2016-02-11 14:46:27.477935	nike-green-mens-miami-hurricanes-coaches-half-zip-pullover-product-1-26473757-0-490379234-normal.jpeg
12	Nike Pants W XXX	Уф-уф-уф!!!	2	345234523	неважно	От души	2016-02-11 14:49:11.70938	2016-02-11 14:49:11.70938	26tr5i-l-610x610-pants-yoga_pants-nike_sportswear-pants_sport_leggings-sport-leggings-running_tights-gym_clothes-gray_tight.jpg
13	Nike Pants - Crisp ass	Афигеть	2	34564588	Темные	в пору	2016-02-11 14:50:07.25497	2016-02-11 14:50:07.25497	fkwixa-l-610x610-yoga_pants-yoga_leggings-fitness-workout_gym_leggins-gym-gym_shoes-pants_sport_leggings-black_leggings.jpg
14	Найк Шуз	Бодрые 	3	642245234	черные с беленьким	42	2016-02-11 14:52:08.670068	2016-02-11 14:52:08.670068	_______________.jpg
15	Найк Шуз Другие	Темовые кроссы	3	6856867576	серый индиго	38	2016-02-11 14:53:02.208931	2016-02-11 14:53:02.208931	nike-sportswear-spring-2010-footwear-3.jpg
16	Найк Шуз Компани Ходовой Варик	Ни че так	3	7634562457	белый оранж	43	2016-02-11 14:54:25.876554	2016-02-11 14:54:25.876554	nash.jpg
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raven
--

SELECT pg_catalog.setval('items_id_seq', 16, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: raven
--

COPY schema_migrations (version) FROM stdin;
20160208114222
20160209112944
20160209122206
20160209123102
20160209124745
20160210095637
20160210100239
20160210154211
20160211140833
20160211144533
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: raven
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, type, manager_id, first_name, last_name, avatar, sport, "where", body, address, phone, city, country, zip, foot_size, up_size, down_size) FROM stdin;
3	curtrussel0@mail.ru	$2a$10$rsfyZP/Dw93Rz92Ih0qN1urYCVhxV5lD0c/e2SdOV.qXBWBPkyuXK	\N	\N	\N	0	\N	\N	\N	\N	2016-02-10 14:17:34.845455	2016-02-10 14:17:34.845455	Client	\N	Curt0	Russell0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	curtrussel1@mail.ru	$2a$10$oZ6P1ldslzQ4D3K.oVw0ruEjBfaC71OIloKs7GHj8VJxLX67RjJki	\N	\N	\N	0	\N	\N	\N	\N	2016-02-10 14:17:34.948662	2016-02-10 14:17:34.948662	Client	\N	Curt1	Russell1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	curtrussel2@mail.ru	$2a$10$TRLSMco6Z5ng3SZ19f0kyu7gMgzYKbFBlRR0YrlT5aSoWm/CfZm0S	\N	\N	\N	0	\N	\N	\N	\N	2016-02-10 14:17:35.040651	2016-02-10 14:17:35.040651	Client	\N	Curt2	Russell2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	curtrussel3@mail.ru	$2a$10$l/UtDVMRjTW61QgFXXDtDOBHvFHXaNLJUlA3FdZWzs03GWwMcwQwy	\N	\N	\N	0	\N	\N	\N	\N	2016-02-10 14:17:35.123582	2016-02-10 14:17:35.123582	Client	\N	Curt3	Russell3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	curtrussel4@mail.ru	$2a$10$v0EuwnU/8rBZzr0IuL5oq.eIen4w9UejClSngyUGc8jUEGye0gv/K	\N	\N	\N	0	\N	\N	\N	\N	2016-02-10 14:17:35.213318	2016-02-10 14:17:35.213318	Client	\N	Curt4	Russell4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	curtrussel5@mail.ru	$2a$10$gkR1kXyQaSW0hU4kqyJ7netBleJDHcFdxxt.Z8FGpfiKSNISwmBwe	\N	\N	\N	0	\N	\N	\N	\N	2016-02-10 14:17:35.299375	2016-02-10 14:17:35.299375	Client	\N	Curt5	Russell5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	curtrussel6@mail.ru	$2a$10$RStuGnGBorbK1.ygQ.sL0usSUdy0NvDbk8hXOunv.t5NlTzA9nQyC	\N	\N	\N	0	\N	\N	\N	\N	2016-02-10 14:17:35.393096	2016-02-10 14:17:35.393096	Client	\N	Curt6	Russell6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	curtrussel7@mail.ru	$2a$10$6ONOW55ASk25bZbnDji9nek7mMRSz4SH9sROk2fXuPp0uNvQEbs5K	\N	\N	\N	0	\N	\N	\N	\N	2016-02-10 14:17:35.475884	2016-02-10 14:17:35.475884	Client	\N	Curt7	Russell7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	curtrussel8@mail.ru	$2a$10$Rn4QhMU1GWF20hfEaDgilOJTX2Ut305.MEMbCnGe/EWTIfiEx7UX6	\N	\N	\N	0	\N	\N	\N	\N	2016-02-10 14:17:35.564862	2016-02-10 14:17:35.564862	Client	\N	Curt8	Russell8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	curtrussel9@mail.ru	$2a$10$zdb3GzY1O3Cbas2O01QnwehWGg083l/yHaQz2mdVekUUoCAij6LVm	\N	\N	\N	0	\N	\N	\N	\N	2016-02-10 14:17:35.727691	2016-02-10 14:17:35.727691	Client	\N	Curt9	Russell9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	admin@example.com	$2a$10$bzvYIDUAAAOAwFtmHFeYve04hMqFiGan5ybh00BFInYRuqONV99GW	\N	\N	\N	8	2016-02-11 13:05:27.901008	2016-02-11 12:58:04.157659	127.0.0.1	127.0.0.1	2016-02-10 09:32:31.216787	2016-02-11 13:05:27.902464	Admin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	manager@pes.com	$2a$10$DOsgdc5ftsPzPipbZwztZOVEj0UjRxHw77LiXFw2n.CcliPDg7r5y	\N	\N	\N	0	\N	\N	\N	\N	2016-02-11 13:07:57.491821	2016-02-11 13:07:57.491821	Manager	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	manager@sabaka.com	$2a$10$6p1TJY4mpYmNjJt0tfExNuDhDl771n6vzWNRFQ7bW8FU8P6ksRNni	\N	\N	\N	3	2016-02-11 13:08:15.785667	2016-02-10 14:18:02.6338	127.0.0.1	127.0.0.1	2016-02-10 14:10:41.876757	2016-02-11 13:40:37.28567	Manager	\N	manager	pes	AIimQ8C.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raven
--

SELECT pg_catalog.setval('users_id_seq', 13, true);


--
-- Name: fit_boxes_pkey; Type: CONSTRAINT; Schema: public; Owner: raven; Tablespace: 
--

ALTER TABLE ONLY fit_boxes
    ADD CONSTRAINT fit_boxes_pkey PRIMARY KEY (id);


--
-- Name: items_pkey; Type: CONSTRAINT; Schema: public; Owner: raven; Tablespace: 
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: raven; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_fit_boxes_items_on_fit_box_id; Type: INDEX; Schema: public; Owner: raven; Tablespace: 
--

CREATE INDEX index_fit_boxes_items_on_fit_box_id ON fit_boxes_items USING btree (fit_box_id);


--
-- Name: index_fit_boxes_items_on_item_id; Type: INDEX; Schema: public; Owner: raven; Tablespace: 
--

CREATE INDEX index_fit_boxes_items_on_item_id ON fit_boxes_items USING btree (item_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: raven; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: raven; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: raven; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

