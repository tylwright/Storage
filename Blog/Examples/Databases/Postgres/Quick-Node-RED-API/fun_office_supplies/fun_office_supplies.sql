--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1 (Debian 11.1-1.pgdg90+1)
-- Dumped by pg_dump version 11.1

-- Started on 2019-02-09 23:59:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 16400)
-- Name: INVENTORY; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."INVENTORY" (
    id integer NOT NULL,
    sku integer NOT NULL,
    is_available integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."INVENTORY" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16398)
-- Name: INVENTORY_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."INVENTORY_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."INVENTORY_id_seq" OWNER TO postgres;

--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 198
-- Name: INVENTORY_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."INVENTORY_id_seq" OWNED BY public."INVENTORY".id;


--
-- TOC entry 197 (class 1259 OID 16392)
-- Name: SKU; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SKU" (
    id integer NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE public."SKU" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16390)
-- Name: SKU_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SKU_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SKU_id_seq" OWNER TO postgres;

--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 196
-- Name: SKU_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SKU_id_seq" OWNED BY public."SKU".id;


--
-- TOC entry 2747 (class 2604 OID 16403)
-- Name: INVENTORY id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."INVENTORY" ALTER COLUMN id SET DEFAULT nextval('public."INVENTORY_id_seq"'::regclass);


--
-- TOC entry 2746 (class 2604 OID 16395)
-- Name: SKU id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SKU" ALTER COLUMN id SET DEFAULT nextval('public."SKU_id_seq"'::regclass);


--
-- TOC entry 2876 (class 0 OID 16400)
-- Dependencies: 199
-- Data for Name: INVENTORY; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."INVENTORY" (id, sku, is_available) FROM stdin;
1	2	54
2	5	8
3	4	20
4	3	37
\.


--
-- TOC entry 2874 (class 0 OID 16392)
-- Dependencies: 197
-- Data for Name: SKU; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SKU" (id, description) FROM stdin;
2	Blue Ballpoint Pens (4-pack)
3	Black Ballpoint Pens (4-pack)
4	8.5" x 11" LaserJet Paper (32 lbs, 96 brightness, 300 sheets)
5	Brother TN Black Toner Cartridge, High Yield (TN-660)
\.


--
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 198
-- Name: INVENTORY_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."INVENTORY_id_seq"', 4, true);


--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 196
-- Name: SKU_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SKU_id_seq"', 5, true);


--
-- TOC entry 2750 (class 2606 OID 16397)
-- Name: SKU SKU_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SKU"
    ADD CONSTRAINT "SKU_pkey" PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 16405)
-- Name: INVENTORY INVENTORY_sku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."INVENTORY"
    ADD CONSTRAINT "INVENTORY_sku_fkey" FOREIGN KEY (sku) REFERENCES public."SKU"(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2019-02-09 23:59:39

--
-- PostgreSQL database dump complete
--
