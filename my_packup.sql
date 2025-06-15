--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '',moodle_development false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: manar
--

CREATE TABLE public.action_text_rich_texts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    body text,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.action_text_rich_texts OWNER TO manar;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: manar
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNER TO manar;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manar
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: manar
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO manar;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: manar
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_attachments_id_seq OWNER TO manar;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manar
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: manar
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO manar;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: manar
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_blobs_id_seq OWNER TO manar;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manar
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: manar
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO manar;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: manar
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNER TO manar;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manar
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: manar
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO manar;

--
-- Name: assignments; Type: TABLE; Schema: public; Owner: manar
--

CREATE TABLE public.assignments (
    id bigint NOT NULL,
    title character varying,
    content text,
    course_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deadline timestamp(6) without time zone,
    likes integer DEFAULT 1
);


ALTER TABLE public.assignments OWNER TO manar;

--
-- Name: assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: manar
--

CREATE SEQUENCE public.assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.assignments_id_seq OWNER TO manar;

--
-- Name: assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manar
--

ALTER SEQUENCE public.assignments_id_seq OWNED BY public.assignments.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: manar
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    student_id bigint NOT NULL,
    post_id bigint NOT NULL,
    body text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO manar;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: manar
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO manar;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manar
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: manar
--

CREATE TABLE public.courses (
    id bigint NOT NULL,
    name character varying,
    description text,
    teacher_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.courses OWNER TO manar;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: manar
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_id_seq OWNER TO manar;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manar
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: manar
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    title character varying,
    body text,
    course_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    post character varying
);


ALTER TABLE public.posts OWNER TO manar;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: manar
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO manar;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manar
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: manar
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO manar;

--
-- Name: student_courses; Type: TABLE; Schema: public; Owner: manar
--

