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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    number_of_star integer,
    has_blackhole boolean,
    solar_mass numeric(4,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(60),
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    diameter_km numeric(8,1),
    is_habital boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(60),
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    planet_mass numeric(4,1)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    is_visible boolean,
    number_of_planet integer,
    description text
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
-- Name: universe_map; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_map (
    universe_map_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(60)
);


ALTER TABLE public.universe_map OWNER TO freecodecamp;

--
-- Name: universe_map_map_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_map_map_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_map_map_id_seq OWNER TO freecodecamp;

--
-- Name: universe_map_map_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_map_map_id_seq OWNED BY public.universe_map.universe_map_id;


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: universe_map universe_map_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_map ALTER COLUMN universe_map_id SET DEFAULT nextval('public.universe_map_map_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 3, 3474.8, true);
INSERT INTO public.moon VALUES ('Phobos', 2, 4, 3122.0, true);
INSERT INTO public.moon VALUES ('Deimos', 3, 4, 12742.0, false);
INSERT INTO public.moon VALUES ('Io', 4, 5, 6792.0, false);
INSERT INTO public.moon VALUES ('Europa', 5, 5, 142984.0, false);
INSERT INTO public.moon VALUES ('Ganymede', 6, 5, 120536.0, false);
INSERT INTO public.moon VALUES ('Callisto', 7, 5, 50724.0, false);
INSERT INTO public.moon VALUES ('Titan', 8, 6, 49244.0, false);
INSERT INTO public.moon VALUES ('Rhea', 9, 6, 11300.0, false);
INSERT INTO public.moon VALUES ('Iapetus', 10, 6, 12100.0, false);
INSERT INTO public.moon VALUES ('Dione', 11, 6, 12500.0, false);
INSERT INTO public.moon VALUES ('Tethys', 12, 6, 11000.0, false);
INSERT INTO public.moon VALUES ('Oberon', 13, 7, 4800.0, false);
INSERT INTO public.moon VALUES ('Titania', 14, 7, 5100.0, false);
INSERT INTO public.moon VALUES ('Umbriel', 15, 7, 5300.0, false);
INSERT INTO public.moon VALUES ('Ariel', 16, 7, 5500.0, false);
INSERT INTO public.moon VALUES ('Miranda', 17, 7, 5700.0, false);
INSERT INTO public.moon VALUES ('Triton', 18, 8, 5900.0, false);
INSERT INTO public.moon VALUES ('Proteus', 19, 8, 6100.0, false);
INSERT INTO public.moon VALUES ('Nereid', 20, 8, 6300.0, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Venus', 2, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Earth', 3, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Mars', 4, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Jupiter', 5, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Saturn', 6, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Neptune', 8, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Uranus', 7, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('TRAPPIST-1b', 9, 2, NULL, NULL);
INSERT INTO public.planet VALUES ('TRAPPIST-1c', 10, 2, NULL, NULL);
INSERT INTO public.planet VALUES ('TRAPPIST-1d', 11, 2, NULL, NULL);
INSERT INTO public.planet VALUES ('TRAPPIST-1a', 12, 2, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (2, 'TRAPPIST-1', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Rigle', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 1, NULL, NULL, NULL);


--
-- Data for Name: universe_map; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe_map VALUES (1, 1, 1, 3, 1, 'Milky Way - Sun - Earth - Moon');
INSERT INTO public.universe_map VALUES (2, 1, 1, 4, 2, 'Milky Way - Sun - Mars - Phobos');
INSERT INTO public.universe_map VALUES (3, 1, 1, 4, 3, 'Milky Way - Sun - Mars - Deimos');


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 2, true);


--
-- Name: universe_map_map_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_map_map_id_seq', 3, true);


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
-- Name: universe_map unique_universe_map; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_map
    ADD CONSTRAINT unique_universe_map UNIQUE (galaxy_id, star_id, planet_id, moon_id);


--
-- Name: universe_map universe_map_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_map
    ADD CONSTRAINT universe_map_pkey PRIMARY KEY (universe_map_id);


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
-- Name: universe_map universe_map_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_map
    ADD CONSTRAINT universe_map_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: universe_map universe_map_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_map
    ADD CONSTRAINT universe_map_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: universe_map universe_map_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_map
    ADD CONSTRAINT universe_map_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: universe_map universe_map_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_map
    ADD CONSTRAINT universe_map_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

