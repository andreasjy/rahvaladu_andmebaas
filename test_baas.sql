--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ansambel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ansambel (
    ansambel_kood character varying(255) NOT NULL,
    ansambel_nimi character varying(255) NOT NULL
);


ALTER TABLE ansambel OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: kasutaja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kasutaja (
    kasutajanimi character varying(255) NOT NULL,
    aktiivne boolean NOT NULL,
    nimi character varying(255) NOT NULL,
    parool character varying(255) NOT NULL,
    ansambel_kood character varying(255),
    roll_kood character varying(255) NOT NULL
);


ALTER TABLE kasutaja OWNER TO postgres;

--
-- Name: kasutaja_roll; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kasutaja_roll (
    roll_kood character varying(255) NOT NULL,
    roll_nimi character varying(255) NOT NULL
);


ALTER TABLE kasutaja_roll OWNER TO postgres;

--
-- Name: komplekti_nimi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE komplekti_nimi (
    id bigint NOT NULL,
    komplekti_nimetus character varying(255) NOT NULL,
    ansambel_kood character varying(255) NOT NULL
);


ALTER TABLE komplekti_nimi OWNER TO postgres;

--
-- Name: komplekti_roivas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE komplekti_roivas (
    id bigint NOT NULL,
    ansambel_kood character varying(255) NOT NULL,
    komplekti_nimi_id bigint NOT NULL,
    roiva_nimi_id bigint NOT NULL
);


ALTER TABLE komplekti_roivas OWNER TO postgres;

--
-- Name: roiva_nimi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roiva_nimi (
    id bigint NOT NULL,
    roiva_nimetus character varying(255) NOT NULL,
    ansambel_kood character varying(255) NOT NULL,
    roiva_tyyp_id bigint NOT NULL
);


ALTER TABLE roiva_nimi OWNER TO postgres;

--
-- Name: roiva_tyyp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roiva_tyyp (
    id bigint NOT NULL,
    roiva_tyyp_nimi character varying(255) NOT NULL,
    ansambel_kood character varying(255) NOT NULL
);


ALTER TABLE roiva_tyyp OWNER TO postgres;

--
-- Name: roivaese; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roivaese (
    id bigint NOT NULL,
    aktiivne boolean NOT NULL,
    eseme_number character varying(255),
    kommentaar character varying(255),
    suurus real,
    valjastatud boolean NOT NULL,
    ansambel_kood character varying(255) NOT NULL,
    roiva_nimi_id bigint NOT NULL,
    roiva_tyyp_id bigint NOT NULL
);


ALTER TABLE roivaese OWNER TO postgres;

--
-- Name: ryhm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ryhm (
    id bigint NOT NULL,
    ryhma_nimi character varying(255) NOT NULL,
    ansambel_kood character varying(255) NOT NULL
);


ALTER TABLE ryhm OWNER TO postgres;

--
-- Name: sugu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sugu (
    sugu_kood character varying(255) NOT NULL,
    sugu_nimi character varying(255) NOT NULL
);


ALTER TABLE sugu OWNER TO postgres;

--
-- Name: tantsija; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tantsija (
    id bigint NOT NULL,
    aktiivne boolean NOT NULL,
    eesnimi character varying(255) NOT NULL,
    jalanumber bigint,
    pea_ymbermoot bigint,
    perenimi character varying(255) NOT NULL,
    pikkus real,
    telefoni_nr character varying(255),
    ansambel_kood character varying(255) NOT NULL,
    ryhm_id bigint NOT NULL,
    sugu_kood character varying(255) NOT NULL
);


ALTER TABLE tantsija OWNER TO postgres;

--
-- Name: tantsija_roivas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tantsija_roivas (
    id bigint NOT NULL,
    keht_algus bytea NOT NULL,
    keht_lopp bytea,
    kommentaar character varying(255),
    ansambel_kood character varying(255) NOT NULL,
    roivaese_id bigint NOT NULL,
    tantsija_id bigint NOT NULL
);


ALTER TABLE tantsija_roivas OWNER TO postgres;

