--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1

-- Started on 2024-01-16 09:17:09 UTC

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

--
-- TOC entry 3459 (class 0 OID 32775)
-- Dependencies: 217
-- Data for Name: ur_role; Type: TABLE DATA; Schema: uniride; Owner: rayan
--
INSERT INTO uniride.ur_role(
	r_id,r_name, r_description, r_timestamp_addition, r_timestamp_modification)
VALUES (0, 'administrateur', 'Administrateur système avec des droits étendus pour gérer lapplication de covoiturage.', '2024-01-05 18:22:15.730821', '2024-01-05 18:22:15.730821'),
(1, 'driver', 'Conducteur autorisé à proposer des trajets et à conduire des passagers.', '2024-01-05 18:22:15.730821', '2024-01-05 18:22:15.730821'),
(2, 'passenger', 'Passager ayant la possibilité de rechercher et de réserver des trajets.', '2024-01-05 18:22:15.730821', '2024-01-05 18:22:15.730821'),
(3, 'pending', 'Utilisateur qui as pas validé ses documents.', '2024-01-05 18:22:15.730821', '2024-01-05 18:22:15.730821');


--
-- TOC entry 3463 (class 0 OID 32794)
-- Dependencies: 221
-- Data for Name: ur_user; Type: TABLE DATA; Schema: uniride; Owner: rayan
--


--Conducteurs
INSERT INTO uniride.ur_user(
	r_id, u_login, u_lastname, u_student_email, u_password, u_timestamp_creation, u_timestamp_modification, u_profile_picture, u_gender, u_firstname, u_phone_number, u_email_verified, u_status, u_description)
VALUES (0, 'admin', 'Admin', 'admin@iut.univ-paris8.fr', '$2b$12$CrXbxXB4ZQhZSxmI5/1Kxuv6mhtE6JP/LJtN1ZZarrRBb.L3052AC', '2024-01-08 15:03:31.007845', '2024-01-08 15:03:31.007845', 'default_profile_picture.png', 'H', 'Tremblay', '0625365425', true, 3, ''),
(1, 'jdupont', 'Dupont', 'jdupont@iut.univ-paris.fr', '$2b$12$.e1z9Oj7OFux0.DT.VnBm.J39L//PpFvjk.rZ3yCTBnZBPPQj4EHO', '2024-01-05 18:22:15.730821', '2024-01-05 18:22:15.730821', 'default_profile_picture.png', 'M', 'Jean', '0601122334', true, 3, NULL),
;

--
-- TOC entry 3476 (class 0 OID 1105935)
-- Dependencies: 234
-- Data for Name: ur_rating_criteria; Type: TABLE DATA; Schema: uniride; Owner: rayan
--
INSERT INTO uniride.ur_rating_criteria(
	rc_name, rc_description, r_id)
	VALUES 
('Offre de Conversation', 'Prêt à discuter.', 1) ,
('Prêt à Partager', 'Partage d éxtras.', 1) ,
('Cool', 'Cool', 1) ,
('Ambiance du Véhicule', 'Ambiance chaleureuse et confortable.', 2) ,
('Musique Sympaddd', 'Playlist accueillante.', 2) ,
('Attitude Positive', 'Attitude positive.', 2) ,
('Remerciements et Évaluationsdsdf', 'Exprime la gratitude.ddf', 2) ,
('Eco conduite', 'SUPER MEGA COOL', NULL) ,
('Appréciation de la Musiqued', 'Aime la musique partagée.', NULL) ;

--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 218
-- Name: ur_address_a_id_seq; Type: SEQUENCE SET; Schema: uniride; Owner: rayan
--

SELECT pg_catalog.setval('uniride.ur_address_a_id_seq', 11, true);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 222
-- Name: ur_document_verification_v_id_seq; Type: SEQUENCE SET; Schema: uniride; Owner: rayan
--

SELECT pg_catalog.setval('uniride.ur_document_verification_v_id_seq', 60, true);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 224
-- Name: ur_documents_d_id_seq; Type: SEQUENCE SET; Schema: uniride; Owner: rayan
--

SELECT pg_catalog.setval('uniride.ur_documents_d_id_seq', 60, true);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 237
-- Name: ur_join_j_id_seq; Type: SEQUENCE SET; Schema: uniride; Owner: rayan
--

SELECT pg_catalog.setval('uniride.ur_join_j_id_seq', 10, true);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 236
-- Name: ur_rating_criteria_rc_id_seq; Type: SEQUENCE SET; Schema: uniride; Owner: rayan
--

SELECT pg_catalog.setval('uniride.ur_rating_criteria_rc_id_seq', 185, true);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 238
-- Name: ur_rating_n_id_seq; Type: SEQUENCE SET; Schema: uniride; Owner: rayan
--

SELECT pg_catalog.setval('uniride.ur_rating_n_id_seq', 26, true);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 216
-- Name: ur_role_r_id_seq; Type: SEQUENCE SET; Schema: uniride; Owner: rayan
--

SELECT pg_catalog.setval('uniride.ur_role_r_id_seq', 1, false);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 228
-- Name: ur_trip_t_id_seq; Type: SEQUENCE SET; Schema: uniride; Owner: rayan
--

SELECT pg_catalog.setval('uniride.ur_trip_t_id_seq', 61, true);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 230
-- Name: ur_trip_validation_v_id_seq; Type: SEQUENCE SET; Schema: uniride; Owner: rayan
--

SELECT pg_catalog.setval('uniride.ur_trip_validation_v_id_seq', 1, false);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 220
-- Name: ur_user_u_id_seq; Type: SEQUENCE SET; Schema: uniride; Owner: rayan
--

SELECT pg_catalog.setval('uniride.ur_user_u_id_seq', 107, true);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 226
-- Name: ur_vehicule_v_id_seq; Type: SEQUENCE SET; Schema: uniride; Owner: rayan
--

SELECT pg_catalog.setval('uniride.ur_vehicule_v_id_seq', 66, true);


-- Completed on 2024-01-16 09:17:13 UTC

--
-- PostgreSQL database dump complete
--

