--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (74, 'user_1716321731107', NULL, 147);
INSERT INTO public.users VALUES (73, 'user_1716321731108', NULL, 227);
INSERT INTO public.users VALUES (76, 'user_1716321796723', NULL, 196);
INSERT INTO public.users VALUES (77, 'user_1716321796722', NULL, 205);
INSERT INTO public.users VALUES (103, 'user_1716322627104', NULL, 222);
INSERT INTO public.users VALUES (102, 'user_1716322627105', NULL, 99);
INSERT INTO public.users VALUES (79, 'user_1716321834994', NULL, 837);
INSERT INTO public.users VALUES (78, 'user_1716321834995', NULL, 114);
INSERT INTO public.users VALUES (129, 'user_1716323482984', 1, 34);
INSERT INTO public.users VALUES (81, 'user_1716321879973', NULL, 67);
INSERT INTO public.users VALUES (80, 'user_1716321879974', NULL, 504);
INSERT INTO public.users VALUES (137, 'user_1716323635907', 1, 235);
INSERT INTO public.users VALUES (83, 'user_1716321903857', NULL, 3);
INSERT INTO public.users VALUES (82, 'user_1716321903858', NULL, 498);
INSERT INTO public.users VALUES (105, 'user_1716322844048', NULL, 480);
INSERT INTO public.users VALUES (84, 'user_1716321964138', NULL, 109);
INSERT INTO public.users VALUES (104, 'user_1716322844049', NULL, 85);
INSERT INTO public.users VALUES (85, 'user_1716321964137', NULL, 287);
INSERT INTO public.users VALUES (86, 'user_1716321985866', NULL, 95);
INSERT INTO public.users VALUES (87, 'user_1716321985865', NULL, 401);
INSERT INTO public.users VALUES (106, 'user_1716322865003', NULL, 350);
INSERT INTO public.users VALUES (89, 'user_1716322094153', NULL, 180);
INSERT INTO public.users VALUES (88, 'user_1716322094154', NULL, 114);
INSERT INTO public.users VALUES (107, 'user_1716322865002', NULL, 679);
INSERT INTO public.users VALUES (91, 'user_1716322137144', NULL, 53);
INSERT INTO public.users VALUES (90, 'user_1716322137145', NULL, 147);
INSERT INTO public.users VALUES (93, 'user_1716322169403', NULL, 43);
INSERT INTO public.users VALUES (92, 'user_1716322169404', NULL, 101);
INSERT INTO public.users VALUES (94, 'user_1716322197880', NULL, 261);
INSERT INTO public.users VALUES (95, 'user_1716322197879', NULL, 78);
INSERT INTO public.users VALUES (96, 'user_1716322239437', NULL, 69);
INSERT INTO public.users VALUES (97, 'user_1716322239436', NULL, 83);
INSERT INTO public.users VALUES (108, 'user_1716322921977', NULL, 81);
INSERT INTO public.users VALUES (109, 'user_1716322921976', NULL, 181);
INSERT INTO public.users VALUES (99, 'user_1716322286428', NULL, 691);
INSERT INTO public.users VALUES (98, 'user_1716322286429', NULL, 339);
INSERT INTO public.users VALUES (128, 'user_1716323482985', 1, 748);
INSERT INTO public.users VALUES (101, 'user_1716322532050', NULL, 8);
INSERT INTO public.users VALUES (100, 'user_1716322532051', NULL, 559);
INSERT INTO public.users VALUES (110, 'user_1716322959310', NULL, 276);
INSERT INTO public.users VALUES (111, 'user_1716322959309', NULL, 134);
INSERT INTO public.users VALUES (121, 'user_1716323336663', 1, 754);
INSERT INTO public.users VALUES (136, 'user_1716323635908', 1, 808);
INSERT INTO public.users VALUES (113, 'user_1716323130369', 1, 380);
INSERT INTO public.users VALUES (120, 'user_1716323336664', 1, 19);
INSERT INTO public.users VALUES (112, 'user_1716323130370', 1, 141);
INSERT INTO public.users VALUES (131, 'user_1716323553279', 1, 788);
INSERT INTO public.users VALUES (115, 'user_1716323176437', 1, 644);
INSERT INTO public.users VALUES (123, 'user_1716323376539', 1, 714);
INSERT INTO public.users VALUES (114, 'user_1716323176438', 1, 101);
INSERT INTO public.users VALUES (130, 'user_1716323553280', 1, 619);
INSERT INTO public.users VALUES (122, 'user_1716323376540', 1, 4);
INSERT INTO public.users VALUES (117, 'user_1716323213060', 1, 127);
INSERT INTO public.users VALUES (116, 'user_1716323213061', 1, 960);
INSERT INTO public.users VALUES (125, 'user_1716323416452', 1, 514);
INSERT INTO public.users VALUES (133, 'user_1716323576668', 1, 597);
INSERT INTO public.users VALUES (119, 'user_1716323260969', 1, 799);
INSERT INTO public.users VALUES (124, 'user_1716323416453', 1, 114);
INSERT INTO public.users VALUES (75, 'Hi', 1, 12);
INSERT INTO public.users VALUES (118, 'user_1716323260970', 1, 227);
INSERT INTO public.users VALUES (132, 'user_1716323576669', 1, 647);
INSERT INTO public.users VALUES (127, 'user_1716323460868', 1, 221);
INSERT INTO public.users VALUES (135, 'user_1716323626942', 1, 284);
INSERT INTO public.users VALUES (126, 'user_1716323460869', 1, 767);
INSERT INTO public.users VALUES (134, 'user_1716323626943', 1, 50);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 137, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

