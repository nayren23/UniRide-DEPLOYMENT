--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1

-- Started on 2024-01-16 09:15:14 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 32773)
-- Name: uniride; Type: SCHEMA; Schema: -; Owner: rayan
--
DROP SCHEMA IF EXISTS uniride CASCADE;

CREATE SCHEMA uniride;


ALTER SCHEMA uniride OWNER TO rayan;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 32784)
-- Name: ur_address; Type: TABLE; Schema: uniride; Owner: rayan
--

CREATE TABLE uniride.ur_address (
    a_id integer NOT NULL,
    a_street_number character varying(10) NOT NULL,
    a_street_name character varying(255) NOT NULL,
    a_city character varying(255) NOT NULL,
    a_postal_code character varying(5) NOT NULL,
    a_latitude numeric(15,10) NOT NULL,
    a_longitude numeric(15,10) NOT NULL,
    a_timestamp_modification timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE uniride.ur_address OWNER TO rayan;

--
-- TOC entry 218 (class 1259 OID 32783)
-- Name: ur_address_a_id_seq; Type: SEQUENCE; Schema: uniride; Owner: rayan
--

CREATE SEQUENCE uniride.ur_address_a_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE uniride.ur_address_a_id_seq OWNER TO rayan;

--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 218
-- Name: ur_address_a_id_seq; Type: SEQUENCE OWNED BY; Schema: uniride; Owner: rayan
--

ALTER SEQUENCE uniride.ur_address_a_id_seq OWNED BY uniride.ur_address.a_id;


--
-- TOC entry 232 (class 1259 OID 32925)
-- Name: ur_assign; Type: TABLE; Schema: uniride; Owner: rayan
--

CREATE TABLE uniride.ur_assign (
    r_id integer NOT NULL,
    u_id integer NOT NULL
);


ALTER TABLE uniride.ur_assign OWNER TO rayan;

--
-- TOC entry 223 (class 1259 OID 32826)
-- Name: ur_document_verification; Type: TABLE; Schema: uniride; Owner: rayan
--

CREATE TABLE uniride.ur_document_verification (
    v_id integer NOT NULL,
    v_license_verified integer DEFAULT 0 NOT NULL,
    v_id_card_verified integer DEFAULT 0 NOT NULL,
    v_school_certificate_verified integer DEFAULT 0 NOT NULL,
    v_insurance_verified integer DEFAULT 0 NOT NULL,
    v_timestamp_modification timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    u_id integer NOT NULL,
    v_license_description character varying(255) DEFAULT ''::character varying,
    v_card_description character varying(255) DEFAULT ''::character varying,
    v_school_certificate_description character varying(255) DEFAULT ''::character varying,
    v_insurance_description character varying(255) DEFAULT ''::character varying
);


ALTER TABLE uniride.ur_document_verification OWNER TO rayan;

--
-- TOC entry 222 (class 1259 OID 32825)
-- Name: ur_document_verification_v_id_seq; Type: SEQUENCE; Schema: uniride; Owner: rayan
--

CREATE SEQUENCE uniride.ur_document_verification_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE uniride.ur_document_verification_v_id_seq OWNER TO rayan;

--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 222
-- Name: ur_document_verification_v_id_seq; Type: SEQUENCE OWNED BY; Schema: uniride; Owner: rayan
--

ALTER SEQUENCE uniride.ur_document_verification_v_id_seq OWNED BY uniride.ur_document_verification.v_id;


--
-- TOC entry 225 (class 1259 OID 32843)
-- Name: ur_documents; Type: TABLE; Schema: uniride; Owner: rayan
--

CREATE TABLE uniride.ur_documents (
    d_id integer NOT NULL,
    d_license text,
    d_id_card text,
    d_school_certificate text,
    d_insurance text,
    d_timestamp_addition timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    d_timestamp_modification timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    u_id integer
);


ALTER TABLE uniride.ur_documents OWNER TO rayan;

--
-- TOC entry 224 (class 1259 OID 32842)
-- Name: ur_documents_d_id_seq; Type: SEQUENCE; Schema: uniride; Owner: rayan
--

CREATE SEQUENCE uniride.ur_documents_d_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE uniride.ur_documents_d_id_seq OWNER TO rayan;

--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 224
-- Name: ur_documents_d_id_seq; Type: SEQUENCE OWNED BY; Schema: uniride; Owner: rayan
--

ALTER SEQUENCE uniride.ur_documents_d_id_seq OWNED BY uniride.ur_documents.d_id;


--
-- TOC entry 233 (class 1259 OID 32940)
-- Name: ur_join; Type: TABLE; Schema: uniride; Owner: rayan
--

CREATE TABLE uniride.ur_join (
    u_id integer NOT NULL,
    t_id integer NOT NULL,
    j_accepted integer DEFAULT 0 NOT NULL,
    j_passenger_count integer,
    j_date_requested timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    j_joined boolean DEFAULT false NOT NULL,
    j_verification_code integer,
    j_id integer NOT NULL
);


ALTER TABLE uniride.ur_join OWNER TO rayan;

--
-- TOC entry 237 (class 1259 OID 2031731)
-- Name: ur_join_j_id_seq; Type: SEQUENCE; Schema: uniride; Owner: rayan
--

CREATE SEQUENCE uniride.ur_join_j_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE uniride.ur_join_j_id_seq OWNER TO rayan;

--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 237
-- Name: ur_join_j_id_seq; Type: SEQUENCE OWNED BY; Schema: uniride; Owner: rayan
--

ALTER SEQUENCE uniride.ur_join_j_id_seq OWNED BY uniride.ur_join.j_id;


--
-- TOC entry 235 (class 1259 OID 1105940)
-- Name: ur_rating; Type: TABLE; Schema: uniride; Owner: rayan
--

CREATE TABLE uniride.ur_rating (
    n_id integer NOT NULL,
    n_value integer,
    u_id integer NOT NULL,
    t_id integer NOT NULL,
    rc_id integer NOT NULL
);


ALTER TABLE uniride.ur_rating OWNER TO rayan;

--
-- TOC entry 234 (class 1259 OID 1105935)
-- Name: ur_rating_criteria; Type: TABLE; Schema: uniride; Owner: rayan
--

CREATE TABLE uniride.ur_rating_criteria (
    rc_id integer NOT NULL,
    rc_name character varying(50),
    rc_description character varying(50),
    r_id integer
);


ALTER TABLE uniride.ur_rating_criteria OWNER TO rayan;

--
-- TOC entry 236 (class 1259 OID 1449989)
-- Name: ur_rating_criteria_rc_id_seq; Type: SEQUENCE; Schema: uniride; Owner: rayan
--

ALTER TABLE uniride.ur_rating_criteria ALTER COLUMN rc_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME uniride.ur_rating_criteria_rc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 2039927)
-- Name: ur_rating_n_id_seq; Type: SEQUENCE; Schema: uniride; Owner: rayan
--

