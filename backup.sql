--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: kyle
--

CREATE TABLE public.auth_group (
    id bigint NOT NULL,
    name text
);


ALTER TABLE public.auth_group OWNER TO kyle;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO kyle;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: kyle
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id bigint,
    permission_id bigint
);


ALTER TABLE public.auth_group_permissions OWNER TO kyle;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO kyle;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: kyle
--

CREATE TABLE public.auth_permission (
    id bigint NOT NULL,
    content_type_id bigint,
    codename text,
    name text
);


ALTER TABLE public.auth_permission OWNER TO kyle;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO kyle;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: kyle
--

CREATE TABLE public.auth_user (
    id bigint NOT NULL,
    password text,
    last_login timestamp with time zone,
    is_superuser boolean,
    username text,
    last_name text,
    email text,
    is_staff boolean,
    is_active boolean,
    date_joined timestamp with time zone,
    first_name text
);


ALTER TABLE public.auth_user OWNER TO kyle;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: kyle
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id bigint,
    group_id bigint
);


ALTER TABLE public.auth_user_groups OWNER TO kyle;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO kyle;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO kyle;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: kyle
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint,
    permission_id bigint
);


ALTER TABLE public.auth_user_user_permissions OWNER TO kyle;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO kyle;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: kyle
--

CREATE TABLE public.django_admin_log (
    id bigint NOT NULL,
    object_id text,
    object_repr text,
    action_flag smallint,
    change_message text,
    content_type_id bigint,
    user_id bigint,
    action_time timestamp with time zone
);


ALTER TABLE public.django_admin_log OWNER TO kyle;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO kyle;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: kyle
--

CREATE TABLE public.django_content_type (
    id bigint NOT NULL,
    app_label text,
    model text
);


ALTER TABLE public.django_content_type OWNER TO kyle;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO kyle;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: kyle
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app text,
    name text,
    applied timestamp with time zone
);


ALTER TABLE public.django_migrations OWNER TO kyle;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO kyle;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: kyle
--

CREATE TABLE public.django_session (
    session_key text NOT NULL,
    session_data text,
    expire_date timestamp with time zone
);


ALTER TABLE public.django_session OWNER TO kyle;

--
-- Name: tasks_preset; Type: TABLE; Schema: public; Owner: kyle
--

CREATE TABLE public.tasks_preset (
    id bigint NOT NULL,
    title text,
    description text,
    duration bigint,
    category text
);


ALTER TABLE public.tasks_preset OWNER TO kyle;

--
-- Name: tasks_preset_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE public.tasks_preset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_preset_id_seq OWNER TO kyle;

--
-- Name: tasks_preset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE public.tasks_preset_id_seq OWNED BY public.tasks_preset.id;


--
-- Name: tasks_task; Type: TABLE; Schema: public; Owner: kyle
--

CREATE TABLE public.tasks_task (
    id bigint NOT NULL,
    title text,
    description text,
    duration bigint,
    created timestamp with time zone,
    completed boolean,
    owner text,
    date_completed text
);


ALTER TABLE public.tasks_task OWNER TO kyle;

--
-- Name: tasks_task_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE public.tasks_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_task_id_seq OWNER TO kyle;

--
-- Name: tasks_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE public.tasks_task_id_seq OWNED BY public.tasks_task.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: kyle
--

CREATE TABLE public.users_user (
    id bigint NOT NULL,
    user_id text,
    display_name text,
    email text
);


ALTER TABLE public.users_user OWNER TO kyle;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO kyle;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: tasks_preset id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.tasks_preset ALTER COLUMN id SET DEFAULT nextval('public.tasks_preset_id_seq'::regclass);