--
-- Data for Name: ansambel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ansambel (ansambel_kood, ansambel_nimi) FROM stdin;
KULJUS	Kuljus
TYRKA	Tartu Ylikooli Rahvakunstiansambel
AVELI	Aveli ladu
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 275, true);


--
-- Data for Name: kasutaja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kasutaja (kasutajanimi, aktiivne, nimi, parool, ansambel_kood, roll_kood) FROM stdin;
silvi	t	Silvi	$2a$10$Tgr0HWnHOkngcarYRq89YOx2jN5wQvdn43igxKQ9jW.j5BMyQuW/u	KULJUS	ROLE_HALDUR
AlexanderA	t	Alexander	$2a$10$ElSXm5OhRZQ3f4eR4Cwt9eAmYnToUyO7u0K1k2xBY4NQ4gTg1pgym	KULJUS	ROLE_HALDUR
AVellerind	t	Aveli Vellerind	$2a$10$SjVyUCYZCgHD.W0.3fLqKedxJPy3WvkC/esMNQAf97eSaEC6JOH52	AVELI	ROLE_HALDUR
ageraudsepp	t	Age Raudsepp	$2a$10$wFGY4QjKpHoOx..Eix/9r.QF5RN2DT78j9Gn9ofLKxh5fq7fZeTZG	TYRKA	ROLE_HALDUR
kadri	t	Kadri	$2a$10$ZIM2ldkLa4CkCesYDP3tWOjkBaG6SKALhYSvETOYaOYPSklwiZL0y	KULJUS	ROLE_HALDUR
KristinP	t	Kristin Parve	$2a$10$V8g89JNy5mXFBflDtnZis.NxMTP9yzqN8cVIxeSRD1.Jg.2J4E60S	KULJUS	ROLE_HALDUR
andreasjy	t	Andreas Jürimäe	$2a$10$FVqrw5bDI0AykrhpaqlT.e5lZILP8AB9076Zt4PN2eN6X5XNf8woW	KULJUS	ROLE_ADMIN
\.


--
-- Data for Name: kasutaja_roll; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kasutaja_roll (roll_kood, roll_nimi) FROM stdin;
ROLE_ADMIN	Admin
ROLE_HALDUR	Haldur
\.


--
-- Data for Name: komplekti_nimi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY komplekti_nimi (id, komplekti_nimetus, ansambel_kood) FROM stdin;
21	Tumesinised meeste põhikomplekt	KULJUS
197	Lihula meeste komplekt	KULJUS
246	Audru n	TYRKA
248	Suure-Jaani n	TYRKA
\.


--
-- Data for Name: komplekti_roivas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY komplekti_roivas (id, ansambel_kood, komplekti_nimi_id, roiva_nimi_id) FROM stdin;
77	KULJUS	21	23
78	KULJUS	21	26
79	KULJUS	21	47
80	KULJUS	21	57
81	KULJUS	21	68
82	KULJUS	21	16
128	KULJUS	21	83
198	KULJUS	197	101
199	KULJUS	197	110
200	KULJUS	197	119
201	KULJUS	197	179
202	KULJUS	197	188
203	KULJUS	197	16
\.


--
-- Data for Name: roiva_nimi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roiva_nimi (id, roiva_nimetus, ansambel_kood, roiva_tyyp_id) FROM stdin;
16	Must kaabu	KULJUS	12
26	Meeste valge kraega pluus	KULJUS	15
31	Audru pluus	KULJUS	15
47	Meeste tumesinine kuub	KULJUS	13
57	Punane vest	KULJUS	56
68	Lilla kaelarätt	KULJUS	67
83	Pruunid pühalepa sukapaelad	KULJUS	66
92	Jüri vest hele	KULJUS	56
101	Lihula vest	KULJUS	56
110	Lihula pluus	KULJUS	15
119	Lihula sukapaelad (roosad)	KULJUS	66
144	Meremeeste särk	KULJUS	15
160	Meeste valged sukad	KULJUS	159
169	Meeste kingad	KULJUS	158
179	Lihula meeste püksid	KULJUS	22
188	Lihula meeste kuub	KULJUS	13
228	Muhu seelik	AVELI	224
264	meeste särk	TYRKA	259
272	Rannu püksid	TYRKA	261
23	Meeste tumesinised püksid	KULJUS	22
\.


