-- Fake galaxy, star, planet, moon and spacecraft informations are generated via Chat-GPT.

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
    type character varying
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
    name character varying(64) NOT NULL,
    planet_id integer,
    is_spherical boolean,
    distance_from_planet numeric(10,2)
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
    name character varying(64) NOT NULL,
    star_id integer,
    has_life boolean,
    distance_from_star numeric(10,2)
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
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(64) NOT NULL,
    is_active boolean,
    planet_id integer
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(64) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer,
    temperature numeric
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
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'FluffyTwirl', 'A very fuzzy galaxy.', 4500, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'GigglyGalaxy', 'Known for its laughing gas clouds.', 3200, 'Elliptical');
INSERT INTO public.galaxy VALUES (3, 'TicklishVoid', 'Sensitive to cosmic rays.', 1500, 'Irregular');
INSERT INTO public.galaxy VALUES (4, 'BubbleBurst', 'Filled with star-forming bubbles.', 2370, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'CosmicJelly', 'Looks surprisingly like a jellyfish.', 980, 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 'SnappyOrbit', 'Moves faster when observed.', 2021, 'Irregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (91, 'Panda Puff', 1, true, 12.30);
INSERT INTO public.moon VALUES (92, 'Dragon Tail', 1, false, 45.70);
INSERT INTO public.moon VALUES (93, 'Monkey Mirth', 2, true, 27.90);
INSERT INTO public.moon VALUES (94, 'Kangaroo Moon', 2, false, 38.20);
INSERT INTO public.moon VALUES (95, 'Elephant Ear', 3, true, 50.40);
INSERT INTO public.moon VALUES (96, 'Giraffe Stretch', 3, false, 65.10);
INSERT INTO public.moon VALUES (97, 'Zebra Zigzag', 4, true, 22.20);
INSERT INTO public.moon VALUES (98, 'Rhino Rock', 4, false, 49.80);
INSERT INTO public.moon VALUES (99, 'Leopard Spot', 5, true, 55.60);
INSERT INTO public.moon VALUES (100, 'Tiger Stripe', 5, false, 40.30);
INSERT INTO public.moon VALUES (101, 'Hyena Laugh', 6, true, 36.70);
INSERT INTO public.moon VALUES (102, 'Raccoon Ring', 6, false, 32.10);
INSERT INTO public.moon VALUES (103, 'Owl Eye', 7, true, 28.40);
INSERT INTO public.moon VALUES (104, 'Falcon Flight', 7, false, 47.20);
INSERT INTO public.moon VALUES (105, 'Squirrel Leap', 8, true, 39.00);
INSERT INTO public.moon VALUES (106, 'Fox Flicker', 8, false, 34.50);
INSERT INTO public.moon VALUES (107, 'Rabbit Run', 9, true, 23.70);
INSERT INTO public.moon VALUES (108, 'Hedgehog Hide', 9, false, 45.00);
INSERT INTO public.moon VALUES (109, 'Bear Bounce', 10, true, 31.20);
INSERT INTO public.moon VALUES (110, 'Wolf Whisk', 10, false, 52.80);
INSERT INTO public.moon VALUES (111, 'Llama Land', 11, true, 30.30);
INSERT INTO public.moon VALUES (112, 'Goat Gambol', 11, false, 41.70);
INSERT INTO public.moon VALUES (113, 'Cow Circle', 12, true, 39.50);
INSERT INTO public.moon VALUES (114, 'Penguin Plunge', 12, false, 50.60);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'CatEarth', 1, true, 5.10);
INSERT INTO public.planet VALUES (2, 'DogJupiter', 1, false, 10.40);
INSERT INTO public.planet VALUES (3, 'FishNeptune', 2, true, 20.00);
INSERT INTO public.planet VALUES (4, 'MouseMars', 2, false, 18.20);
INSERT INTO public.planet VALUES (5, 'ElephantSaturn', 3, true, 9.50);
INSERT INTO public.planet VALUES (6, 'RabbitVenus', 3, false, 14.30);
INSERT INTO public.planet VALUES (7, 'GiraffeMercury', 4, false, 3.90);
INSERT INTO public.planet VALUES (8, 'KangarooUranus', 4, true, 19.50);
INSERT INTO public.planet VALUES (9, 'PenguinPluto', 5, false, 30.20);
INSERT INTO public.planet VALUES (10, 'FrogSatellite', 5, true, 25.40);
INSERT INTO public.planet VALUES (11, 'LionSunspot', 6, false, 0.60);
INSERT INTO public.planet VALUES (12, 'BearMoon', 6, true, 8.90);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Cosmic Turtle', true, 1);
INSERT INTO public.spacecraft VALUES (2, 'Galactic Sloth', true, 2);
INSERT INTO public.spacecraft VALUES (3, 'Star Hopper Rabbit', false, 3);
INSERT INTO public.spacecraft VALUES (4, 'Moon Jumper Cat', true, 4);
INSERT INTO public.spacecraft VALUES (5, 'Space Wanderer Dog', false, 5);
INSERT INTO public.spacecraft VALUES (6, 'Orbit Runner Mouse', true, 6);
INSERT INTO public.spacecraft VALUES (7, 'Celestial Whale', true, 7);
INSERT INTO public.spacecraft VALUES (8, 'Nova Ferret', false, 8);
INSERT INTO public.spacecraft VALUES (9, 'Meteor Meerkat', true, 9);
INSERT INTO public.spacecraft VALUES (10, 'Comet Cobra', false, 10);
INSERT INTO public.spacecraft VALUES (11, 'Astro Alpaca', true, 11);
INSERT INTO public.spacecraft VALUES (12, 'Eclipse Elk', false, 12);
INSERT INTO public.spacecraft VALUES (13, 'Nebula Narwhal', true, 1);
INSERT INTO public.spacecraft VALUES (14, 'Pulsar Penguin', true, 2);
INSERT INTO public.spacecraft VALUES (15, 'Quasar Quokka', false, 3);
INSERT INTO public.spacecraft VALUES (16, 'Spiral Squirrel', true, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'TwinkleToe', 1, 300, 5500);
INSERT INTO public.star VALUES (2, 'Blinky', 2, 200, 3000);
INSERT INTO public.star VALUES (3, 'Winky', 3, 500, 6000);
INSERT INTO public.star VALUES (4, 'SparkleQueen', 4, 1000, 4500);
INSERT INTO public.star VALUES (5, 'GlowyMcGlowFace', 5, 250, 2000);
INSERT INTO public.star VALUES (6, 'DazzleDust', 6, 900, 7000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 114, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spacecraft spacecraft_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_unique UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


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
-- Name: spacecraft spacecraft_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