--
-- Name: tasks_task id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.tasks_task ALTER COLUMN id SET DEFAULT nextval('public.tasks_task_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY public.auth_permission (id, content_type_id, codename, name) FROM stdin;
1	1	add_logentry	Can add log entry
2	1	change_logentry	Can change log entry
3	1	delete_logentry	Can delete log entry
4	1	view_logentry	Can view log entry
5	2	add_permission	Can add permission
6	2	change_permission	Can change permission
7	2	delete_permission	Can delete permission
8	2	view_permission	Can view permission
9	3	add_group	Can add group
10	3	change_group	Can change group
11	3	delete_group	Can delete group
12	3	view_group	Can view group
13	4	add_user	Can add user
14	4	change_user	Can change user
15	4	delete_user	Can delete user
16	4	view_user	Can view user
17	5	add_contenttype	Can add content type
18	5	change_contenttype	Can change content type
19	5	delete_contenttype	Can delete content type
20	5	view_contenttype	Can view content type
21	6	add_session	Can add session
22	6	change_session	Can change session
23	6	delete_session	Can delete session
24	6	view_session	Can view session
25	7	add_task	Can add task
26	7	change_task	Can change task
27	7	delete_task	Can delete task
28	7	view_task	Can view task
29	8	add_user	Can add user
30	8	change_user	Can change user
31	8	delete_user	Can delete user
32	8	view_user	Can view user
33	9	add_preset	Can add preset
34	9	change_preset	Can change preset
35	9	delete_preset	Can delete preset
36	9	view_preset	Can view preset
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY public.auth_user (id, password, last_login, is_superuser, username, last_name, email, is_staff, is_active, date_joined, first_name) FROM stdin;
1		\N	f	auth0user		ksmontville@gmail.com	f	t	2022-08-12 19:25:12.931649-04	
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY public.django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	tasks	task
8	users	user
9	tasks	preset
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-08-12 19:25:12.516967-04
2	auth	0001_initial	2022-08-12 19:25:12.542618-04
3	admin	0001_initial	2022-08-12 19:25:12.565072-04
4	admin	0002_logentry_remove_auto_add	2022-08-12 19:25:12.600251-04
5	admin	0003_logentry_add_action_flag_choices	2022-08-12 19:25:12.617906-04
6	contenttypes	0002_remove_content_type_name	2022-08-12 19:25:12.640579-04
7	auth	0002_alter_permission_name_max_length	2022-08-12 19:25:12.654373-04
8	auth	0003_alter_user_email_max_length	2022-08-12 19:25:12.667894-04
9	auth	0004_alter_user_username_opts	2022-08-12 19:25:12.682341-04
10	auth	0005_alter_user_last_login_null	2022-08-12 19:25:12.697262-04
11	auth	0006_require_contenttypes_0002	2022-08-12 19:25:12.703614-04
12	auth	0007_alter_validators_add_error_messages	2022-08-12 19:25:12.714952-04
13	auth	0008_alter_user_username_max_length	2022-08-12 19:25:12.728136-04
14	auth	0009_alter_user_last_name_max_length	2022-08-12 19:25:12.771018-04
15	auth	0010_alter_group_name_max_length	2022-08-12 19:25:12.787102-04
16	auth	0011_update_proxy_permissions	2022-08-12 19:25:12.798846-04
17	auth	0012_alter_user_first_name_max_length	2022-08-12 19:25:12.825929-04
18	sessions	0001_initial	2022-08-12 19:25:12.844315-04
19	users	0001_initial	2022-08-12 19:25:12.851411-04
20	tasks	0001_initial	2022-08-12 19:25:12.871509-04
21	tasks	0002_alter_task_duration	2022-08-12 19:25:12.88334-04
22	tasks	0003_remove_task_user	2022-08-12 19:25:12.895763-04
23	tasks	0004_task_owner	2022-08-12 19:25:12.905912-04
24	users	0002_initial	2022-08-12 19:25:12.913405-04
25	users	0003_auth0user	2022-08-12 19:25:12.933443-04
26	users	0004_delete_testmodel	2022-08-12 19:25:12.940399-04
27	users	0005_userid_auth0_id_alter_userid_user_id	2022-08-12 19:25:12.952558-04
28	users	0006_delete_userid	2022-08-12 19:25:12.959828-04
29	tasks	0005_task_date_completed	2022-08-12 20:29:11.244291-04
30	tasks	0006_alter_task_date_completed	2022-08-12 20:35:51.939519-04
31	tasks	0007_remove_task_date_completed	2022-08-12 20:44:09.944373-04
32	tasks	0008_task_date_completed	2022-08-12 20:48:21.236264-04
33	users	0007_initial	2022-08-16 19:55:44.198295-04
34	tasks	0009_preset	2022-08-23 15:36:38.492168-04
35	tasks	0010_preset_category	2022-08-23 18:16:09.433979-04
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: tasks_preset; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY public.tasks_preset (id, title, description, duration, category) FROM stdin;
5	Exercise	Exercise with intensity of your choosing, alone or with a friend	20	physical
6	Art Therapy	Create something uniquely yours using your favorite art therapy technique	30	creative
8	Journaling	Write your thoughts, feelings, goals, etc. into a brief journal entry	10	creative
9	Walking	Go for a walk in a quiet area of your choosing	20	physical
10	Meditation	Quiet reflection using a meditation technique of your choice	10	mental
11	Rest	Take some time to just wind-down and relax	20	mental
12	Conversation	Take time to have a conversation with a family member, friend, loved one, or even your pet	15	social
13	Play	For young children: uninterrupted free-play using non-digital media; For older children: do something that reminds you of a pleasant experience that you had during childhood.	30	social
14	See Your Doctor	Visit your doctor to talk about your overall well-being and address any ongoing issues	60	physical
15	Breathing	Deliberate breathing exercise of your choice	5	mental
\.


--
-- Data for Name: tasks_task; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY public.tasks_task (id, title, description, duration, created, completed, owner, date_completed) FROM stdin;
20	Exercise	Light exercise alone or with a friend.	20	2022-08-21 15:09:47.178248-04	t	auth0|62f53f57276e28eb38cee9a7	8/23/2022, 5:06:27 PM
46	Rest	Take some time to just wind-down and relax	20	2022-08-23 17:50:11.419921-04	t	auth0|62ed6112c0c6c7196cf4df7c	8/30/2022, 12:43:01 PM
48	Exercise	Exercise with intensity of your choosing, alone or with a friend	20	2022-08-23 17:52:34.557725-04	f	auth0|62ed6112c0c6c7196cf4df7c	8/30/2022, 12:00:02 PM
50	Play	For young children: uninterrupted free-play using non-digital media; For older children: do something that reminds you of a please activity you experienced during your childhood	35	2022-08-23 17:54:05.6088-04	t	auth0|62ed6112c0c6c7196cf4df7c	8/30/2022, 11:54:32 AM
56	Conversation	Take time to have a conversation with a family member, friend, loved one, or even your pet	15	2022-08-23 20:54:07.203728-04	t	auth0|62ed6112c0c6c7196cf4df7c	8/30/2022, 12:43:39 PM
62	Rest	Take some time to just wind-down and relax	20	2022-08-24 16:16:25.519927-04	f	auth0|62f53f57276e28eb38cee9a7	null
70	Walking	Go for a walk in a quiet area of your choosing	20	2022-08-24 18:14:03.418762-04	f	auth0|62f53f57276e28eb38cee9a7	null
71	See Your Doctor	Visit your doctor to talk about your overall well-being and address any ongoing issues	60	2022-08-24 20:38:42.649409-04	t	auth0|62f53f57276e28eb38cee9a7	8/25/2022, 12:45:47 PM
72	Art Therapy	Create something uniquely yours using your favorite art therapy technique	30	2022-08-25 16:36:26.241988-04	f	auth0|62f53f57276e28eb38cee9a7	null
73	Walking	Go for a walk in a quiet area of your choosing	20	2022-08-25 16:45:41.254033-04	f	auth0|62f53f57276e28eb38cee9a7	null
74	Journaling	Write your thoughts, feelings, goals, etc. into a brief journal entry	10	2022-08-25 17:05:06.930007-04	t	auth0|62ed6112c0c6c7196cf4df7c	8/30/2022, 11:54:32 AM
76	Conversation	Take time to have a conversation with a family member, friend, loved one, or even your pet	15	2022-08-30 14:39:06.546636-04	t	auth0|62ed6112c0c6c7196cf4df7c	8/30/2022, 12:02:35 PM
77	Rest	Take some time to just wind-down and relax	20	2022-08-30 16:43:55.046216-04	f	auth0|62ed6112c0c6c7196cf4df7c	null
78	Art Therapy	Create something uniquely yours using your favorite art therapy technique	30	2022-08-31 18:10:11.614343-04	f	auth0|62ed6112c0c6c7196cf4df7c	null
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY public.users_user (id, user_id, display_name, email) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);