--
-- Data for Name: roiva_tyyp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roiva_tyyp (id, roiva_tyyp_nimi, ansambel_kood) FROM stdin;
12	Peakate	KULJUS
13	Kuub	KULJUS
14	Seelik	KULJUS
15	Pluus	KULJUS
22	Püksid	KULJUS
56	Vest	KULJUS
66	Sukapaelad	KULJUS
67	Kaelarätt	KULJUS
158	Kingad	KULJUS
159	Sukad	KULJUS
224	Seelik	AVELI
225	Vest	AVELI
226	Püksid	AVELI
227	Särk	AVELI
259	Särk	TYRKA
260	Kuub	TYRKA
261	Püksid	TYRKA
262	Vöö	TYRKA
263	Tanu	TYRKA
\.


--
-- Data for Name: roivaese; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roivaese (id, aktiivne, eseme_number, kommentaar, suurus, valjastatud, ansambel_kood, roiva_nimi_id, roiva_tyyp_id) FROM stdin;
30	t			\N	f	KULJUS	26	15
32	t	\N	\N	\N	f	KULJUS	31	15
37	t			\N	f	KULJUS	16	12
39	t			\N	f	KULJUS	16	12
40	t			\N	f	KULJUS	16	12
41	t			\N	f	KULJUS	16	12
42	t			\N	f	KULJUS	16	12
43	t			\N	f	KULJUS	26	15
44	t			\N	f	KULJUS	26	15
45	t			\N	f	KULJUS	26	15
46	t			\N	f	KULJUS	26	15
51	t			\N	f	KULJUS	47	13
52	t			\N	f	KULJUS	47	13
53	t			\N	f	KULJUS	47	13
54	t			\N	f	KULJUS	47	13
55	t			\N	f	KULJUS	47	13
60	t			\N	f	KULJUS	57	56
61	t			\N	f	KULJUS	57	56
62	t			\N	f	KULJUS	57	56
63	t			\N	f	KULJUS	57	56
64	t			\N	f	KULJUS	57	56
65	t			\N	f	KULJUS	57	56
71	t			\N	f	KULJUS	68	67
72	t			\N	f	KULJUS	68	67
73	t			\N	f	KULJUS	68	67
74	t			\N	f	KULJUS	68	67
75	t			\N	f	KULJUS	68	67
76	t			\N	f	KULJUS	68	67
87	t			\N	f	KULJUS	83	66
88	t			\N	f	KULJUS	83	66
89	t			\N	f	KULJUS	83	66
90	t			\N	f	KULJUS	83	66
91	t			\N	f	KULJUS	83	66
93	t			\N	f	KULJUS	92	56
94	t			\N	f	KULJUS	92	56
95	t			\N	f	KULJUS	92	56
96	t			\N	f	KULJUS	92	56
97	t			\N	f	KULJUS	92	56
98	t			\N	f	KULJUS	92	56
99	t			\N	f	KULJUS	92	56
100	t			\N	f	KULJUS	92	56
103	t			\N	f	KULJUS	101	56
104	t			\N	f	KULJUS	101	56
105	t			\N	f	KULJUS	101	56
106	t			\N	f	KULJUS	101	56
107	t			\N	f	KULJUS	101	56
108	t			\N	f	KULJUS	101	56
109	t			\N	f	KULJUS	101	56
112	t			\N	f	KULJUS	110	15
113	t			\N	f	KULJUS	110	15
114	t			\N	f	KULJUS	110	15
115	t			\N	f	KULJUS	110	15
116	t			\N	f	KULJUS	110	15
117	t			\N	f	KULJUS	110	15
118	t			\N	f	KULJUS	110	15
122	t			\N	f	KULJUS	119	66
123	t			\N	f	KULJUS	119	66
124	t			\N	f	KULJUS	119	66
125	t			\N	f	KULJUS	119	66
126	t			\N	f	KULJUS	119	66
127	t			\N	f	KULJUS	119	66
33	t	\N	\N	\N	t	KULJUS	23	22
27	t			\N	t	KULJUS	26	15
48	t	\N	\N	\N	t	KULJUS	47	13
58	t	\N	\N	\N	t	KULJUS	57	56
69	t	\N	\N	\N	t	KULJUS	68	67
35	t	\N	\N	\N	t	KULJUS	16	12
84	t	\N	\N	\N	t	KULJUS	83	66
49	t			\N	t	KULJUS	47	13
34	t	\N	\N	\N	t	KULJUS	23	22
28	t			\N	t	KULJUS	26	15
50	t			\N	t	KULJUS	47	13
59	t			\N	t	KULJUS	57	56
70	t			\N	t	KULJUS	68	67
36	t			\N	t	KULJUS	16	12
85	t			\N	t	KULJUS	83	66
146	t			\N	f	KULJUS	144	15
147	t			\N	f	KULJUS	144	15
148	t			\N	f	KULJUS	144	15
149	t			\N	f	KULJUS	144	15
150	t			\N	f	KULJUS	144	15
151	t			\N	f	KULJUS	144	15
152	t			\N	f	KULJUS	144	15
145	t	\N	\N	\N	t	KULJUS	144	15
86	t			\N	t	KULJUS	83	66
120	t			\N	t	KULJUS	119	66
29	t			\N	t	KULJUS	26	15
38	t			\N	t	KULJUS	16	12
162	t			\N	f	KULJUS	160	159
163	t			\N	f	KULJUS	160	159
164	t			\N	f	KULJUS	160	159
165	t			\N	f	KULJUS	160	159
166	t			\N	f	KULJUS	160	159
167	t			\N	f	KULJUS	160	159
168	t			\N	f	KULJUS	160	159
171	t			\N	f	KULJUS	169	158
172	t			\N	f	KULJUS	169	158
173	t			\N	f	KULJUS	169	158
174	t			\N	f	KULJUS	169	158
175	t			\N	f	KULJUS	169	158
176	t			\N	f	KULJUS	169	158
111	t			\N	t	KULJUS	110	15
121	t			\N	t	KULJUS	119	66
170	t			\N	t	KULJUS	169	158
161	t	\N	\N	\N	t	KULJUS	160	159
177	t			\N	f	KULJUS	169	158
181	t			\N	f	KULJUS	179	22
182	t			\N	f	KULJUS	179	22
183	t			\N	f	KULJUS	179	22
184	t			\N	f	KULJUS	179	22
185	t			\N	f	KULJUS	179	22
186	t			\N	f	KULJUS	179	22
187	t			\N	f	KULJUS	179	22
190	t			\N	f	KULJUS	188	13
191	t			\N	f	KULJUS	188	13
192	t			\N	f	KULJUS	188	13
193	t			\N	f	KULJUS	188	13
194	t			\N	f	KULJUS	188	13
195	t			\N	f	KULJUS	188	13
196	t			\N	f	KULJUS	188	13
102	t			\N	t	KULJUS	101	56
180	t	\N	\N	\N	t	KULJUS	179	22
189	t			\N	t	KULJUS	188	13
211	t	\N	\N	\N	f	KULJUS	23	22
212	t			\N	f	KULJUS	23	22
213	t			\N	f	KULJUS	23	22
214	t			\N	f	KULJUS	23	22
215	t			\N	f	KULJUS	23	22
216	t			\N	f	KULJUS	23	22
230	t	2		57	f	AVELI	228	224
231	t	3		58	f	AVELI	228	224
229	t	1	\N	60	t	AVELI	228	224
266	t	2		\N	f	TYRKA	264	259
267	t	3		\N	f	TYRKA	264	259
269	t	5		\N	f	TYRKA	264	259
265	t	1	\N	\N	t	TYRKA	264	259
268	t	4		\N	f	TYRKA	264	259
274	t	457	Lauri	\N	f	TYRKA	272	261
273	t	456	Taavi	40	t	TYRKA	272	261
\.