CREATE TABLE public.student_courses (
    id bigint NOT NULL,
    student_id bigint NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.student_courses OWNER TO manar;

--
-- Name: student_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: manar
--

CREATE SEQUENCE public.student_courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_courses_id_seq OWNER TO manar;

--
-- Name: student_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manar
--

ALTER SEQUENCE public.student_courses_id_seq OWNED BY public.student_courses.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: manar
--

CREATE TABLE public.students (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name character varying
);


ALTER TABLE public.students OWNER TO manar;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: manar
--

CREATE SEQUENCE public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_id_seq OWNER TO manar;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manar
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: submissions; Type: TABLE; Schema: public; Owner: manar
--

CREATE TABLE public.submissions (
    id bigint NOT NULL,
    student_id bigint NOT NULL,
    assignment_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    title character varying
);


ALTER TABLE public.submissions OWNER TO manar;

--
-- Name: submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: manar
--

CREATE SEQUENCE public.submissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.submissions_id_seq OWNER TO manar;

--
-- Name: submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manar
--

ALTER SEQUENCE public.submissions_id_seq OWNED BY public.submissions.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: manar
--

CREATE TABLE public.teachers (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name character varying
);


ALTER TABLE public.teachers OWNER TO manar;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: manar
--

CREATE SEQUENCE public.teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_id_seq OWNER TO manar;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manar
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: assignments id; Type: DEFAULT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.assignments ALTER COLUMN id SET DEFAULT nextval('public.assignments_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: student_courses id; Type: DEFAULT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.student_courses ALTER COLUMN id SET DEFAULT nextval('public.student_courses_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: submissions id; Type: DEFAULT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.submissions ALTER COLUMN id SET DEFAULT nextval('public.submissions_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: manar
--

COPY public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at) FROM stdin;
1	content	<div>letojsos</div>	Assignment	1	2025-05-05 16:17:58.903242	2025-05-05 16:17:58.903242
2	body	<ul><li>let</li><li>djd</li><li>ddd</li></ul>	Post	1	2025-05-05 16:40:33.747217	2025-05-05 16:40:33.747217
3	content	<div>dnmnd</div>	Assignment	2	2025-05-12 08:00:29.875124	2025-05-12 08:00:29.875124
6	body		Post	4	2025-06-04 13:12:37.459542	2025-06-04 13:12:37.459542
7	body	<div>dhjjhxjxjj</div>	Post	5	2025-06-05 07:41:14.366261	2025-06-05 07:41:14.366261
8	content	<div>mkk</div>	Assignment	3	2025-06-05 07:46:29.56001	2025-06-05 07:46:29.56001
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: manar
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	avatar	Course	1	1	2025-05-05 16:17:22.017124
2	avatar	Course	5	2	2025-06-08 07:40:00.738515
3	avatar	Course	6	3	2025-06-08 08:35:26.119867
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: manar
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
1	l8n277d2kvfnyhk95wq0xpp3f32m	download.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	10137	2hC91TSx0o5TtaiMxlqGQA==	2025-05-05 16:17:22.013662
2	8htxh9r685ui8xq0sq67b9o6mzmz	Screenshot from 2025-06-04 10-19-10.png	image/png	{"identified":true,"analyzed":true}	local	12274	PCczNow9wp3lrLsmdw7vNg==	2025-06-08 07:40:00.731308
3	01cf2bur61ndcsai0fqaowvip3ct	Screenshot from 2025-06-05 14-20-06.png	image/png	{"identified":true,"analyzed":true}	local	23916	D3kjXI7ihlvUWT8woD1NFg==	2025-06-08 08:35:26.113743
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: manar
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: manar
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2025-05-05 16:14:42.027246	2025-05-05 16:14:42.027254
schema_sha1	fef00e9d94234b248590099f5c69274755b95077	2025-05-05 16:14:42.037153	2025-05-05 16:14:42.037158
\.


--
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: manar
--

COPY public.assignments (id, title, content, course_id, created_at, updated_at, deadline, likes) FROM stdin;
1	postmana	\N	1	2025-05-05 16:17:58.883537	2025-05-05 16:17:58.906275	2025-05-14 12:00:00	1
2	postmana	\N	2	2025-05-12 08:00:29.846819	2025-05-12 08:00:29.886263	2025-05-14 12:00:00	1
3	postmana	\N	4	2025-06-05 07:46:29.546232	2025-06-05 07:46:29.566229	2025-06-17 12:00:00	1
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: manar
--

COPY public.comments (id, student_id, post_id, body, created_at, updated_at) FROM stdin;
1	1	1	ddddf	2025-05-05 16:41:14.981821	2025-05-05 16:41:14.981821
2	5	1	senc comment	2025-06-08 08:05:18.103384	2025-06-08 08:05:18.103384
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: manar
--

COPY public.courses (id, name, description, teacher_id, created_at, updated_at) FROM stdin;
1	Data structure 	this course is about 	1	2025-05-05 16:17:21.984305	2025-05-05 16:17:22.122176
2	Data structure 		1	2025-05-12 07:56:23.875012	2025-05-12 07:56:23.875012
4	Data structure 		2	2025-06-04 13:11:55.189654	2025-06-04 13:11:55.189654
5	ruby on rails 	this course take you through the magic of agile web development with ROR	2	2025-06-08 07:40:00.680136	2025-06-08 07:40:01.024618
6	Data structure 		2	2025-06-08 08:35:26.087183	2025-06-08 08:35:26.287481
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: manar
--

COPY public.posts (id, title, body, course_id, created_at, updated_at, post) FROM stdin;
1	the habit of our school	\N	1	2025-05-05 16:40:33.737182	2025-05-05 16:40:33.750396	\N
4	htgfdsa	\N	4	2025-06-04 13:12:37.436181	2025-06-04 13:12:37.478949	\N
5	the habit of our school	\N	4	2025-06-05 07:41:14.343507	2025-06-05 07:41:14.372953	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: manar
--

COPY public.schema_migrations (version) FROM stdin;
20250116071419
20250115071958
20250106051104
20241204211854
20241127093637
20241127093616
20241126170120
20241126102014
20241126100614
20241124043402
20241122080351
20241122075432
20241120093311
20241120093254
20241120093110
20241120093040
20250527100711
20250527110301
20250528064856
20250529030750
20250529031054
\.


--
-- Data for Name: student_courses; Type: TABLE DATA; Schema: public; Owner: manar
--

COPY public.student_courses (id, student_id, course_id, created_at, updated_at) FROM stdin;
1	1	1	2025-05-05 16:41:04.4889	2025-05-05 16:41:04.4889
2	3	1	2025-05-28 07:01:12.53781	2025-05-28 07:01:12.53781
3	5	1	2025-06-04 08:20:22.581912	2025-06-04 08:20:22.581912
4	5	4	2025-06-07 15:21:47.228049	2025-06-07 15:21:47.228049
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: manar
--

COPY public.students (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, name) FROM stdin;
1	maneeer2006@gmail.com	$2a$12$Fkis9bENDwYRaj//alvo2uBU95cCet4gmyZzXV7Lr0WkSp5TM.gLO	\N	\N	\N	2025-05-05 16:15:23.281363	2025-05-05 16:15:23.281363	Manar Atallah
2	maneeer2007@gmail.com	$2a$12$DOSuMTfoqVQv8tbMXipJk..IlCRmjHmbDV88UnKg9cSMlR/ufUzB2	\N	\N	\N	2025-05-27 10:52:14.174728	2025-05-27 10:52:14.174728	Manar Atallah
3	ahemd@gmail.com	$2a$12$MxKZvvk.bJ7dKQlsRiNSZuklnZVOR3WxZF47IW4S8Zj5dnYBf2QnW	\N	\N	\N	2025-05-28 06:42:45.553475	2025-05-28 06:42:45.553475	ahmed
4	ahmed@gmail.com	$2a$12$4Qv..ZSZWICRIYu9EoaIEeEnnukUKKeJdU.W9gGfCCjyT/AV3RyQ2	\N	\N	\N	2025-05-29 06:50:31.030008	2025-05-29 06:50:31.030008	\N
5	majd@gmail.com	$2a$12$aGz6ogLnw9aDxvxF5HTQwOetjoEWzy8wAWepaa5JRe4UgI4DK3lAG	\N	\N	\N	2025-05-29 06:55:27.033261	2025-05-29 06:55:27.033261	\N
\.


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: manar
--

COPY public.submissions (id, student_id, assignment_id, created_at, updated_at, title) FROM stdin;
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: manar
--

COPY public.teachers (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, name) FROM stdin;
1	salma2004@gmail.com	$2a$12$hUrYdcs7nPDIklC5UuKzYuENCfpDHgAiyBVICAYlEVZDAG.riftnG	\N	\N	\N	2025-05-05 16:16:27.603665	2025-05-05 16:16:27.603665	salma
2	abed@gmail.com	$2a$12$c5oR6UDXDwKbtcvY/02sPu0g.QEb1jDZYaeObCDphOw659ZpFw/dG	\N	\N	\N	2025-05-29 06:56:24.354715	2025-05-29 06:56:24.354715	\N
\.


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: manar
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 8, true);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: manar
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 3, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: manar
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 3, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: manar
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: manar
--

SELECT pg_catalog.setval('public.assignments_id_seq', 3, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: manar
--

SELECT pg_catalog.setval('public.comments_id_seq', 2, true);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: manar
--

SELECT pg_catalog.setval('public.courses_id_seq', 6, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: manar
--

SELECT pg_catalog.setval('public.posts_id_seq', 5, true);


--
-- Name: student_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: manar
--

SELECT pg_catalog.setval('public.student_courses_id_seq', 4, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: manar
--

SELECT pg_catalog.setval('public.students_id_seq', 5, true);


--
-- Name: submissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: manar
--

SELECT pg_catalog.setval('public.submissions_id_seq', 1, false);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: manar
--

SELECT pg_catalog.setval('public.teachers_id_seq', 2, true);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: student_courses student_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.student_courses
    ADD CONSTRAINT student_courses_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: submissions submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: manar
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: manar
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: manar
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: manar
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: manar
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_assignments_on_course_id; Type: INDEX; Schema: public; Owner: manar
--

CREATE INDEX index_assignments_on_course_id ON public.assignments USING btree (course_id);


--
-- Name: index_comments_on_post_id; Type: INDEX; Schema: public; Owner: manar
--

CREATE INDEX index_comments_on_post_id ON public.comments USING btree (post_id);


--
-- Name: index_comments_on_student_id; Type: INDEX; Schema: public; Owner: manar
--

CREATE INDEX index_comments_on_student_id ON public.comments USING btree (student_id);


--
-- Name: index_courses_on_teacher_id; Type: INDEX; Schema: public; Owner: manar
--

CREATE INDEX index_courses_on_teacher_id ON public.courses USING btree (teacher_id);


--
-- Name: index_posts_on_course_id; Type: INDEX; Schema: public; Owner: manar
--

CREATE INDEX index_posts_on_course_id ON public.posts USING btree (course_id);


--
-- Name: index_student_courses_on_course_id; Type: INDEX; Schema: public; Owner: manar
--

CREATE INDEX index_student_courses_on_course_id ON public.student_courses USING btree (course_id);


--
-- Name: index_student_courses_on_student_id; Type: INDEX; Schema: public; Owner: manar
--

CREATE INDEX index_student_courses_on_student_id ON public.student_courses USING btree (student_id);


--
-- Name: index_students_on_email; Type: INDEX; Schema: public; Owner: manar
--

CREATE UNIQUE INDEX index_students_on_email ON public.students USING btree (email);


--
-- Name: index_students_on_reset_password_token; Type: INDEX; Schema: public; Owner: manar
--

CREATE UNIQUE INDEX index_students_on_reset_password_token ON public.students USING btree (reset_password_token);


--
-- Name: index_submissions_on_assignment_id; Type: INDEX; Schema: public; Owner: manar
--

CREATE INDEX index_submissions_on_assignment_id ON public.submissions USING btree (assignment_id);


--
-- Name: index_submissions_on_student_id; Type: INDEX; Schema: public; Owner: manar
--

CREATE INDEX index_submissions_on_student_id ON public.submissions USING btree (student_id);


--
-- Name: index_teachers_on_email; Type: INDEX; Schema: public; Owner: manar
--

CREATE UNIQUE INDEX index_teachers_on_email ON public.teachers USING btree (email);


--
-- Name: index_teachers_on_reset_password_token; Type: INDEX; Schema: public; Owner: manar
--

CREATE UNIQUE INDEX index_teachers_on_reset_password_token ON public.teachers USING btree (reset_password_token);


--
-- Name: submissions fk_rails_19447e9b4d; Type: FK CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT fk_rails_19447e9b4d FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: assignments fk_rails_2194c084a6; Type: FK CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT fk_rails_2194c084a6 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: comments fk_rails_2fd19c0db7; Type: FK CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_2fd19c0db7 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: submissions fk_rails_61cac0823d; Type: FK CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT fk_rails_61cac0823d FOREIGN KEY (assignment_id) REFERENCES public.assignments(id);


--
-- Name: comments fk_rails_91b6517bd0; Type: FK CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_91b6517bd0 FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: courses fk_rails_a68eff6aff; Type: FK CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_rails_a68eff6aff FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


--
-- Name: student_courses fk_rails_aab11897f1; Type: FK CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.student_courses
    ADD CONSTRAINT fk_rails_aab11897f1 FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: posts fk_rails_bceb565895; Type: FK CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_bceb565895 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: student_courses fk_rails_fee459e6de; Type: FK CONSTRAINT; Schema: public; Owner: manar
--

ALTER TABLE ONLY public.student_courses
    ADD CONSTRAINT fk_rails_fee459e6de FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- PostgreSQL database dump complete
--