--
-- Name: tasks_preset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('public.tasks_preset_id_seq', 15, true);


--
-- Name: tasks_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('public.tasks_task_id_seq', 78, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);


--
-- Name: django_migrations idx_29544_django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT idx_29544_django_migrations_pkey PRIMARY KEY (id);


--
-- Name: auth_group_permissions idx_29553_auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT idx_29553_auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups idx_29559_auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT idx_29559_auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions idx_29565_auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT idx_29565_auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log idx_29571_django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT idx_29571_django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type idx_29580_django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT idx_29580_django_content_type_pkey PRIMARY KEY (id);


--
-- Name: auth_permission idx_29589_auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT idx_29589_auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_group idx_29598_auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT idx_29598_auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_user idx_29607_auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT idx_29607_auth_user_pkey PRIMARY KEY (id);


--
-- Name: django_session idx_29614_sqlite_autoindex_django_session_1; Type: CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT idx_29614_sqlite_autoindex_django_session_1 PRIMARY KEY (session_key);


--
-- Name: tasks_task idx_29622_tasks_task_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.tasks_task
    ADD CONSTRAINT idx_29622_tasks_task_pkey PRIMARY KEY (id);


--
-- Name: users_user idx_29631_users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT idx_29631_users_user_pkey PRIMARY KEY (id);


