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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: invoice_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.invoice_status AS ENUM (
    'WAITING',
    'PROCESS',
    'DONE',
    'CANCEL'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id character varying(100) DEFAULT public.uuid_generate_v4() NOT NULL,
    category_name character varying(255) NOT NULL,
    company_id character varying(100) NOT NULL,
    created_at timestamp with time zone
);


--
-- Name: companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.companies (
    id character varying(100) DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    address text NOT NULL,
    image_company character varying(255) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: invoice_material_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoice_material_products (
    invoice_id character varying(100) NOT NULL,
    material_product_id character varying(100) NOT NULL,
    quantity_sold integer NOT NULL,
    company_id character varying(100) NOT NULL
);


--
-- Name: invoice_saleable_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoice_saleable_products (
    invoice_id character varying(100) NOT NULL,
    saleable_product_id character varying(100) NOT NULL,
    quantity_sold integer NOT NULL,
    company_id character varying(100) NOT NULL
);


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoices (
    id character varying(100) DEFAULT public.uuid_generate_v4() NOT NULL,
    invoice_customer character varying(255) NOT NULL,
    invoice_number character varying(255) NOT NULL,
    invoice_date timestamp with time zone NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    money_received numeric(10,2),
    status_invoice character varying(255) DEFAULT 'WAITING'::character varying NOT NULL,
    company_id character varying(100) NOT NULL,
    payment_method_id character varying(100) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: material_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.material_products (
    id character varying(100) DEFAULT public.uuid_generate_v4() NOT NULL,
    material_product_name character varying(255) NOT NULL,
    stock_type_id character varying(100) NOT NULL,
    is_available_for_sale boolean DEFAULT false NOT NULL,
    unit_price_for_selling numeric(10,2),
    total_stock integer NOT NULL,
    company_id character varying(100) NOT NULL,
    created_at timestamp with time zone
);


--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_methods (
    id character varying(100) DEFAULT public.uuid_generate_v4() NOT NULL,
    method_name character varying(255) NOT NULL,
    company_id character varying(100) NOT NULL,
    created_at timestamp with time zone
);


--
-- Name: purchase_material_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_material_products (
    purchase_id character varying(100) NOT NULL,
    material_product_id character varying(100) NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    quantity_purchase integer NOT NULL,
    company_id character varying(100) NOT NULL
);


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchases (
    id character varying(100) DEFAULT public.uuid_generate_v4() NOT NULL,
    total_purchase_amount numeric(10,2) NOT NULL,
    company_id character varying(100) NOT NULL,
    created_at timestamp with time zone
);


--
-- Name: saleable_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.saleable_products (
    id character varying(100) DEFAULT public.uuid_generate_v4() NOT NULL,
    product_name character varying(255) NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    company_id character varying(100) NOT NULL,
    category_id character varying(100) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying(128) NOT NULL
);


--
-- Name: stock_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stock_types (
    id character varying(100) DEFAULT public.uuid_generate_v4() NOT NULL,
    type_name character varying(255) NOT NULL,
    created_at timestamp with time zone
);


--
-- Name: user_companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_companies (
    user_id character varying(100) NOT NULL,
    company_id character varying(100) NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id character varying(100) DEFAULT public.uuid_generate_v4() NOT NULL,
    username character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    token character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: invoice_material_products invoice_material_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_material_products
    ADD CONSTRAINT invoice_material_products_pkey PRIMARY KEY (invoice_id, material_product_id, company_id);


--
-- Name: invoice_saleable_products invoice_saleable_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_saleable_products
    ADD CONSTRAINT invoice_saleable_products_pkey PRIMARY KEY (invoice_id, saleable_product_id, company_id);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: material_products material_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_products
    ADD CONSTRAINT material_products_pkey PRIMARY KEY (id);


--
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: purchase_material_products purchase_material_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_material_products
    ADD CONSTRAINT purchase_material_products_pkey PRIMARY KEY (purchase_id, material_product_id, company_id);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: saleable_products saleable_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saleable_products
    ADD CONSTRAINT saleable_products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stock_types stock_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_types
    ADD CONSTRAINT stock_types_pkey PRIMARY KEY (id);


--
-- Name: user_companies user_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_companies
    ADD CONSTRAINT user_companies_pkey PRIMARY KEY (user_id, company_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: categories categories_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: invoice_material_products invoice_material_products_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_material_products
    ADD CONSTRAINT invoice_material_products_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: invoice_material_products invoice_material_products_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_material_products
    ADD CONSTRAINT invoice_material_products_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoices(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: invoice_material_products invoice_material_products_material_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_material_products
    ADD CONSTRAINT invoice_material_products_material_product_id_fkey FOREIGN KEY (material_product_id) REFERENCES public.material_products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: invoice_saleable_products invoice_saleable_products_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_saleable_products
    ADD CONSTRAINT invoice_saleable_products_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: invoice_saleable_products invoice_saleable_products_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_saleable_products
    ADD CONSTRAINT invoice_saleable_products_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoices(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: invoice_saleable_products invoice_saleable_products_saleable_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_saleable_products
    ADD CONSTRAINT invoice_saleable_products_saleable_product_id_fkey FOREIGN KEY (saleable_product_id) REFERENCES public.saleable_products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: invoices invoices_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: invoices invoices_payment_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_payment_method_id_fkey FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: material_products material_products_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_products
    ADD CONSTRAINT material_products_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: material_products material_products_stock_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_products
    ADD CONSTRAINT material_products_stock_type_id_fkey FOREIGN KEY (stock_type_id) REFERENCES public.stock_types(id);


--
-- Name: payment_methods payment_methods_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: purchase_material_products purchase_material_products_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_material_products
    ADD CONSTRAINT purchase_material_products_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: purchase_material_products purchase_material_products_material_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_material_products
    ADD CONSTRAINT purchase_material_products_material_product_id_fkey FOREIGN KEY (material_product_id) REFERENCES public.material_products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: purchase_material_products purchase_material_products_purchase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_material_products
    ADD CONSTRAINT purchase_material_products_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES public.purchases(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: purchases purchases_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saleable_products saleable_products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saleable_products
    ADD CONSTRAINT saleable_products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saleable_products saleable_products_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saleable_products
    ADD CONSTRAINT saleable_products_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_companies user_companies_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_companies
    ADD CONSTRAINT user_companies_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_companies user_companies_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_companies
    ADD CONSTRAINT user_companies_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


--
-- Dbmate schema migrations
--

INSERT INTO public.schema_migrations (version) VALUES
    ('20240826081137'),
    ('20240826081138'),
    ('20240826081140'),
    ('20240826081141'),
    ('20240826081142'),
    ('20240827131058'),
    ('20240827131212'),
    ('20240827131227'),
    ('20240827131340'),
    ('20240827131451'),
    ('20240827131510'),
    ('20240827131610'),
    ('20240827131629');