ALTER TABLE uniride.ur_rating ALTER COLUMN n_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME uniride.ur_rating_n_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 32775)
-- Name: ur_role; Type: TABLE; Schema: uniride; Owner: rayan
--

CREATE TABLE uniride.ur_role (
    r_id integer NOT NULL,
    r_name character varying(30) NOT NULL,
    r_description character varying(100),
    r_timestamp_addition timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    r_timestamp_modification timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE uniride.ur_role OWNER TO rayan;

--
-- TOC entry 216 (class 1259 OID 32774)
-- Name: ur_role_r_id_seq; Type: SEQUENCE; Schema: uniride; Owner: rayan
--

CREATE SEQUENCE uniride.ur_role_r_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE uniride.ur_role_r_id_seq OWNER TO rayan;

--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 216
-- Name: ur_role_r_id_seq; Type: SEQUENCE OWNED BY; Schema: uniride; Owner: rayan
--

ALTER SEQUENCE uniride.ur_role_r_id_seq OWNED BY uniride.ur_role.r_id;


--
-- TOC entry 229 (class 1259 OID 32875)
-- Name: ur_trip; Type: TABLE; Schema: uniride; Owner: rayan
--

CREATE TABLE uniride.ur_trip (
    t_id integer NOT NULL,
    t_total_passenger_count integer NOT NULL,
    t_timestamp_creation timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    t_timestamp_proposed timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    t_status integer,
    t_price numeric(10,2) DEFAULT 0.00,
    t_user_id integer NOT NULL,
    t_address_departure_id integer NOT NULL,
    t_address_arrival_id integer NOT NULL,
    t_initial_price numeric(10,2) DEFAULT 1.00
);


ALTER TABLE uniride.ur_trip OWNER TO rayan;

--
-- TOC entry 228 (class 1259 OID 32874)
-- Name: ur_trip_t_id_seq; Type: SEQUENCE; Schema: uniride; Owner: rayan
--

CREATE SEQUENCE uniride.ur_trip_t_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE uniride.ur_trip_t_id_seq OWNER TO rayan;

--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 228
-- Name: ur_trip_t_id_seq; Type: SEQUENCE OWNED BY; Schema: uniride; Owner: rayan
--

ALTER SEQUENCE uniride.ur_trip_t_id_seq OWNED BY uniride.ur_trip.t_id;


--
-- TOC entry 231 (class 1259 OID 32900)
-- Name: ur_trip_validation; Type: TABLE; Schema: uniride; Owner: rayan
--

CREATE TABLE uniride.ur_trip_validation (
    v_id integer NOT NULL,
    v_code character(4) NOT NULL,
    u_id integer NOT NULL,
    t_id integer NOT NULL,
    u_id_1 integer NOT NULL
);


ALTER TABLE uniride.ur_trip_validation OWNER TO rayan;

--
-- TOC entry 230 (class 1259 OID 32899)
-- Name: ur_trip_validation_v_id_seq; Type: SEQUENCE; Schema: uniride; Owner: rayan
--

CREATE SEQUENCE uniride.ur_trip_validation_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE uniride.ur_trip_validation_v_id_seq OWNER TO rayan;

--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 230
-- Name: ur_trip_validation_v_id_seq; Type: SEQUENCE OWNED BY; Schema: uniride; Owner: rayan
--

ALTER SEQUENCE uniride.ur_trip_validation_v_id_seq OWNED BY uniride.ur_trip_validation.v_id;


--
-- TOC entry 221 (class 1259 OID 32794)
-- Name: ur_user; Type: TABLE; Schema: uniride; Owner: rayan
--

CREATE TABLE uniride.ur_user (
    u_id integer NOT NULL,
    r_id integer DEFAULT 3 NOT NULL,
    u_login character varying(50) NOT NULL,
    u_lastname character varying(50) NOT NULL,
    u_student_email character varying(50) NOT NULL,
    u_password text NOT NULL,
    u_timestamp_creation timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    u_timestamp_modification timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    u_profile_picture text DEFAULT 'default_profile_picture.png',
    u_gender character varying(2) NOT NULL,
    u_firstname character varying(50) NOT NULL,
    u_phone_number character varying(10) NOT NULL,
    u_email_verified boolean DEFAULT false NOT NULL,
    u_status integer DEFAULT 3 NOT NULL,
    u_description character varying(100)
);


ALTER TABLE uniride.ur_user OWNER TO rayan;

--
-- TOC entry 220 (class 1259 OID 32793)
-- Name: ur_user_u_id_seq; Type: SEQUENCE; Schema: uniride; Owner: rayan
--

CREATE SEQUENCE uniride.ur_user_u_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE uniride.ur_user_u_id_seq OWNER TO rayan;

--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 220
-- Name: ur_user_u_id_seq; Type: SEQUENCE OWNED BY; Schema: uniride; Owner: rayan
--

ALTER SEQUENCE uniride.ur_user_u_id_seq OWNED BY uniride.ur_user.u_id;


--
-- TOC entry 227 (class 1259 OID 32859)
-- Name: ur_vehicle; Type: TABLE; Schema: uniride; Owner: rayan
--

CREATE TABLE uniride.ur_vehicle (
    v_id integer NOT NULL,
    v_model character varying(64) NOT NULL,
    v_license_plate character varying(16),
    v_country_license_plate character varying(2) NOT NULL,
    v_color character varying(15) NOT NULL,
    v_brand character varying(50) NOT NULL,
    v_total_places integer NOT NULL,
    v_timestamp_addition timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    v_timestamp_modification timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    u_id integer NOT NULL
);


ALTER TABLE uniride.ur_vehicle OWNER TO rayan;

--
-- TOC entry 226 (class 1259 OID 32858)
-- Name: ur_vehicule_v_id_seq; Type: SEQUENCE; Schema: uniride; Owner: rayan
--

CREATE SEQUENCE uniride.ur_vehicule_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE uniride.ur_vehicule_v_id_seq OWNER TO rayan;

--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 226
-- Name: ur_vehicule_v_id_seq; Type: SEQUENCE OWNED BY; Schema: uniride; Owner: rayan
--

ALTER SEQUENCE uniride.ur_vehicule_v_id_seq OWNED BY uniride.ur_vehicle.v_id;


--
-- TOC entry 3261 (class 2604 OID 32787)
-- Name: ur_address a_id; Type: DEFAULT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_address ALTER COLUMN a_id SET DEFAULT nextval('uniride.ur_address_a_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 32829)
-- Name: ur_document_verification v_id; Type: DEFAULT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_document_verification ALTER COLUMN v_id SET DEFAULT nextval('uniride.ur_document_verification_v_id_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 32846)
-- Name: ur_documents d_id; Type: DEFAULT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_documents ALTER COLUMN d_id SET DEFAULT nextval('uniride.ur_documents_d_id_seq'::regclass);


--
-- TOC entry 3294 (class 2604 OID 2031732)
-- Name: ur_join j_id; Type: DEFAULT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_join ALTER COLUMN j_id SET DEFAULT nextval('uniride.ur_join_j_id_seq'::regclass);


--
-- TOC entry 3258 (class 2604 OID 32778)
-- Name: ur_role r_id; Type: DEFAULT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_role ALTER COLUMN r_id SET DEFAULT nextval('uniride.ur_role_r_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 32878)
-- Name: ur_trip t_id; Type: DEFAULT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_trip ALTER COLUMN t_id SET DEFAULT nextval('uniride.ur_trip_t_id_seq'::regclass);


--
-- TOC entry 3290 (class 2604 OID 32903)
-- Name: ur_trip_validation v_id; Type: DEFAULT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_trip_validation ALTER COLUMN v_id SET DEFAULT nextval('uniride.ur_trip_validation_v_id_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 32797)
-- Name: ur_user u_id; Type: DEFAULT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_user ALTER COLUMN u_id SET DEFAULT nextval('uniride.ur_user_u_id_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 32862)
-- Name: ur_vehicle v_id; Type: DEFAULT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_vehicle ALTER COLUMN v_id SET DEFAULT nextval('uniride.ur_vehicule_v_id_seq'::regclass);


--
-- TOC entry 3298 (class 2606 OID 32792)
-- Name: ur_address ur_address_pkey; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_address
    ADD CONSTRAINT ur_address_pkey PRIMARY KEY (a_id);


--
-- TOC entry 3322 (class 2606 OID 32929)
-- Name: ur_assign ur_assign_pkey; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_assign
    ADD CONSTRAINT ur_assign_pkey PRIMARY KEY (r_id, u_id);


--
-- TOC entry 3306 (class 2606 OID 32836)
-- Name: ur_document_verification ur_document_verification_pkey; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_document_verification
    ADD CONSTRAINT ur_document_verification_pkey PRIMARY KEY (v_id);


--
-- TOC entry 3308 (class 2606 OID 32852)
-- Name: ur_documents ur_documents_pkey; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_documents
    ADD CONSTRAINT ur_documents_pkey PRIMARY KEY (d_id);


--
-- TOC entry 3326 (class 2606 OID 2031737)
-- Name: ur_join ur_join_pkey; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_join
    ADD CONSTRAINT ur_join_pkey PRIMARY KEY (j_id);


--
-- TOC entry 3330 (class 2606 OID 1105944)
-- Name: ur_rating ur_note_pkey; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_rating
    ADD CONSTRAINT ur_note_pkey PRIMARY KEY (n_id);


--
-- TOC entry 3328 (class 2606 OID 1105939)
-- Name: ur_rating_criteria ur_rating_criteria_pkey; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_rating_criteria
    ADD CONSTRAINT ur_rating_criteria_pkey PRIMARY KEY (rc_id);


--
-- TOC entry 3296 (class 2606 OID 32782)
-- Name: ur_role ur_role_pkey; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_role
    ADD CONSTRAINT ur_role_pkey PRIMARY KEY (r_id);


--
-- TOC entry 3314 (class 2606 OID 32883)
-- Name: ur_trip ur_trip_pkey; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_trip
    ADD CONSTRAINT ur_trip_pkey PRIMARY KEY (t_id);


--
-- TOC entry 3316 (class 2606 OID 32905)
-- Name: ur_trip_validation ur_trip_validation_pkey; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_trip_validation
    ADD CONSTRAINT ur_trip_validation_pkey PRIMARY KEY (v_id);


--
-- TOC entry 3318 (class 2606 OID 32909)
-- Name: ur_trip_validation ur_trip_validation_u_id_1_key; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_trip_validation
    ADD CONSTRAINT ur_trip_validation_u_id_1_key UNIQUE (u_id_1);


--
-- TOC entry 3320 (class 2606 OID 32907)
-- Name: ur_trip_validation ur_trip_validation_u_id_key; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_trip_validation
    ADD CONSTRAINT ur_trip_validation_u_id_key UNIQUE (u_id);


--
-- TOC entry 3300 (class 2606 OID 32805)
-- Name: ur_user ur_user_pkey; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_user
    ADD CONSTRAINT ur_user_pkey PRIMARY KEY (u_id);


--
-- TOC entry 3302 (class 2606 OID 32807)
-- Name: ur_user ur_user_u_login_key; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_user
    ADD CONSTRAINT ur_user_u_login_key UNIQUE (u_login);


--
-- TOC entry 3304 (class 2606 OID 32809)
-- Name: ur_user ur_user_u_student_email_key; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_user
    ADD CONSTRAINT ur_user_u_student_email_key UNIQUE (u_student_email);


--
-- TOC entry 3310 (class 2606 OID 32866)
-- Name: ur_vehicle ur_vehicule_pkey; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_vehicle
    ADD CONSTRAINT ur_vehicule_pkey PRIMARY KEY (v_id);


--
-- TOC entry 3312 (class 2606 OID 32868)
-- Name: ur_vehicle ur_vehicule_u_id_key; Type: CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_vehicle
    ADD CONSTRAINT ur_vehicule_u_id_key UNIQUE (u_id);


--
-- TOC entry 3323 (class 1259 OID 2031739)
-- Name: idx_t_id; Type: INDEX; Schema: uniride; Owner: rayan
--

CREATE INDEX idx_t_id ON uniride.ur_join USING btree (t_id);


--
-- TOC entry 3324 (class 1259 OID 2031738)
-- Name: idx_u_id; Type: INDEX; Schema: uniride; Owner: rayan
--

CREATE INDEX idx_u_id ON uniride.ur_join USING btree (u_id);


--
-- TOC entry 3347 (class 2606 OID 2556022)
-- Name: ur_rating_criteria fk_r_id; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_rating_criteria
    ADD CONSTRAINT fk_r_id FOREIGN KEY (r_id) REFERENCES uniride.ur_role(r_id) ON DELETE CASCADE;


--
-- TOC entry 3348 (class 2606 OID 2556027)
-- Name: ur_rating rc_id; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_rating
    ADD CONSTRAINT rc_id FOREIGN KEY (rc_id) REFERENCES uniride.ur_rating_criteria(rc_id) ON DELETE CASCADE;


--
-- TOC entry 3343 (class 2606 OID 32930)
-- Name: ur_assign ur_assign_r_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_assign
    ADD CONSTRAINT ur_assign_r_id_fkey FOREIGN KEY (r_id) REFERENCES uniride.ur_role(r_id) ON DELETE CASCADE;


--
-- TOC entry 3344 (class 2606 OID 32935)
-- Name: ur_assign ur_assign_u_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_assign
    ADD CONSTRAINT ur_assign_u_id_fkey FOREIGN KEY (u_id) REFERENCES uniride.ur_user(u_id) ON DELETE CASCADE;


--
-- TOC entry 3334 (class 2606 OID 32837)
-- Name: ur_document_verification ur_document_verification_u_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_document_verification
    ADD CONSTRAINT ur_document_verification_u_id_fkey FOREIGN KEY (u_id) REFERENCES uniride.ur_user(u_id) ON DELETE CASCADE;


--
-- TOC entry 3335 (class 2606 OID 32853)
-- Name: ur_documents ur_documents_u_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_documents
    ADD CONSTRAINT ur_documents_u_id_fkey FOREIGN KEY (u_id) REFERENCES uniride.ur_user(u_id) ON DELETE CASCADE;


--
-- TOC entry 3345 (class 2606 OID 32952)
-- Name: ur_join ur_join_t_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_join
    ADD CONSTRAINT ur_join_t_id_fkey FOREIGN KEY (t_id) REFERENCES uniride.ur_trip(t_id) ON DELETE CASCADE;


--
-- TOC entry 3346 (class 2606 OID 32947)
-- Name: ur_join ur_join_u_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_join
    ADD CONSTRAINT ur_join_u_id_fkey FOREIGN KEY (u_id) REFERENCES uniride.ur_user(u_id) ON DELETE CASCADE;


--
-- TOC entry 3349 (class 2606 OID 2556032)
-- Name: ur_rating ur_note_rc_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_rating
    ADD CONSTRAINT ur_note_rc_id_fkey FOREIGN KEY (rc_id) REFERENCES uniride.ur_rating_criteria(rc_id) ON DELETE CASCADE;


--
-- TOC entry 3350 (class 2606 OID 2556037)
-- Name: ur_rating ur_note_t_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_rating
    ADD CONSTRAINT ur_note_t_id_fkey FOREIGN KEY (t_id) REFERENCES uniride.ur_trip(t_id) ON DELETE CASCADE;


--
-- TOC entry 3351 (class 2606 OID 2556042)
-- Name: ur_rating ur_note_u_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_rating
    ADD CONSTRAINT ur_note_u_id_fkey FOREIGN KEY (u_id) REFERENCES uniride.ur_user(u_id) ON DELETE CASCADE;


--
-- TOC entry 3337 (class 2606 OID 32894)
-- Name: ur_trip ur_trip_t_address_arrival_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_trip
    ADD CONSTRAINT ur_trip_t_address_arrival_id_fkey FOREIGN KEY (t_address_arrival_id) REFERENCES uniride.ur_address(a_id) ON DELETE CASCADE;


--
-- TOC entry 3338 (class 2606 OID 32889)
-- Name: ur_trip ur_trip_t_address_departure_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_trip
    ADD CONSTRAINT ur_trip_t_address_departure_id_fkey FOREIGN KEY (t_address_departure_id) REFERENCES uniride.ur_address(a_id) ON DELETE CASCADE;


--
-- TOC entry 3339 (class 2606 OID 32884)
-- Name: ur_trip ur_trip_t_user_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_trip
    ADD CONSTRAINT ur_trip_t_user_id_fkey FOREIGN KEY (t_user_id) REFERENCES uniride.ur_user(u_id) ON DELETE CASCADE;


--
-- TOC entry 3340 (class 2606 OID 32915)
-- Name: ur_trip_validation ur_trip_validation_t_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_trip_validation
    ADD CONSTRAINT ur_trip_validation_t_id_fkey FOREIGN KEY (t_id) REFERENCES uniride.ur_trip(t_id) ON DELETE CASCADE;


--
-- TOC entry 3341 (class 2606 OID 32920)
-- Name: ur_trip_validation ur_trip_validation_u_id_1_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_trip_validation
    ADD CONSTRAINT ur_trip_validation_u_id_1_fkey FOREIGN KEY (u_id_1) REFERENCES uniride.ur_user(u_id) ON DELETE CASCADE;


--
-- TOC entry 3342 (class 2606 OID 32910)
-- Name: ur_trip_validation ur_trip_validation_u_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_trip_validation
    ADD CONSTRAINT ur_trip_validation_u_id_fkey FOREIGN KEY (u_id) REFERENCES uniride.ur_user(u_id) ON DELETE CASCADE;


--
-- TOC entry 3331 (class 2606 OID 32820)
-- Name: ur_user ur_user_r_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_user
    ADD CONSTRAINT ur_user_r_id_fkey FOREIGN KEY (r_id) REFERENCES uniride.ur_role(r_id) ON DELETE CASCADE;



--
-- TOC entry 3336 (class 2606 OID 32869)
-- Name: ur_vehicle ur_vehicule_u_id_fkey; Type: FK CONSTRAINT; Schema: uniride; Owner: rayan
--

ALTER TABLE ONLY uniride.ur_vehicle
    ADD CONSTRAINT ur_vehicule_u_id_fkey FOREIGN KEY (u_id) REFERENCES uniride.ur_user(u_id) ON DELETE CASCADE;


-- Completed on 2024-01-16 09:15:17 UTC

--
-- PostgreSQL database dump complete
--