--
-- Data for Name: ryhm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ryhm (id, ryhma_nimi, ansambel_kood) FROM stdin;
4	Esimene põhikoosseis	KULJUS
5	Teine põhikoosseis	KULJUS
6	Noorem rühm	KULJUS
7	Kelluke	KULJUS
217	A-rühm	AVELI
218	B-rühm	AVELI
219	C-rühm	AVELI
233	Vilistlased	TYRKA
234	A	TYRKA
\.


--
-- Data for Name: sugu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sugu (sugu_kood, sugu_nimi) FROM stdin;
MEES	Mees
NAINE	Naine
\.


--
-- Data for Name: tantsija; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tantsija (id, aktiivne, eesnimi, jalanumber, pea_ymbermoot, perenimi, pikkus, telefoni_nr, ansambel_kood, ryhm_id, sugu_kood) FROM stdin;
18	t	Andreas	\N	\N	Jürimäe	\N	\N	KULJUS	5	MEES
19	t	Andres	\N	\N	Viljakainen	\N	\N	KULJUS	5	MEES
20	t	Ahto	\N	\N	Moorast	\N	\N	KULJUS	5	MEES
17	t	Ats	\N	\N	Varul	\N	\N	KULJUS	6	MEES
220	t	Mari	38	56	Müts	165	\N	AVELI	217	NAINE
221	t	Peeter	44	59	Pikk	185	\N	AVELI	217	MEES
222	t	Liina	40	55	Liim	176	\N	AVELI	218	NAINE
223	t	Marko	45	60	Meeter	190	\N	AVELI	218	MEES
235	t	Taavi	43	56	Ohakas	185	\N	TYRKA	233	MEES
237	t	Aveli	\N	\N	Vellerind	\N	\N	TYRKA	234	NAINE
238	t	Tõnn	\N	\N	Sikk	\N	\N	TYRKA	234	MEES
239	t	Merike	\N	\N	Sikk	\N	\N	TYRKA	234	NAINE
236	t	Age	42	54	Raudsepp	176	55663661	TYRKA	233	NAINE
\.


