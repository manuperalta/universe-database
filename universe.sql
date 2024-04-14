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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: artificial_satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.artificial_satellite (
    artificial_satellite_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL
);


ALTER TABLE public.artificial_satellite OWNER TO freecodecamp;

--
-- Name: artificial_satellite_artificial_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.artificial_satellite_artificial_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artificial_satellite_artificial_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: artificial_satellite_artificial_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.artificial_satellite_artificial_satellite_id_seq OWNED BY public.artificial_satellite.artificial_satellite_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    name character varying(30),
    number_of_stars integer DEFAULT 0 NOT NULL,
    age_in_millions_of_years numeric(7,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    has_water boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean DEFAULT false,
    star_id integer,
    moons_in_orbit integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    planets_in_orbit integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: artificial_satellite artificial_satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_satellite ALTER COLUMN artificial_satellite_id SET DEFAULT nextval('public.artificial_satellite_artificial_satellite_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: artificial_satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.artificial_satellite VALUES (1, 'Spudnik', 1);
INSERT INTO public.artificial_satellite VALUES (2, 'a', 1);
INSERT INTO public.artificial_satellite VALUES (3, 'b', 1);
INSERT INTO public.artificial_satellite VALUES (4, 'c', 1);
INSERT INTO public.artificial_satellite VALUES (5, 'd', 1);
INSERT INTO public.artificial_satellite VALUES (6, 'e', 1);
INSERT INTO public.artificial_satellite VALUES (7, 'f', 1);
INSERT INTO public.artificial_satellite VALUES (8, 'g', 1);
INSERT INTO public.artificial_satellite VALUES (9, 'h', 1);
INSERT INTO public.artificial_satellite VALUES (10, 'i', 1);
INSERT INTO public.artificial_satellite VALUES (11, 'j', 1);
INSERT INTO public.artificial_satellite VALUES (12, 'k', 1);
INSERT INTO public.artificial_satellite VALUES (13, 'l', 1);
INSERT INTO public.artificial_satellite VALUES (14, 'm', 1);
INSERT INTO public.artificial_satellite VALUES (15, 'n', 1);
INSERT INTO public.artificial_satellite VALUES (16, 'o', 1);
INSERT INTO public.artificial_satellite VALUES (17, 'p', 1);
INSERT INTO public.artificial_satellite VALUES (18, 'q', 1);
INSERT INTO public.artificial_satellite VALUES (19, 'r', 1);
INSERT INTO public.artificial_satellite VALUES (20, 's', 1);
INSERT INTO public.artificial_satellite VALUES (21, 't', 1);
INSERT INTO public.artificial_satellite VALUES (22, 'u', 1);
INSERT INTO public.artificial_satellite VALUES (23, 'v', 1);
INSERT INTO public.artificial_satellite VALUES (24, 'w', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The galaxy we live in', 'Milky Way', 0, 13800.0);
INSERT INTO public.galaxy VALUES (2, NULL, 'Andromeda', 0, NULL);
INSERT INTO public.galaxy VALUES (3, NULL, 'Sagittarius', 0, NULL);
INSERT INTO public.galaxy VALUES (4, NULL, 'Draco', 0, NULL);
INSERT INTO public.galaxy VALUES (5, NULL, 'Canis Major', 0, NULL);
INSERT INTO public.galaxy VALUES (6, NULL, 'Ursa Minor', 0, NULL);
INSERT INTO public.galaxy VALUES (7, NULL, 'Leo I', 0, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, false, true);
INSERT INTO public.moon VALUES (2, 'a', 1, false, true);
INSERT INTO public.moon VALUES (3, 'b', 1, false, true);
INSERT INTO public.moon VALUES (4, 'c', 1, false, true);
INSERT INTO public.moon VALUES (5, 'd', 1, false, true);
INSERT INTO public.moon VALUES (6, 'e', 1, false, true);
INSERT INTO public.moon VALUES (7, 'f', 1, false, true);
INSERT INTO public.moon VALUES (8, 'g', 1, false, true);
INSERT INTO public.moon VALUES (9, 'h', 1, false, true);
INSERT INTO public.moon VALUES (10, 'i', 1, false, true);
INSERT INTO public.moon VALUES (11, 'j', 1, false, true);
INSERT INTO public.moon VALUES (12, 'k', 1, false, true);
INSERT INTO public.moon VALUES (13, 'l', 1, false, true);
INSERT INTO public.moon VALUES (14, 'm', 1, false, true);
INSERT INTO public.moon VALUES (15, 'n', 1, false, true);
INSERT INTO public.moon VALUES (16, 'o', 1, false, true);
INSERT INTO public.moon VALUES (17, 'p', 1, false, true);
INSERT INTO public.moon VALUES (18, 'q', 1, false, true);
INSERT INTO public.moon VALUES (19, 'r', 1, false, true);
INSERT INTO public.moon VALUES (20, 's', 1, false, true);
INSERT INTO public.moon VALUES (21, 't', 1, false, true);
INSERT INTO public.moon VALUES (22, 'u', 1, false, true);
INSERT INTO public.moon VALUES (23, 'v', 1, false, true);
INSERT INTO public.moon VALUES (24, 'w', 1, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, true, 'Earth', true, 1, 0);
INSERT INTO public.planet VALUES (2, true, 'Mars', false, 1, 0);
INSERT INTO public.planet VALUES (3, true, 'Jupiter', false, 1, 0);
INSERT INTO public.planet VALUES (4, true, 'Pluto', false, 1, 0);
INSERT INTO public.planet VALUES (5, true, 'Venus', false, 1, 0);
INSERT INTO public.planet VALUES (6, true, 'Neptune', false, 1, 0);
INSERT INTO public.planet VALUES (7, true, 'Saturn', false, 1, 0);
INSERT INTO public.planet VALUES (8, true, 'Mercury', false, 1, 0);
INSERT INTO public.planet VALUES (9, true, 'a', false, 1, 0);
INSERT INTO public.planet VALUES (10, true, 'b', false, 1, 0);
INSERT INTO public.planet VALUES (11, true, 'c', false, 1, 0);
INSERT INTO public.planet VALUES (12, true, 'd', false, 1, 0);
INSERT INTO public.planet VALUES (13, true, 'e', false, 1, 0);
INSERT INTO public.planet VALUES (14, true, 'f', false, 1, 0);
INSERT INTO public.planet VALUES (15, true, 'g', false, 1, 0);
INSERT INTO public.planet VALUES (16, true, 'h', false, 1, 0);
INSERT INTO public.planet VALUES (17, true, 'i', false, 1, 0);
INSERT INTO public.planet VALUES (18, true, 'j', false, 1, 0);
INSERT INTO public.planet VALUES (19, true, 'k', false, 1, 0);
INSERT INTO public.planet VALUES (20, true, 'l', false, 1, 0);
INSERT INTO public.planet VALUES (21, true, 'm', false, 1, 0);
INSERT INTO public.planet VALUES (22, true, 'n', false, 1, 0);
INSERT INTO public.planet VALUES (23, true, 'o', false, 1, 0);
INSERT INTO public.planet VALUES (24, true, 'p', false, 1, 0);
INSERT INTO public.planet VALUES (25, true, 'q', false, 1, 0);
INSERT INTO public.planet VALUES (26, true, 'r', false, 1, 0);
INSERT INTO public.planet VALUES (27, true, 's', false, 1, 0);
INSERT INTO public.planet VALUES (28, true, 't', false, 1, 0);
INSERT INTO public.planet VALUES (29, true, 'u', false, 1, 0);
INSERT INTO public.planet VALUES (30, true, 'v', false, 1, 0);
INSERT INTO public.planet VALUES (31, true, 'w', false, 1, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The star Earth orbits', 'Sun', 1, NULL);
INSERT INTO public.star VALUES (2, '', 'a', 1, NULL);
INSERT INTO public.star VALUES (3, '', 'b', 1, NULL);
INSERT INTO public.star VALUES (4, '', 'c', 1, NULL);
INSERT INTO public.star VALUES (5, '', 'd', 1, NULL);
INSERT INTO public.star VALUES (6, '', 'e', 1, NULL);
INSERT INTO public.star VALUES (7, '', 'f', 1, NULL);


--
-- Name: artificial_satellite_artificial_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.artificial_satellite_artificial_satellite_id_seq', 24, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 31, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: artificial_satellite artificial_satellite_artificial_satellite_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_satellite
    ADD CONSTRAINT artificial_satellite_artificial_satellite_id_key UNIQUE (artificial_satellite_id);


--
-- Name: artificial_satellite artificial_satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_satellite
    ADD CONSTRAINT artificial_satellite_pkey PRIMARY KEY (artificial_satellite_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_galaxy_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key1 UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_moon_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key1 UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_planet_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key1 UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star star_star_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key1 UNIQUE (star_id);


--
-- Name: artificial_satellite artificial_satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_satellite
    ADD CONSTRAINT artificial_satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

