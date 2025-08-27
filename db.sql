--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    title character varying(50) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    middle_name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone_number character varying(12) NOT NULL,
    hire_date date NOT NULL,
    fk_employee_position integer,
    fk_employee_department integer
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.positions (
    position_id integer NOT NULL,
    title character varying(50) NOT NULL,
    salary_rent numeric(8,2) NOT NULL
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- Name: project_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_employee (
    project_id integer NOT NULL,
    employee_id integer NOT NULL
);


ALTER TABLE public.project_employee OWNER TO postgres;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    project_id integer NOT NULL,
    title character varying(50) NOT NULL,
    discription text,
    start_date date NOT NULL,
    end_date date NOT NULL,
    status character varying(12)
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports (
    report_id integer NOT NULL,
    report_date date NOT NULL,
    fk_report_task integer,
    fk_report_employee integer
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    task_id integer NOT NULL,
    title character varying(50) NOT NULL,
    discription text,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    status character varying(12) NOT NULL,
    priority integer
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_id, title) FROM stdin;
1	Отдел кадров
2	Отдел сбыта
3	Отдел снабжения
4	Плановый отдел
5	Бухгалтерия
6	Отдел разработки
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, last_name, first_name, middle_name, email, phone_number, hire_date, fk_employee_position, fk_employee_department) FROM stdin;
1	Гурская	Дарина	Игоревна	darina.gurskaya@gmail.com	+79641022506	2024-04-04	5	3
\.


--
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.positions (position_id, title, salary_rent) FROM stdin;
1	Директор	80000.00
2	Главный бухгалтер	60000.00
3	Менеджер	60000.00
4	Администратор	50000.00
5	Аналитик	60000.00
6	Бухгаалтер	55000.00
\.


--
-- Data for Name: project_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project_employee (project_id, employee_id) FROM stdin;
1	1
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (project_id, title, discription, start_date, end_date, status) FROM stdin;
1	Разработка мобильного приложения	Разработка мобильного приложения для улучшения взаимодействия с клиентами	2024-04-02	2024-06-02	В работе
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports (report_id, report_date, fk_report_task, fk_report_employee) FROM stdin;
1	2024-04-10	1	1
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (task_id, title, discription, start_date, end_date, status, priority) FROM stdin;
1	Анализ потребностей клиентов	Анализ потребностей клиентов и формулирование требований к функционалу приложения	2024-04-02 00:00:00	2024-04-06 00:00:00	В работе	1
2	Проектирование GUI	Проектирование пользовательского интерфейса приложения с учетом современных трендов	2024-04-10 00:00:00	2024-04-20 00:00:00	В очереди	3
3	Разработка бэкенд-части	Разработка бэкенд-части приложения для обеспечения стабильной работы и безопасности данных	2024-04-10 00:00:00	2024-05-15 00:00:00	В очереди	2
4	Создание мобильных приложений под iOS и Android	Создание мобильных приложений под iOS и Android с учетом особенностей каждой платформы	2024-04-15 00:00:00	2024-05-15 00:00:00	В очереди	2
5	Тестирование приложения	Тестирование приложения на различных устройствах и операционных системах для обеспечения высокого качества продукта	2024-05-16 00:00:00	2024-06-10 00:00:00	В очереди	4
\.


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (position_id);


--
-- Name: project_employee project_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_employee
    ADD CONSTRAINT project_employee_pkey PRIMARY KEY (project_id, employee_id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (report_id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (task_id);


--
-- Name: employees employees_fk_employee_department_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_fk_employee_department_fkey FOREIGN KEY (fk_employee_department) REFERENCES public.departments(department_id);


--
-- Name: employees employees_fk_employee_position_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_fk_employee_position_fkey FOREIGN KEY (fk_employee_position) REFERENCES public.positions(position_id);


--
-- Name: project_employee project_employee_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_employee
    ADD CONSTRAINT project_employee_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- Name: project_employee project_employee_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_employee
    ADD CONSTRAINT project_employee_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(project_id);


--
-- Name: reports reports_fk_report_employee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_fk_report_employee_fkey FOREIGN KEY (fk_report_employee) REFERENCES public.employees(employee_id);


--
-- Name: reports reports_fk_report_task_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_fk_report_task_fkey FOREIGN KEY (fk_report_task) REFERENCES public.tasks(task_id);


--
-- PostgreSQL database dump complete
--