--
-- Data for Name: tantsija_roivas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tantsija_roivas (id, keht_algus, keht_lopp, kommentaar, ansambel_kood, roivaese_id, tantsija_id) FROM stdin;
129	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e100f202fbf0078	\N	\N	KULJUS	33	18
130	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e100f2498e58078	\N	\N	KULJUS	27	18
131	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e100f2550008078	\N	\N	KULJUS	48	18
132	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e100f25ab8e0078	\N	\N	KULJUS	58	18
133	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e100f25e8970078	\N	\N	KULJUS	69	18
134	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e100f26cd78c078	\N	\N	KULJUS	35	18
135	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e100f2756cd0078	\N	\N	KULJUS	84	18
136	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e112415846c4078	\N	\N	KULJUS	49	20
137	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e151737e8be8078	\N	\N	KULJUS	34	19
138	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e151738444c0078	\N	\N	KULJUS	28	19
139	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e15173890974078	\N	\N	KULJUS	50	19
140	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e151738ec24c078	\N	\N	KULJUS	59	19
141	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e15173993fd8078	\N	\N	KULJUS	70	19
142	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e151739d1068078	\N	\N	KULJUS	36	19
143	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e15173a3bd64078	\N	\N	KULJUS	85	19
153	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e180b102721c078	\N	\N	KULJUS	145	19
154	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e1b020e3ed9c078	\N	\N	KULJUS	86	17
155	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e1b020f14794078	\N	\N	KULJUS	120	17
156	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e1b020f51824078	\N	\N	KULJUS	29	17
157	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e1b020ff95b0078	\N	\N	KULJUS	38	17
204	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e230d0121eac078	\N	\N	KULJUS	102	17
205	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e230d017d784078	\N	\N	KULJUS	111	17
206	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e230d01ba814078	\N	\N	KULJUS	121	17
207	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e230d01f78a4078	\N	\N	KULJUS	180	17
208	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e230d038444c078	\N	\N	KULJUS	189	17
209	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e240f164ac98078	\N	\N	KULJUS	170	17
210	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109090e241a295d998078	\N	\N	KULJUS	161	17
232	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e1090c000a2124f4730078	\N	\N	AVELI	229	220
270	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109150d272c17b8ff8078	\N	\N	TYRKA	265	238
271	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109150d2739092dda8078	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109150d29273a88218078	\N	TYRKA	268	235
275	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e109150d2d0f0a9c108078	\N	\N	TYRKA	273	235
\.


