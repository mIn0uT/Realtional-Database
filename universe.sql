--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comets (
    comets_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_km numeric(10,2),
    weight_kg double precision,
    intensity integer NOT NULL
);


ALTER TABLE public.comets OWNER TO freecodecamp;

--
-- Name: comets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_id_seq OWNER TO freecodecamp;

--
-- Name: comets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_id_seq OWNED BY public.comets.comets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types character varying(30),
    is_spherical boolean NOT NULL,
    age_in_million_of_years integer
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
    diameter_in_km numeric,
    weight_in_kg_raise_22 numeric,
    planet_id integer
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
    name character varying(30) NOT NULL,
    planet_types character varying(30),
    has_life boolean NOT NULL,
    star_id integer
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
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer,
    distance_from_earth numeric(6,2)
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
-- Name: comets comets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets ALTER COLUMN comets_id SET DEFAULT nextval('public.comets_id_seq'::regclass);


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
-- Data for Name: comets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comets VALUES (1, 'Hailey''s Comet', 11.00, 220000000000000, 5);
INSERT INTO public.comets VALUES (2, 'Hale-Bopp', 60.00, 2.2e+15, 9);
INSERT INTO public.comets VALUES (3, 'McNaught', 3.40, 2500000000000, 7);
INSERT INTO public.comets VALUES (4, 'Lovejoy', 1.20, 560000000000, 6);
INSERT INTO public.comets VALUES (5, 'Borrelly', 8.70, 13000000000000, 4);
INSERT INTO public.comets VALUES (6, 'Encke', 4.80, 12000000000000, 8);
INSERT INTO public.comets VALUES (7, 'Ikeya-Zhang', 4.00, 11000000000000, 7);
INSERT INTO public.comets VALUES (8, 'Holmes', 3.40, 440000000000, 8);
INSERT INTO public.comets VALUES (9, 'Hyakutake', 3.00, 22000000000000, 9);
INSERT INTO public.comets VALUES (10, 'West', 1.20, 450000000000, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', false, 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', false, 13600);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Eleptical', true, 12500);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', false, 9000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', false, 11000);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Eliptical', true, 10000);
INSERT INTO public.galaxy VALUES (7, 'Triangulum', 'Spiral', false, 6000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3476, 7.342, 3);
INSERT INTO public.moon VALUES (2, 'Titan', 5150, 13.45, 6);
INSERT INTO public.moon VALUES (3, 'Ganymede', 5268, 14.819, 5);
INSERT INTO public.moon VALUES (4, 'Callisto', 4820, 10.76, 5);
INSERT INTO public.moon VALUES (5, 'Io', 3642, 8.94, 5);
INSERT INTO public.moon VALUES (10, 'Europa', 3138, 4.8, 5);
INSERT INTO public.moon VALUES (11, 'Triton', 2707, 2.14, 8);
INSERT INTO public.moon VALUES (12, 'Enceladus', 504, 0.001, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 1528, 0.2307, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 396, 0.0038, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', 1062, 0.0617, 6);
INSERT INTO public.moon VALUES (16, 'Dione', 1123, 0.1095, 6);
INSERT INTO public.moon VALUES (17, 'Hyperion', 270, 0.0006, 6);
INSERT INTO public.moon VALUES (18, 'Phobos', 22.2, 0.000001, 4);
INSERT INTO public.moon VALUES (19, 'Deimos', 12.4, 0.0000001, 4);
INSERT INTO public.moon VALUES (20, 'Charon', 1208, 0.152, 9);
INSERT INTO public.moon VALUES (21, 'Ariel', 1158, 0.125, 7);
INSERT INTO public.moon VALUES (22, 'Umbriel', 1169, 0.127, 7);
INSERT INTO public.moon VALUES (23, 'Oberon', 1522, 0.3014, 7);
INSERT INTO public.moon VALUES (24, 'Titania', 1578, 0.394, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', false, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', true, 3);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', false, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', false, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', false, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', false, 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', false, 8);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf Planet', false, 8);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'Exoplanet', false, 6);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 'Exoplanet', false, 4);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 'Exoplanet', false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 'The closest star to our solar system and part of the Alpha Centauri star system. It is a red dwarf star.', 1, 4.20);
INSERT INTO public.star VALUES (2, 'Sirius', 'One of the brightest star in the night sky and part of the Canis Major Constellation.', 1, 8.60);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant star located in Orion constellation', 1, 642.50);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A/B', 'The other two stars in the closest star system to our solar system', 1, 4.37);
INSERT INTO public.star VALUES (5, 'Rigel', 'A blue supergiant star that is located in the Orion constellation', 1, 860.00);
INSERT INTO public.star VALUES (6, 'Antares', 'A red supergiant star that is located in the Scorpius consteallation', 1, 550.00);
INSERT INTO public.star VALUES (7, 'Polaris', 'Also known as the North Star, Polaris is part of the Ursa Minor constellation', 1, 434.80);
INSERT INTO public.star VALUES (8, 'Vega', 'A bright star located in the Lyra constellation', 1, 25.00);


--
-- Name: comets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_id_seq', 10, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: comets comets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_name_key UNIQUE (name);


--
-- Name: comets comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comets_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_moon UNIQUE (name);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

