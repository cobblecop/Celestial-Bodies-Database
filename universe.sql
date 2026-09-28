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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    family character varying(30)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    galaxy_type character varying(10),
    age_in_billions_of_years numeric(30,2)
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
    description text NOT NULL,
    mass_in_kgs numeric(30,5),
    planet_id integer,
    has_atmosphere boolean DEFAULT false
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
    description text NOT NULL,
    has_life boolean,
    star_id integer NOT NULL,
    no_of_moons integer
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
    description text NOT NULL,
    distance_from_earth_in_aus integer,
    galaxy_id integer NOT NULL,
    no_of_planets integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'A prominent celestial constellation located on the celestial equator, famous for the belt of three bright stars and the Orion Nebula.', 'Orion');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'A major northern constellation containing the Big Dipper asterism, used historically for navigation toward the North Star.', 'Ursa Major');
INSERT INTO public.constellation VALUES (3, 'Taurus', 'A large zodiac constellation in the northern hemisphere, featuring the bright red giant Aldebaran and the Pleiades star cluster.', 'Zodiac');
INSERT INTO public.constellation VALUES (4, 'Centaurus', 'A bright southern constellation containing Alpha Centauri, the closest star system to our Solar System.', 'Bayer');
INSERT INTO public.constellation VALUES (5, 'Cassiopeia', 'A distinctive W-shaped constellation in the northern sky named after the vain queen in Greek mythology.', 'Perseus');
INSERT INTO public.constellation VALUES (6, 'Scorpius', 'A massive zodiac constellation near the center of the Milky Way, recognized by its hook shape and the red supergiant Antares.', 'Zodiac');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'A barred spiral galaxy containing our Solar System, estimated to host over 100 billion stars and a central supermassive black hole named Sagittarius A*.', 'Barred', 13.60);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major spiral galaxy to the Milky Way, containing approximately one trillion stars and currently on a collision course with us.', 'Spiral', 10.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'The third-largest member of the Local Group, a smaller spiral galaxy featuring active star-forming regions such as NGC 604.', 'Spiral', 12.00);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A supergiant elliptical galaxy in the Virgo Cluster housing the first supermassive black hole ever directly imaged by the Event Horizon Telescope.', 'Elliptical', 13.20);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way classified as a disrupted irregular galaxy, rich in gas and home to the Tarantula Nebula.', 'Irregular', 11.01);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'An unbarred spiral galaxy with an unusually bright nucleus, a massive central bulge, and a prominent dark dust lane.', 'Spiral', 13.25);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel Galaxy', 'A rare ring galaxy produced by a high-speed collision with a smaller companion galaxy, generating expanding shockwaves of star formation.', 'Ring', 0.50);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth''s only natural satellite, driving tides and stabilizing Earth''s axial tilt.', 73420000000000000000000.00000, 1, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and inner moon of Mars, heavily cratered and orbiting extremely close to Mars.', 10659000000000000.00000, 2, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and outer moon of Mars, covered in a thick layer of smooth regolith.', 1476200000000000.00000, 2, false);
INSERT INTO public.moon VALUES (4, 'Io', 'The most volcanically active body in the Solar System due to extreme tidal heating.', 89319000000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (5, 'Europa', 'An icy world with a smooth surface hiding a global subsurface liquid water ocean.', 47998000000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the Solar System, even larger than Mercury, with its own magnetic field.', 148190000000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A heavily cratered, ancient icy moon with one of the oldest surfaces in the Solar System.', 107590000000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'An irregularly shaped, intensely red moon orbiting within Jupiter''s inner ring system.', 2080000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (9, 'Himalia', 'The largest irregular satellite of Jupiter, leading a group of prograde irregular moons.', 4200000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (10, 'Elara', 'A prograde irregular moon of Jupiter belonging to the Himalia group.', 870000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 'A retrograde irregular satellite orbiting Jupiter at a high orbital inclination.', 300000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (12, 'Sinope', 'A small retrograde irregular moon of Jupiter with a distinctly reddish hue.', 75000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (13, 'Lysithea', 'A small prograde moon belonging to the Himalia group around Jupiter.', 63000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (14, 'Carme', 'The primary member of the Carme group of retrograde irregular moons orbiting Jupiter.', 130000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (15, 'Ananke', 'The largest member of the Ananke group of retrograde irregular Jovian satellites.', 30000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (16, 'Metis', 'The innermost known moon of Jupiter, embedded within Jupiter''s main ring.', 36000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (17, 'Adrastea', 'A small inner moon of Jupiter located on the outer edge of Jupiter''s main ring.', 2000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (18, 'Thebe', 'The second largest of the inner moons of Jupiter, featuring several large impact craters.', 430000000000000000.00000, 3, false);
INSERT INTO public.moon VALUES (20, 'Vesper', 'A rocky, tidally locked companion exomoon orbiting in the outer system of Rigel-Alpha b.', 845000000000000000000.00000, 5, false);
INSERT INTO public.moon VALUES (19, 'Aethel', 'A massive icy exomoon orbiting Rigel-Alpha b, possessing a dense nitrogen atmosphere.', 5120000000000000000000.00000, 5, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun and the only known astronomical object known to harbor life.', true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The fourth planet from the Sun, a dusty, cold, desert world with a very thin atmosphere.', false, 1, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'The largest planet in our Solar System, a massive gas giant with a famous Great Red Spot.', false, 1, 95);
INSERT INTO public.planet VALUES (4, 'Kepler-16b', 'A Saturn-mass gas giant orbiting both Kepler-16A and Kepler-16B in a circumbinary orbit.', false, 4, 0);
INSERT INTO public.planet VALUES (5, 'Rigel-Alpha b', 'A rocky planet orbiting both Alpha Centauri A and Alpha Centauri B in a wide circumbinary orbit.', false, 2, 1);
INSERT INTO public.planet VALUES (6, 'TRAPPIST-1b', 'An Earth-sized rocky exoplanet orbiting extremely close to its red dwarf host star.', false, 6, 0);
INSERT INTO public.planet VALUES (7, 'TRAPPIST-1c', 'A terrestrial exoplanet with a density similar to Earth, likely possessing a thin atmosphere.', false, 6, 0);
INSERT INTO public.planet VALUES (8, 'TRAPPIST-1d', 'A small rocky world orbiting near the inner boundary of the TRAPPIST-1 habitable zone.', false, 6, 0);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1e', 'An Earth-sized world situated directly in the habitable zone, potentially hosting liquid water.', true, 6, 0);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1f', 'A volatile-rich planet in the habitable zone with a lower density, possibly an ocean world.', false, 6, 0);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1g', 'The second largest planet in the TRAPPIST-1 system, located near the outer edge of the habitable zone.', false, 6, 0);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1h', 'The outermost planet in the TRAPPIST-1 system, an icy world far beyond the habitable boundary.', false, 6, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence star located at the center of the Solar System.', 1, 1, 8);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'A solar analog star forming a close binary pair with Alpha Centauri B in the closest star system to Earth.', 274685, 1, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 'A K-type main-sequence star bound in a tight orbit with Alpha Centauri A.', 274685, 1, 1);
INSERT INTO public.star VALUES (4, 'Kepler-16A', 'A K-type main-sequence star that forms a tight binary system with Kepler-16B, orbited by a circumbinary planet.', 15500000, 1, 1);
INSERT INTO public.star VALUES (5, 'Kepler-16B', 'A red dwarf star bound to Kepler-16A in a close mutual orbit.', 15500000, 1, 1);
INSERT INTO public.star VALUES (6, 'TRAPPIST-1', 'An ultra-cool red dwarf star hosting a compact planetary system of Earth-sized terrestrial worlds.', 25670000, 1, 7);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


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
-- Name: constellation constellation_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_description_key UNIQUE (description);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


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
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


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
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


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