--
-- Name: ansambel ansambel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ansambel
    ADD CONSTRAINT ansambel_pkey PRIMARY KEY (ansambel_kood);


--
-- Name: kasutaja kasutaja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kasutaja
    ADD CONSTRAINT kasutaja_pkey PRIMARY KEY (kasutajanimi);


--
-- Name: kasutaja_roll kasutaja_roll_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kasutaja_roll
    ADD CONSTRAINT kasutaja_roll_pkey PRIMARY KEY (roll_kood);


--
-- Name: komplekti_nimi komplekti_nimi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komplekti_nimi
    ADD CONSTRAINT komplekti_nimi_pkey PRIMARY KEY (id);


--
-- Name: komplekti_roivas komplekti_roivas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komplekti_roivas
    ADD CONSTRAINT komplekti_roivas_pkey PRIMARY KEY (id);


--
-- Name: roiva_nimi roiva_nimi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roiva_nimi
    ADD CONSTRAINT roiva_nimi_pkey PRIMARY KEY (id);


--
-- Name: roiva_tyyp roiva_tyyp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roiva_tyyp
    ADD CONSTRAINT roiva_tyyp_pkey PRIMARY KEY (id);


--
-- Name: roivaese roivaese_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roivaese
    ADD CONSTRAINT roivaese_pkey PRIMARY KEY (id);


--
-- Name: ryhm ryhm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ryhm
    ADD CONSTRAINT ryhm_pkey PRIMARY KEY (id);


--
-- Name: sugu sugu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sugu
    ADD CONSTRAINT sugu_pkey PRIMARY KEY (sugu_kood);


--
-- Name: tantsija tantsija_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tantsija
    ADD CONSTRAINT tantsija_pkey PRIMARY KEY (id);


--
-- Name: tantsija_roivas tantsija_roivas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tantsija_roivas
    ADD CONSTRAINT tantsija_roivas_pkey PRIMARY KEY (id);


--
-- Name: tantsija fk3yf53jm5bn92qrh92a2oo2o3j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tantsija
    ADD CONSTRAINT fk3yf53jm5bn92qrh92a2oo2o3j FOREIGN KEY (ryhm_id) REFERENCES ryhm(id);


--
-- Name: komplekti_roivas fk5joimrc167whtkoxcsfvehboh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komplekti_roivas
    ADD CONSTRAINT fk5joimrc167whtkoxcsfvehboh FOREIGN KEY (roiva_nimi_id) REFERENCES roiva_nimi(id);


--
-- Name: komplekti_nimi fk6l8o9v4t0s32amyljlqf31e6b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komplekti_nimi
    ADD CONSTRAINT fk6l8o9v4t0s32amyljlqf31e6b FOREIGN KEY (ansambel_kood) REFERENCES ansambel(ansambel_kood);


--
-- Name: tantsija_roivas fk89ilhdy80cwpqrv6klgmjrr35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tantsija_roivas
    ADD CONSTRAINT fk89ilhdy80cwpqrv6klgmjrr35 FOREIGN KEY (roivaese_id) REFERENCES roivaese(id);


--
-- Name: tantsija_roivas fkb6ndndp2mnehm3b2d1mboqh8d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tantsija_roivas
    ADD CONSTRAINT fkb6ndndp2mnehm3b2d1mboqh8d FOREIGN KEY (ansambel_kood) REFERENCES ansambel(ansambel_kood);


