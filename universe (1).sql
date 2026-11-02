--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    diameter_km numeric(10,2) NOT NULL,
    discovered_year integer,
    description text,
    is_near_earth boolean,
    is_spherical boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth_mly numeric(10,3),
    description text,
    is_spiral boolean,
    has_life boolean
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    discovered_year integer,
    gravity_m_s2 numeric(6,3),
    description text,
    is_spherical boolean,
    has_atmosphere boolean
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_star_million_km numeric(10,3),
    description text,
    is_spherical boolean,
    has_life boolean
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    mass_in_solar_masses numeric(10,3),
    description text,
    is_spherical boolean,
    has_planets boolean
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 939.40, 1801, 'Dwarf planet in the asteroid belt', false, true);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1, 525.40, 1807, 'Second most massive asteroid', false, true);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 1, 512.00, 1802, 'Third largest asteroid in the belt', false, false);
INSERT INTO public.asteroid VALUES (4, 'Bennu', 1, 0.49, 1999, 'Near-Earth asteroid visited by OSIRIS-REx', true, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 13600, 0.000, 'Our home galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2.537, 'Nearest large galaxy to the Milky Way', true, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10000, 2.723, 'Third largest galaxy in the Local Group', true, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 400, 31.000, 'Interacting grand-design spiral galaxy', true, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Unbarred Spiral', 13250, 29.350, 'Bright nucleus with a large central bulge', true, false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 13000, 0.163, 'Satellite galaxy of the Milky Way', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, NULL, 1.620, 'Earth''s only natural satellite', true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 1877, 0.006, 'Larger moon of Mars', false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1877, 0.003, 'Smaller moon of Mars', false, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1610, 1.796, 'Most volcanically active body in the solar system', true, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 1610, 1.315, 'Icy moon with a subsurface ocean', true, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 1610, 1.428, 'Largest moon in the solar system', true, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 1610, 1.235, 'Heavily cratered moon of Jupiter', true, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 1655, 1.352, 'Largest moon of Saturn with a thick atmosphere', true, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, 1789, 0.113, 'Ice geysers erupt from its south pole', true, false);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396, 1789, 0.064, 'Has a giant impact crater called Herschel', true, false);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 1527, 1672, 0.264, 'Second largest moon of Saturn', true, false);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 1123, 1684, 0.232, 'Icy moon of Saturn', true, false);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1062, 1684, 0.146, 'Icy moon with a huge canyon', true, false);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 1469, 1671, 0.223, 'Two-toned moon of Saturn', true, false);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 1578, 1787, 0.379, 'Largest moon of Uranus', true, false);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 1523, 1787, 0.346, 'Second largest moon of Uranus', true, false);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 472, 1948, 0.079, 'Moon with extreme and varied terrain', true, false);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 1158, 1851, 0.269, 'Bright moon of Uranus', true, false);
INSERT INTO public.moon VALUES (19, 'Triton', 8, 2707, 1846, 0.779, 'Largest moon of Neptune with retrograde orbit', true, true);
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 340, 1949, 0.070, 'Moon of Neptune with an eccentric orbit', false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 4500, 57.900, 'Smallest planet and closest to the Sun', true, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 4500, 108.200, 'Hottest planet with a thick atmosphere', true, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 4540, 149.600, 'Our home planet', true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 4500, 227.900, 'The red planet', true, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 4500, 778.500, 'Largest planet in the solar system', true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 4500, 1434.000, 'Known for its prominent rings', true, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 4500, 2871.000, 'Rotates on its side', true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 4500, 4495.000, 'Farthest known planet from the Sun', true, false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Terrestrial', 4850, 7.250, 'Exoplanet in the habitable zone of Proxima Centauri', true, false);
INSERT INTO public.planet VALUES (10, 'Proxima c', 2, 'Super-Earth', 4850, 223.000, 'Candidate cold super-Earth', true, false);
INSERT INTO public.planet VALUES (11, 'Proxima d', 2, 'Terrestrial', 4850, 4.300, 'Small exoplanet very close to its star', true, false);
INSERT INTO public.planet VALUES (12, 'Alpha Centauri A b', 3, 'Gas Giant', 5300, NULL, 'Candidate planet around Alpha Centauri A', true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 1.000, 'The star at the center of our solar system', true, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, 0.122, 'Closest known star to the Sun', true, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 5300, 1.100, 'Main star of the Alpha Centauri system', true, true);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 242, 2.063, 'Brightest star in the night sky', true, false);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 10, 16.500, 'Red supergiant in Orion', true, false);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 8, 21.000, 'Blue supergiant in Orion', true, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