--
-- Name: tasks_preset idx_29640_tasks_preset_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.tasks_preset
    ADD CONSTRAINT idx_29640_tasks_preset_pkey PRIMARY KEY (id);


--
-- Name: idx_29553_auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: kyle
--

CREATE INDEX idx_29553_auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: idx_29553_auth_group_permissions_group_id_permission_id_0cd325b; Type: INDEX; Schema: public; Owner: kyle
--

CREATE UNIQUE INDEX idx_29553_auth_group_permissions_group_id_permission_id_0cd325b ON public.auth_group_permissions USING btree (group_id, permission_id);


--
-- Name: idx_29553_auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: kyle
--

CREATE INDEX idx_29553_auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: idx_29559_auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: kyle
--

CREATE INDEX idx_29559_auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: idx_29559_auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: kyle
--

CREATE INDEX idx_29559_auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: idx_29559_auth_user_groups_user_id_group_id_94350c0c_uniq; Type: INDEX; Schema: public; Owner: kyle
--

CREATE UNIQUE INDEX idx_29559_auth_user_groups_user_id_group_id_94350c0c_uniq ON public.auth_user_groups USING btree (user_id, group_id);


--
-- Name: idx_29565_auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: kyle
--

CREATE INDEX idx_29565_auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: idx_29565_auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: kyle
--

CREATE INDEX idx_29565_auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: idx_29565_auth_user_user_permissions_user_id_permission_id_14a6; Type: INDEX; Schema: public; Owner: kyle
--

CREATE UNIQUE INDEX idx_29565_auth_user_user_permissions_user_id_permission_id_14a6 ON public.auth_user_user_permissions USING btree (user_id, permission_id);


--
-- Name: idx_29571_django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: kyle
--

CREATE INDEX idx_29571_django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: idx_29571_django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: kyle
--

CREATE INDEX idx_29571_django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: idx_29580_django_content_type_app_label_model_76bd3d3b_uniq; Type: INDEX; Schema: public; Owner: kyle
--

CREATE UNIQUE INDEX idx_29580_django_content_type_app_label_model_76bd3d3b_uniq ON public.django_content_type USING btree (app_label, model);


--
-- Name: idx_29589_auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: kyle
--

CREATE INDEX idx_29589_auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: idx_29589_auth_permission_content_type_id_codename_01ab375a_uni; Type: INDEX; Schema: public; Owner: kyle
--

CREATE UNIQUE INDEX idx_29589_auth_permission_content_type_id_codename_01ab375a_uni ON public.auth_permission USING btree (content_type_id, codename);


--
-- Name: idx_29598_sqlite_autoindex_auth_group_1; Type: INDEX; Schema: public; Owner: kyle
--

CREATE UNIQUE INDEX idx_29598_sqlite_autoindex_auth_group_1 ON public.auth_group USING btree (name);


--
-- Name: idx_29607_sqlite_autoindex_auth_user_1; Type: INDEX; Schema: public; Owner: kyle
--

CREATE UNIQUE INDEX idx_29607_sqlite_autoindex_auth_user_1 ON public.auth_user USING btree (username);


--
-- Name: idx_29614_django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: kyle
--

CREATE INDEX idx_29614_django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id);


--
-- Name: auth_group_permissions auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id);


--
-- Name: auth_permission auth_permission_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: auth_user_groups auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id);


--
-- Name: auth_user_groups auth_user_groups_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- Name: django_admin_log django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id);


--
-- Name: django_admin_log django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id);


--
-- PostgreSQL database dump complete
--