--
-- Name: kasutaja fkbgsplj4sue11uumbyckw34gx3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kasutaja
    ADD CONSTRAINT fkbgsplj4sue11uumbyckw34gx3 FOREIGN KEY (roll_kood) REFERENCES kasutaja_roll(roll_kood);


--
-- Name: roiva_nimi fkcfa2cyggn92mbek5u949d8l9r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roiva_nimi
    ADD CONSTRAINT fkcfa2cyggn92mbek5u949d8l9r FOREIGN KEY (roiva_tyyp_id) REFERENCES roiva_tyyp(id);


--
-- Name: komplekti_roivas fkdv4g6ab06tg91c1e2tywq61o2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komplekti_roivas
    ADD CONSTRAINT fkdv4g6ab06tg91c1e2tywq61o2 FOREIGN KEY (ansambel_kood) REFERENCES ansambel(ansambel_kood);


--
-- Name: roiva_tyyp fkevetlt0cmpocb4ivjep0vg8c6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roiva_tyyp
    ADD CONSTRAINT fkevetlt0cmpocb4ivjep0vg8c6 FOREIGN KEY (ansambel_kood) REFERENCES ansambel(ansambel_kood);


--
-- Name: tantsija_roivas fkgyrumrjgusmqacw5522v8hfi1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tantsija_roivas
    ADD CONSTRAINT fkgyrumrjgusmqacw5522v8hfi1 FOREIGN KEY (tantsija_id) REFERENCES tantsija(id);


--
-- Name: roivaese fkhpgkp71vn5srq8uf7dh5o9k9f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roivaese
    ADD CONSTRAINT fkhpgkp71vn5srq8uf7dh5o9k9f FOREIGN KEY (roiva_tyyp_id) REFERENCES roiva_tyyp(id);


--
-- Name: ryhm fkjrgyyo5e0r0pkeqjwl6rmefaa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ryhm
    ADD CONSTRAINT fkjrgyyo5e0r0pkeqjwl6rmefaa FOREIGN KEY (ansambel_kood) REFERENCES ansambel(ansambel_kood);


--
-- Name: roiva_nimi fkm5rcnv8wjm9tce4otnjd97ngd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roiva_nimi
    ADD CONSTRAINT fkm5rcnv8wjm9tce4otnjd97ngd FOREIGN KEY (ansambel_kood) REFERENCES ansambel(ansambel_kood);


--
-- Name: tantsija fkojpmyc4xj7pjbxgq3mmflr4gm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tantsija
    ADD CONSTRAINT fkojpmyc4xj7pjbxgq3mmflr4gm FOREIGN KEY (sugu_kood) REFERENCES sugu(sugu_kood);


--
-- Name: kasutaja fkq37sycehj1blc6i1ma12dca5f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kasutaja
    ADD CONSTRAINT fkq37sycehj1blc6i1ma12dca5f FOREIGN KEY (ansambel_kood) REFERENCES ansambel(ansambel_kood);


--
-- Name: roivaese fkq86q471mh9oq5w414g5kow21v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roivaese
    ADD CONSTRAINT fkq86q471mh9oq5w414g5kow21v FOREIGN KEY (roiva_nimi_id) REFERENCES roiva_nimi(id);


--
-- Name: tantsija fkraff2lt0kofm1b94f2g691x9f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tantsija
    ADD CONSTRAINT fkraff2lt0kofm1b94f2g691x9f FOREIGN KEY (ansambel_kood) REFERENCES ansambel(ansambel_kood);


--
-- Name: komplekti_roivas fkrb3ix0i1ukysualnoku5k9dqy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komplekti_roivas
    ADD CONSTRAINT fkrb3ix0i1ukysualnoku5k9dqy FOREIGN KEY (komplekti_nimi_id) REFERENCES komplekti_nimi(id);


--
-- Name: roivaese fkrl645nnftvu972ucm0ld5m955; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roivaese
    ADD CONSTRAINT fkrl645nnftvu972ucm0ld5m955 FOREIGN KEY (ansambel_kood) REFERENCES ansambel(ansambel_kood);


--
-- PostgreSQL database dump complete
--

