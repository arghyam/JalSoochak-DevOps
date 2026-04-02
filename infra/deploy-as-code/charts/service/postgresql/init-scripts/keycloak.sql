--
-- PostgreSQL database dump
--

\restrict 4NO2BoMQNCfBFFST2odkd821f8zcLZOrP05sj0RqLlW51DTikQtX4JLMj64604y

-- Dumped from database version 17.7 (Ubuntu 17.7-3.pgdg24.04+1)
-- Dumped by pg_dump version 18.1 (Ubuntu 18.1-1.pgdg24.04+2)

SET statement_timeout = 0;

SET lock_timeout = 0;

SET idle_in_transaction_session_timeout = 0;

SET transaction_timeout = 0;

SET client_encoding = 'UTF8';

SET standard_conforming_strings = on;

SELECT pg_catalog.set_config ('search_path', '', false);

SET check_function_bodies = false;

SET xmloption = content;

SET client_min_messages = warning;

SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64),
    details_json text
);

ALTER TABLE public.admin_event_entity OWNER TO beehyv;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);

ALTER TABLE public.associated_policy OWNER TO beehyv;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);

ALTER TABLE public.authentication_execution OWNER TO beehyv;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);

ALTER TABLE public.authentication_flow OWNER TO beehyv;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);

ALTER TABLE public.authenticator_config OWNER TO beehyv;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);

ALTER TABLE public.authenticator_config_entry OWNER TO beehyv;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);

ALTER TABLE public.broker_link OWNER TO beehyv;

--
-- Name: client; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);

ALTER TABLE public.client OWNER TO beehyv;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);

ALTER TABLE public.client_attributes OWNER TO beehyv;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);

ALTER TABLE public.client_auth_flow_bindings OWNER TO beehyv;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);

ALTER TABLE public.client_initial_access OWNER TO beehyv;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);

ALTER TABLE public.client_node_registrations OWNER TO beehyv;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);

ALTER TABLE public.client_scope OWNER TO beehyv;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);

ALTER TABLE public.client_scope_attributes OWNER TO beehyv;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);

ALTER TABLE public.client_scope_client OWNER TO beehyv;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);

ALTER TABLE public.client_scope_role_mapping OWNER TO beehyv;

--
-- Name: component; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);

ALTER TABLE public.component OWNER TO beehyv;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);

ALTER TABLE public.component_config OWNER TO beehyv;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);

ALTER TABLE public.composite_role OWNER TO beehyv;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer,
    version integer DEFAULT 0
);

ALTER TABLE public.credential OWNER TO beehyv;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);

ALTER TABLE public.databasechangelog OWNER TO beehyv;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);

ALTER TABLE public.databasechangeloglock OWNER TO beehyv;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);

ALTER TABLE public.default_client_scope OWNER TO beehyv;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);

ALTER TABLE public.event_entity OWNER TO beehyv;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);

ALTER TABLE public.fed_user_attribute OWNER TO beehyv;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);

ALTER TABLE public.fed_user_consent OWNER TO beehyv;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);

ALTER TABLE public.fed_user_consent_cl_scope OWNER TO beehyv;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);

ALTER TABLE public.fed_user_credential OWNER TO beehyv;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);

ALTER TABLE public.fed_user_group_membership OWNER TO beehyv;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);

ALTER TABLE public.fed_user_required_action OWNER TO beehyv;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);

ALTER TABLE public.fed_user_role_mapping OWNER TO beehyv;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);

ALTER TABLE public.federated_identity OWNER TO beehyv;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);

ALTER TABLE public.federated_user OWNER TO beehyv;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);

ALTER TABLE public.group_attribute OWNER TO beehyv;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);

ALTER TABLE public.group_role_mapping OWNER TO beehyv;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL,
    organization_id character varying(255),
    hide_on_login boolean DEFAULT false
);

ALTER TABLE public.identity_provider OWNER TO beehyv;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);

ALTER TABLE public.identity_provider_config OWNER TO beehyv;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);

ALTER TABLE public.identity_provider_mapper OWNER TO beehyv;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);

ALTER TABLE public.idp_mapper_config OWNER TO beehyv;

--
-- Name: jgroups_ping; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.jgroups_ping (
    address character varying(200) NOT NULL,
    name character varying(200),
    cluster_name character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    coord boolean
);

ALTER TABLE public.jgroups_ping OWNER TO beehyv;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL,
    description character varying(255)
);

ALTER TABLE public.keycloak_group OWNER TO beehyv;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);

ALTER TABLE public.keycloak_role OWNER TO beehyv;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);

ALTER TABLE public.migration_model OWNER TO beehyv;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);

ALTER TABLE public.offline_client_session OWNER TO beehyv;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);

ALTER TABLE public.offline_user_session OWNER TO beehyv;

--
-- Name: org; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);

ALTER TABLE public.org OWNER TO beehyv;

--
-- Name: org_domain; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);

ALTER TABLE public.org_domain OWNER TO beehyv;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);

ALTER TABLE public.policy_config OWNER TO beehyv;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);

ALTER TABLE public.protocol_mapper OWNER TO beehyv;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);

ALTER TABLE public.protocol_mapper_config OWNER TO beehyv;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);

ALTER TABLE public.realm OWNER TO beehyv;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);

ALTER TABLE public.realm_attribute OWNER TO beehyv;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);

ALTER TABLE public.realm_default_groups OWNER TO beehyv;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);

ALTER TABLE public.realm_enabled_event_types OWNER TO beehyv;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);

ALTER TABLE public.realm_events_listeners OWNER TO beehyv;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);

ALTER TABLE public.realm_localizations OWNER TO beehyv;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);

ALTER TABLE public.realm_required_credential OWNER TO beehyv;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);

ALTER TABLE public.realm_smtp_config OWNER TO beehyv;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);

ALTER TABLE public.realm_supported_locales OWNER TO beehyv;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);

ALTER TABLE public.redirect_uris OWNER TO beehyv;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);

ALTER TABLE public.required_action_config OWNER TO beehyv;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);

ALTER TABLE public.required_action_provider OWNER TO beehyv;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);

ALTER TABLE public.resource_attribute OWNER TO beehyv;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);

ALTER TABLE public.resource_policy OWNER TO beehyv;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);

ALTER TABLE public.resource_scope OWNER TO beehyv;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);

ALTER TABLE public.resource_server OWNER TO beehyv;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);

ALTER TABLE public.resource_server_perm_ticket OWNER TO beehyv;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);

ALTER TABLE public.resource_server_policy OWNER TO beehyv;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);

ALTER TABLE public.resource_server_resource OWNER TO beehyv;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);

ALTER TABLE public.resource_server_scope OWNER TO beehyv;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);

ALTER TABLE public.resource_uris OWNER TO beehyv;

--
-- Name: revoked_token; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);

ALTER TABLE public.revoked_token OWNER TO beehyv;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);

ALTER TABLE public.role_attribute OWNER TO beehyv;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);

ALTER TABLE public.scope_mapping OWNER TO beehyv;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);

ALTER TABLE public.scope_policy OWNER TO beehyv;

--
-- Name: server_config; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.server_config (
    server_config_key character varying(255) NOT NULL,
    value text NOT NULL,
    version integer DEFAULT 0
);

ALTER TABLE public.server_config OWNER TO beehyv;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);

ALTER TABLE public.user_attribute OWNER TO beehyv;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);

ALTER TABLE public.user_consent OWNER TO beehyv;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);

ALTER TABLE public.user_consent_client_scope OWNER TO beehyv;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);

ALTER TABLE public.user_entity OWNER TO beehyv;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);

ALTER TABLE public.user_federation_config OWNER TO beehyv;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);

ALTER TABLE public.user_federation_mapper OWNER TO beehyv;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);

ALTER TABLE public.user_federation_mapper_config OWNER TO beehyv;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);

ALTER TABLE public.user_federation_provider OWNER TO beehyv;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
);

ALTER TABLE public.user_group_membership OWNER TO beehyv;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);

ALTER TABLE public.user_required_action OWNER TO beehyv;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);

ALTER TABLE public.user_role_mapping OWNER TO beehyv;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);

ALTER TABLE public.web_origins OWNER TO beehyv;

--
-- Name: workflow_state; Type: TABLE; Schema: public; Owner: beehyv
--

CREATE TABLE public.workflow_state (
    execution_id character varying(255) NOT NULL,
    resource_id character varying(255) NOT NULL,
    workflow_id character varying(255) NOT NULL,
    workflow_provider_id character varying(255),
    resource_type character varying(255),
    scheduled_step_id character varying(255),
    scheduled_step_timestamp bigint
);

ALTER TABLE public.workflow_state OWNER TO beehyv;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type, details_json) FROM stdin;
\.

--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.

--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
2a87c5a0-0f3c-4dd7-879e-1379b9799045	\N	auth-cookie	345a4401-4184-4713-959a-273d7f8fe7d8	a778da81-9738-4b09-8379-d45b412015a5	2	10	f	\N	\N
3679c202-4cb8-4300-984c-8a569b618f63	\N	auth-spnego	345a4401-4184-4713-959a-273d7f8fe7d8	a778da81-9738-4b09-8379-d45b412015a5	3	20	f	\N	\N
32bbbd79-4542-48da-8067-8341110243b6	\N	identity-provider-redirector	345a4401-4184-4713-959a-273d7f8fe7d8	a778da81-9738-4b09-8379-d45b412015a5	2	25	f	\N	\N
93f1ceac-a9f9-402c-a90f-a43965e81d64	\N	\N	345a4401-4184-4713-959a-273d7f8fe7d8	a778da81-9738-4b09-8379-d45b412015a5	2	30	t	f4b6967e-3036-451b-ba3b-883668716ff2	\N
1d7141b5-0a29-4004-90d7-8ee2b066ccd9	\N	auth-username-password-form	345a4401-4184-4713-959a-273d7f8fe7d8	f4b6967e-3036-451b-ba3b-883668716ff2	0	10	f	\N	\N
b5981560-42c8-48a2-a922-7938cdb17d8f	\N	\N	345a4401-4184-4713-959a-273d7f8fe7d8	f4b6967e-3036-451b-ba3b-883668716ff2	1	20	t	52538373-1391-43a4-9c91-ff947e695c0e	\N
ff54d55f-4628-44b0-84dd-834c5f83486a	\N	conditional-user-configured	345a4401-4184-4713-959a-273d7f8fe7d8	52538373-1391-43a4-9c91-ff947e695c0e	0	10	f	\N	\N
6cdb80f3-3269-4924-b0e9-c8e971cee2a2	\N	conditional-credential	345a4401-4184-4713-959a-273d7f8fe7d8	52538373-1391-43a4-9c91-ff947e695c0e	0	20	f	\N	3100a22f-9871-4669-a26a-d18dc2100730
bdb5a448-2aba-43fe-909f-e87473180540	\N	auth-otp-form	345a4401-4184-4713-959a-273d7f8fe7d8	52538373-1391-43a4-9c91-ff947e695c0e	2	30	f	\N	\N
b041790f-7410-4036-9754-dbadcc174471	\N	webauthn-authenticator	345a4401-4184-4713-959a-273d7f8fe7d8	52538373-1391-43a4-9c91-ff947e695c0e	3	40	f	\N	\N
eaddf4e0-eed7-415a-a112-67b56b1e2954	\N	auth-recovery-authn-code-form	345a4401-4184-4713-959a-273d7f8fe7d8	52538373-1391-43a4-9c91-ff947e695c0e	3	50	f	\N	\N
bfb8e1b2-f13d-431c-a8e6-1fcac0feb0c0	\N	direct-grant-validate-username	345a4401-4184-4713-959a-273d7f8fe7d8	95ecb2d5-b705-4888-9501-64f9fbac626c	0	10	f	\N	\N
c2441cda-d775-46b5-bded-913f94ed980a	\N	direct-grant-validate-password	345a4401-4184-4713-959a-273d7f8fe7d8	95ecb2d5-b705-4888-9501-64f9fbac626c	0	20	f	\N	\N
bc4bd8db-1dca-4364-a8be-907a3158cb31	\N	\N	345a4401-4184-4713-959a-273d7f8fe7d8	95ecb2d5-b705-4888-9501-64f9fbac626c	1	30	t	d6612b54-17a8-4c7c-aced-a6f556f59f06	\N
8ac4025d-0b91-4a55-a010-428ce5ddef16	\N	conditional-user-configured	345a4401-4184-4713-959a-273d7f8fe7d8	d6612b54-17a8-4c7c-aced-a6f556f59f06	0	10	f	\N	\N
d7d0c2a0-08f7-4f5d-bc97-81a232d614a3	\N	direct-grant-validate-otp	345a4401-4184-4713-959a-273d7f8fe7d8	d6612b54-17a8-4c7c-aced-a6f556f59f06	0	20	f	\N	\N
7c4a8ebb-895f-4cc8-a90f-714832c23591	\N	registration-page-form	345a4401-4184-4713-959a-273d7f8fe7d8	a380986f-9e93-409e-9249-4fa8e46a0241	0	10	t	8968e463-8167-4e94-ab83-2bd71894a5c9	\N
403982f9-4836-4e77-bb4f-fd7fad2d3062	\N	registration-user-creation	345a4401-4184-4713-959a-273d7f8fe7d8	8968e463-8167-4e94-ab83-2bd71894a5c9	0	20	f	\N	\N
3ae554d0-2dda-453f-a286-24f22a8c4bdc	\N	registration-password-action	345a4401-4184-4713-959a-273d7f8fe7d8	8968e463-8167-4e94-ab83-2bd71894a5c9	0	50	f	\N	\N
3465c112-fd99-4261-a5bd-407c4e56c453	\N	registration-recaptcha-action	345a4401-4184-4713-959a-273d7f8fe7d8	8968e463-8167-4e94-ab83-2bd71894a5c9	3	60	f	\N	\N
94c21776-33bf-432a-904b-e7ddfde3577e	\N	registration-terms-and-conditions	345a4401-4184-4713-959a-273d7f8fe7d8	8968e463-8167-4e94-ab83-2bd71894a5c9	3	70	f	\N	\N
74e32695-b33a-44e7-83e2-1d76b12d5fdf	\N	reset-credentials-choose-user	345a4401-4184-4713-959a-273d7f8fe7d8	f4f6f9fb-9806-455c-8a14-3c075e40ddb0	0	10	f	\N	\N
b4d91ce3-e4ba-4aa1-8817-9b02116e2e5e	\N	reset-credential-email	345a4401-4184-4713-959a-273d7f8fe7d8	f4f6f9fb-9806-455c-8a14-3c075e40ddb0	0	20	f	\N	\N
0c5d4285-a91c-48f4-9005-d9be4671b325	\N	reset-password	345a4401-4184-4713-959a-273d7f8fe7d8	f4f6f9fb-9806-455c-8a14-3c075e40ddb0	0	30	f	\N	\N
2f56400e-9c88-4904-8947-c351101706b1	\N	\N	345a4401-4184-4713-959a-273d7f8fe7d8	f4f6f9fb-9806-455c-8a14-3c075e40ddb0	1	40	t	8282c04b-8001-483a-9b96-29667c6bffa0	\N
a93330d2-6573-42d8-821c-13e9ab07c738	\N	conditional-user-configured	345a4401-4184-4713-959a-273d7f8fe7d8	8282c04b-8001-483a-9b96-29667c6bffa0	0	10	f	\N	\N
baa1e293-b2cd-42d4-b5ef-abc31c363cce	\N	reset-otp	345a4401-4184-4713-959a-273d7f8fe7d8	8282c04b-8001-483a-9b96-29667c6bffa0	0	20	f	\N	\N
5fabe7cb-5429-46e2-ac04-604508b4e64e	\N	client-secret	345a4401-4184-4713-959a-273d7f8fe7d8	ff9f691f-c3ac-4099-a911-9f36da168ec3	2	10	f	\N	\N
c8e609e0-a6bc-4768-a76b-303071905fdf	\N	client-jwt	345a4401-4184-4713-959a-273d7f8fe7d8	ff9f691f-c3ac-4099-a911-9f36da168ec3	2	20	f	\N	\N
2404223c-6b6a-4504-94f6-301adf30245c	\N	client-secret-jwt	345a4401-4184-4713-959a-273d7f8fe7d8	ff9f691f-c3ac-4099-a911-9f36da168ec3	2	30	f	\N	\N
fcb06453-f029-4ea7-b2a6-86760bfd57a1	\N	client-x509	345a4401-4184-4713-959a-273d7f8fe7d8	ff9f691f-c3ac-4099-a911-9f36da168ec3	2	40	f	\N	\N
f22ff727-e856-4470-a7f3-1eee00b93626	\N	idp-review-profile	345a4401-4184-4713-959a-273d7f8fe7d8	8781bdba-7fdd-4211-b6f9-df987b4c2437	0	10	f	\N	01c99dca-c894-45d9-af5d-0cc5d6252d17
34433063-d23e-4a4e-ac4a-ffef0b7a06da	\N	\N	345a4401-4184-4713-959a-273d7f8fe7d8	8781bdba-7fdd-4211-b6f9-df987b4c2437	0	20	t	b0b356f3-afcc-4f87-adda-5a908bf1c2f5	\N
861e4f41-27e0-4475-80a1-5a86e96ed291	\N	idp-create-user-if-unique	345a4401-4184-4713-959a-273d7f8fe7d8	b0b356f3-afcc-4f87-adda-5a908bf1c2f5	2	10	f	\N	f25df903-d909-4d4b-ab35-2811d6b65c77
23e819d6-1976-4158-80d8-b23573222387	\N	\N	345a4401-4184-4713-959a-273d7f8fe7d8	b0b356f3-afcc-4f87-adda-5a908bf1c2f5	2	20	t	84e99da5-bc8e-4050-ac5f-5481f3a340e8	\N
1c377414-941f-44c2-aa13-502d2000b32a	\N	idp-confirm-link	345a4401-4184-4713-959a-273d7f8fe7d8	84e99da5-bc8e-4050-ac5f-5481f3a340e8	0	10	f	\N	\N
5bb6755b-28e3-4d9e-8e6a-27c1d6d02be0	\N	\N	345a4401-4184-4713-959a-273d7f8fe7d8	84e99da5-bc8e-4050-ac5f-5481f3a340e8	0	20	t	63d7dd77-0f39-4254-9515-519985eec9f3	\N
6c9eec57-a45b-4193-a139-c4f7d429c928	\N	idp-email-verification	345a4401-4184-4713-959a-273d7f8fe7d8	63d7dd77-0f39-4254-9515-519985eec9f3	2	10	f	\N	\N
45583606-9c4f-4e84-b0cc-c045151f3ee2	\N	\N	345a4401-4184-4713-959a-273d7f8fe7d8	63d7dd77-0f39-4254-9515-519985eec9f3	2	20	t	e343b4dc-100b-49ef-a989-269199b5d24e	\N
e8bf794c-4460-4a24-9b1b-7203c7a3c6dc	\N	idp-username-password-form	345a4401-4184-4713-959a-273d7f8fe7d8	e343b4dc-100b-49ef-a989-269199b5d24e	0	10	f	\N	\N
0957485f-4e01-4c83-9131-48f89f0fd6d0	\N	\N	345a4401-4184-4713-959a-273d7f8fe7d8	e343b4dc-100b-49ef-a989-269199b5d24e	1	20	t	4e58e48f-bb6a-4608-abd2-4d5e6855e385	\N
33b958e6-87b2-4d94-bee0-111dd88b7a1d	\N	conditional-user-configured	345a4401-4184-4713-959a-273d7f8fe7d8	4e58e48f-bb6a-4608-abd2-4d5e6855e385	0	10	f	\N	\N
50199e9c-b4f3-41e6-ab66-c2addc4b6085	\N	conditional-credential	345a4401-4184-4713-959a-273d7f8fe7d8	4e58e48f-bb6a-4608-abd2-4d5e6855e385	0	20	f	\N	e89cdff9-9cb8-4c34-87d2-a7ed75c4efbc
82b98958-5e0a-4b69-a0bf-a1cc05995809	\N	auth-otp-form	345a4401-4184-4713-959a-273d7f8fe7d8	4e58e48f-bb6a-4608-abd2-4d5e6855e385	2	30	f	\N	\N
2faa84c6-c8d5-485a-8692-43ea2cc7d26f	\N	webauthn-authenticator	345a4401-4184-4713-959a-273d7f8fe7d8	4e58e48f-bb6a-4608-abd2-4d5e6855e385	3	40	f	\N	\N
fa3a2afd-4dc7-4407-89b1-852a3c4ec0c9	\N	auth-recovery-authn-code-form	345a4401-4184-4713-959a-273d7f8fe7d8	4e58e48f-bb6a-4608-abd2-4d5e6855e385	3	50	f	\N	\N
cb103928-2ad9-4212-990b-89ec57a3c61c	\N	http-basic-authenticator	345a4401-4184-4713-959a-273d7f8fe7d8	70e70625-a414-4834-8c96-2fc6807cbe0d	0	10	f	\N	\N
f46c991c-bac2-4f45-989a-9308d40dbca8	\N	docker-http-basic-authenticator	345a4401-4184-4713-959a-273d7f8fe7d8	fec0bb81-d29e-44fa-965b-22d03b0d73f1	0	10	f	\N	\N
8de0c6d3-0d93-4555-9fce-d2a597c7d310	\N	auth-cookie	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	8fdf82c8-c5c1-4db8-8c6f-369f1974bf03	2	10	f	\N	\N
5e90c99c-c5b8-422d-8117-2ec8ddae5b22	\N	auth-spnego	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	8fdf82c8-c5c1-4db8-8c6f-369f1974bf03	3	20	f	\N	\N
0e64296d-e311-49b2-ac1d-add650c10728	\N	identity-provider-redirector	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	8fdf82c8-c5c1-4db8-8c6f-369f1974bf03	2	25	f	\N	\N
a846681a-88a2-4cbf-b74d-95ddbaed203b	\N	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	8fdf82c8-c5c1-4db8-8c6f-369f1974bf03	2	30	t	609700ce-1af9-4405-ad87-15d27791aca6	\N
33d9777a-c4b9-4615-814f-48cdd2ad2efb	\N	auth-username-password-form	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	609700ce-1af9-4405-ad87-15d27791aca6	0	10	f	\N	\N
234f7449-2df2-4ad6-8137-e654a6d2350f	\N	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	609700ce-1af9-4405-ad87-15d27791aca6	1	20	t	e7f0025b-e72f-4da1-9830-c374aed24d44	\N
14a09905-819c-4a98-802f-cee32bcc261d	\N	conditional-user-configured	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	e7f0025b-e72f-4da1-9830-c374aed24d44	0	10	f	\N	\N
f6d0e160-b0ba-42c9-98e6-a4f38247dff3	\N	conditional-credential	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	e7f0025b-e72f-4da1-9830-c374aed24d44	0	20	f	\N	34f19db8-9620-4057-8a32-8a0706498c76
e05f3389-9313-47d8-9b79-01d5a3e7dd45	\N	auth-otp-form	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	e7f0025b-e72f-4da1-9830-c374aed24d44	2	30	f	\N	\N
d34e11c1-22ec-4e10-af68-1b9cbda4f332	\N	webauthn-authenticator	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	e7f0025b-e72f-4da1-9830-c374aed24d44	3	40	f	\N	\N
357412cf-fdf1-45da-8c2a-bef9acfd303c	\N	auth-recovery-authn-code-form	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	e7f0025b-e72f-4da1-9830-c374aed24d44	3	50	f	\N	\N
232615ba-4dbb-43bc-a155-ed2bbb58635b	\N	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	8fdf82c8-c5c1-4db8-8c6f-369f1974bf03	2	26	t	591abbd1-f44b-4560-bcab-e4d710a2d8c5	\N
e778fcce-7843-4bba-895d-0ae6a3492414	\N	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	591abbd1-f44b-4560-bcab-e4d710a2d8c5	1	10	t	5622365a-c414-4d65-98a2-83680c1684ad	\N
4b099491-e3d5-43e1-9df1-7c2ca9518b67	\N	conditional-user-configured	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	5622365a-c414-4d65-98a2-83680c1684ad	0	10	f	\N	\N
df9f9bc1-42a7-47e1-b7cc-165ef7626572	\N	organization	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	5622365a-c414-4d65-98a2-83680c1684ad	2	20	f	\N	\N
ad943a8c-3e31-4126-afc6-5c68e67801d7	\N	direct-grant-validate-username	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	af659bd1-44b9-418f-b69e-e1d66031aee8	0	10	f	\N	\N
796e52c0-edc6-4714-9acd-a8e08fb6c38f	\N	direct-grant-validate-password	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	af659bd1-44b9-418f-b69e-e1d66031aee8	0	20	f	\N	\N
688e5fef-a33a-4f6e-b258-55734423ebb7	\N	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	af659bd1-44b9-418f-b69e-e1d66031aee8	1	30	t	866f481e-3c0d-4739-8ab1-0d95da3e8bcd	\N
3b0e35da-5d25-4d6f-837b-e467258589fd	\N	conditional-user-configured	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	866f481e-3c0d-4739-8ab1-0d95da3e8bcd	0	10	f	\N	\N
604b3e98-40a3-4e23-b7be-12074dcf2883	\N	direct-grant-validate-otp	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	866f481e-3c0d-4739-8ab1-0d95da3e8bcd	0	20	f	\N	\N
d438a656-bdf9-4d29-b911-fbbe7884b5e6	\N	registration-page-form	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	fea1c426-4f9d-4238-91b1-f949f50a5630	0	10	t	14cdd600-8435-4873-9c17-5b440523618c	\N
c3a9ae42-0e0e-4de0-a07e-cd209c4f08a1	\N	registration-user-creation	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	14cdd600-8435-4873-9c17-5b440523618c	0	20	f	\N	\N
0176dbb1-e4e3-48b2-a668-f7fd856c51a2	\N	registration-password-action	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	14cdd600-8435-4873-9c17-5b440523618c	0	50	f	\N	\N
07f99fd1-94dc-4b2f-96f1-26bedc93a6cc	\N	registration-recaptcha-action	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	14cdd600-8435-4873-9c17-5b440523618c	3	60	f	\N	\N
48162856-56d4-4374-ada3-ecca47e6018d	\N	registration-terms-and-conditions	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	14cdd600-8435-4873-9c17-5b440523618c	3	70	f	\N	\N
2b330244-86f6-46d9-a585-fbb3d0a3873d	\N	reset-credentials-choose-user	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	3e0631da-ead5-4e98-b3d6-0f7cd1458e69	0	10	f	\N	\N
556953d4-2be3-49b1-9ccb-f52ee19f6966	\N	reset-credential-email	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	3e0631da-ead5-4e98-b3d6-0f7cd1458e69	0	20	f	\N	\N
9cfce2f0-2fde-4510-abb0-23d8eea0482c	\N	reset-password	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	3e0631da-ead5-4e98-b3d6-0f7cd1458e69	0	30	f	\N	\N
bd5f8567-1be1-4430-9845-fa5ecdb7189b	\N	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	3e0631da-ead5-4e98-b3d6-0f7cd1458e69	1	40	t	8f2310ef-b30e-401c-86a6-410fa804c12d	\N
1b9cdc3d-d344-4a42-ace6-4c63701139c0	\N	conditional-user-configured	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	8f2310ef-b30e-401c-86a6-410fa804c12d	0	10	f	\N	\N
329838f9-be9b-48ba-b588-7e9bd689366e	\N	reset-otp	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	8f2310ef-b30e-401c-86a6-410fa804c12d	0	20	f	\N	\N
6811cbfb-8bc6-4695-9305-02ebc1a2c75e	\N	client-secret	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	4731c60b-0891-49a3-b9bd-c8891fb42e5f	2	10	f	\N	\N
d10769de-bf88-4c55-bf56-bee2de67cda0	\N	client-jwt	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	4731c60b-0891-49a3-b9bd-c8891fb42e5f	2	20	f	\N	\N
5aff23d2-3694-4449-bc06-61ef221c067c	\N	client-secret-jwt	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	4731c60b-0891-49a3-b9bd-c8891fb42e5f	2	30	f	\N	\N
9b1b277b-57ed-4ed0-8f7d-8cb504bd2239	\N	client-x509	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	4731c60b-0891-49a3-b9bd-c8891fb42e5f	2	40	f	\N	\N
daac4fe3-5a0a-4902-9df6-50f8d4718061	\N	idp-review-profile	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	c9f1e64a-6925-45c5-a6f7-c00f78dd5d5f	0	10	f	\N	c9ea456f-4409-47ce-9abb-eb59ad4d2b33
eb68a469-681d-4c30-9743-a411bdbead4c	\N	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	c9f1e64a-6925-45c5-a6f7-c00f78dd5d5f	0	20	t	9ba3db46-cee1-4922-abec-1fe999c2dec0	\N
69c24460-9367-406e-872e-fd85293b4fcb	\N	idp-create-user-if-unique	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	9ba3db46-cee1-4922-abec-1fe999c2dec0	2	10	f	\N	bd22b0e6-3a6f-4970-9bc7-cab190128c6c
896b0811-46b8-4af2-beb3-957ed1b9a8f1	\N	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	9ba3db46-cee1-4922-abec-1fe999c2dec0	2	20	t	61bd6be2-9aee-4f15-bd69-d7857754799e	\N
b0777d2b-dddc-4010-b58a-626fbf43058b	\N	idp-confirm-link	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	61bd6be2-9aee-4f15-bd69-d7857754799e	0	10	f	\N	\N
778c300d-950d-4e8e-8d2f-6c166b0baec3	\N	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	61bd6be2-9aee-4f15-bd69-d7857754799e	0	20	t	16c72b10-5f1c-459f-8c17-3f91994a1d69	\N
c1e7c936-ad13-4a7a-b51c-5d2140e95a25	\N	idp-email-verification	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	16c72b10-5f1c-459f-8c17-3f91994a1d69	2	10	f	\N	\N
5dd145a2-210e-4fc9-a861-9d2c92bcfd14	\N	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	16c72b10-5f1c-459f-8c17-3f91994a1d69	2	20	t	b1cf6d0d-efdf-4100-af17-75d9ba334b3a	\N
f293eb7a-fc23-4de4-8ede-74fa397d6d0d	\N	idp-username-password-form	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	b1cf6d0d-efdf-4100-af17-75d9ba334b3a	0	10	f	\N	\N
994ff4b0-d360-4e28-884d-54f0e646f2b9	\N	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	b1cf6d0d-efdf-4100-af17-75d9ba334b3a	1	20	t	3675fab9-d39a-4317-a438-890a1a4a0c2b	\N
30ecdd21-1feb-42b6-9b80-fe6073c49028	\N	conditional-user-configured	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	3675fab9-d39a-4317-a438-890a1a4a0c2b	0	10	f	\N	\N
ac9c65c9-ef8a-4cd8-ac87-71d1a57cdd4c	\N	conditional-credential	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	3675fab9-d39a-4317-a438-890a1a4a0c2b	0	20	f	\N	97206320-1c97-48a4-bd97-a6bb0f2e7a9b
e5d5d9cd-e8a1-4217-b0c6-273f56c8d1f2	\N	auth-otp-form	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	3675fab9-d39a-4317-a438-890a1a4a0c2b	2	30	f	\N	\N
bb7c4aaa-1da6-4734-8a4a-887f983539c5	\N	webauthn-authenticator	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	3675fab9-d39a-4317-a438-890a1a4a0c2b	3	40	f	\N	\N
1204fec6-c723-4e7f-886f-de590b7474af	\N	auth-recovery-authn-code-form	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	3675fab9-d39a-4317-a438-890a1a4a0c2b	3	50	f	\N	\N
e092128e-8099-4209-b21a-1090d048d2c2	\N	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	c9f1e64a-6925-45c5-a6f7-c00f78dd5d5f	1	60	t	fb9fd8e1-ab18-4995-a11b-2b8fc5cbafee	\N
dd3b0803-f7cc-4cf2-8256-39a5feeb9560	\N	conditional-user-configured	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	fb9fd8e1-ab18-4995-a11b-2b8fc5cbafee	0	10	f	\N	\N
657d2eae-7c58-4a39-8514-eff1a07aace3	\N	idp-add-organization-member	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	fb9fd8e1-ab18-4995-a11b-2b8fc5cbafee	0	20	f	\N	\N
072ee2cf-070e-4329-8f17-e6387d202684	\N	http-basic-authenticator	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	678ab1f4-7d97-4eee-9ca6-ea2c1ac4d643	0	10	f	\N	\N
7a3acc3a-037b-495e-9888-5684d5b42744	\N	docker-http-basic-authenticator	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	0a2087dd-8e69-4635-9320-4ae71bfb63aa	0	10	f	\N	\N
\.

--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
a778da81-9738-4b09-8379-d45b412015a5	browser	Browser based authentication	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	t	t
f4b6967e-3036-451b-ba3b-883668716ff2	forms	Username, password, otp and other auth forms.	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	f	t
52538373-1391-43a4-9c91-ff947e695c0e	Browser - Conditional 2FA	Flow to determine if any 2FA is required for the authentication	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	f	t
95ecb2d5-b705-4888-9501-64f9fbac626c	direct grant	OpenID Connect Resource Owner Grant	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	t	t
d6612b54-17a8-4c7c-aced-a6f556f59f06	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	f	t
a380986f-9e93-409e-9249-4fa8e46a0241	registration	Registration flow	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	t	t
8968e463-8167-4e94-ab83-2bd71894a5c9	registration form	Registration form	345a4401-4184-4713-959a-273d7f8fe7d8	form-flow	f	t
f4f6f9fb-9806-455c-8a14-3c075e40ddb0	reset credentials	Reset credentials for a user if they forgot their password or something	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	t	t
8282c04b-8001-483a-9b96-29667c6bffa0	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	f	t
ff9f691f-c3ac-4099-a911-9f36da168ec3	clients	Base authentication for clients	345a4401-4184-4713-959a-273d7f8fe7d8	client-flow	t	t
8781bdba-7fdd-4211-b6f9-df987b4c2437	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	t	t
b0b356f3-afcc-4f87-adda-5a908bf1c2f5	User creation or linking	Flow for the existing/non-existing user alternatives	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	f	t
84e99da5-bc8e-4050-ac5f-5481f3a340e8	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	f	t
63d7dd77-0f39-4254-9515-519985eec9f3	Account verification options	Method with which to verity the existing account	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	f	t
e343b4dc-100b-49ef-a989-269199b5d24e	Verify Existing Account by Re-authentication	Reauthentication of existing account	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	f	t
4e58e48f-bb6a-4608-abd2-4d5e6855e385	First broker login - Conditional 2FA	Flow to determine if any 2FA is required for the authentication	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	f	t
70e70625-a414-4834-8c96-2fc6807cbe0d	saml ecp	SAML ECP Profile Authentication Flow	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	t	t
fec0bb81-d29e-44fa-965b-22d03b0d73f1	docker auth	Used by Docker clients to authenticate against the IDP	345a4401-4184-4713-959a-273d7f8fe7d8	basic-flow	t	t
8fdf82c8-c5c1-4db8-8c6f-369f1974bf03	browser	Browser based authentication	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	t	t
609700ce-1af9-4405-ad87-15d27791aca6	forms	Username, password, otp and other auth forms.	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	f	t
e7f0025b-e72f-4da1-9830-c374aed24d44	Browser - Conditional 2FA	Flow to determine if any 2FA is required for the authentication	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	f	t
591abbd1-f44b-4560-bcab-e4d710a2d8c5	Organization	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	f	t
5622365a-c414-4d65-98a2-83680c1684ad	Browser - Conditional Organization	Flow to determine if the organization identity-first login is to be used	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	f	t
af659bd1-44b9-418f-b69e-e1d66031aee8	direct grant	OpenID Connect Resource Owner Grant	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	t	t
866f481e-3c0d-4739-8ab1-0d95da3e8bcd	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	f	t
fea1c426-4f9d-4238-91b1-f949f50a5630	registration	Registration flow	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	t	t
14cdd600-8435-4873-9c17-5b440523618c	registration form	Registration form	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	form-flow	f	t
3e0631da-ead5-4e98-b3d6-0f7cd1458e69	reset credentials	Reset credentials for a user if they forgot their password or something	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	t	t
8f2310ef-b30e-401c-86a6-410fa804c12d	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	f	t
4731c60b-0891-49a3-b9bd-c8891fb42e5f	clients	Base authentication for clients	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	client-flow	t	t
c9f1e64a-6925-45c5-a6f7-c00f78dd5d5f	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	t	t
9ba3db46-cee1-4922-abec-1fe999c2dec0	User creation or linking	Flow for the existing/non-existing user alternatives	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	f	t
61bd6be2-9aee-4f15-bd69-d7857754799e	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	f	t
16c72b10-5f1c-459f-8c17-3f91994a1d69	Account verification options	Method with which to verity the existing account	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	f	t
b1cf6d0d-efdf-4100-af17-75d9ba334b3a	Verify Existing Account by Re-authentication	Reauthentication of existing account	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	f	t
3675fab9-d39a-4317-a438-890a1a4a0c2b	First broker login - Conditional 2FA	Flow to determine if any 2FA is required for the authentication	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	f	t
fb9fd8e1-ab18-4995-a11b-2b8fc5cbafee	First Broker Login - Conditional Organization	Flow to determine if the authenticator that adds organization members is to be used	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	f	t
678ab1f4-7d97-4eee-9ca6-ea2c1ac4d643	saml ecp	SAML ECP Profile Authentication Flow	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	t	t
0a2087dd-8e69-4635-9320-4ae71bfb63aa	docker auth	Used by Docker clients to authenticate against the IDP	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	basic-flow	t	t
\.

--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
3100a22f-9871-4669-a26a-d18dc2100730	browser-conditional-credential	345a4401-4184-4713-959a-273d7f8fe7d8
01c99dca-c894-45d9-af5d-0cc5d6252d17	review profile config	345a4401-4184-4713-959a-273d7f8fe7d8
f25df903-d909-4d4b-ab35-2811d6b65c77	create unique user config	345a4401-4184-4713-959a-273d7f8fe7d8
e89cdff9-9cb8-4c34-87d2-a7ed75c4efbc	first-broker-login-conditional-credential	345a4401-4184-4713-959a-273d7f8fe7d8
34f19db8-9620-4057-8a32-8a0706498c76	browser-conditional-credential	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac
c9ea456f-4409-47ce-9abb-eb59ad4d2b33	review profile config	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac
bd22b0e6-3a6f-4970-9bc7-cab190128c6c	create unique user config	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac
97206320-1c97-48a4-bd97-a6bb0f2e7a9b	first-broker-login-conditional-credential	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac
\.

--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
01c99dca-c894-45d9-af5d-0cc5d6252d17	missing	update.profile.on.first.login
3100a22f-9871-4669-a26a-d18dc2100730	webauthn-passwordless	credentials
e89cdff9-9cb8-4c34-87d2-a7ed75c4efbc	webauthn-passwordless	credentials
f25df903-d909-4d4b-ab35-2811d6b65c77	false	require.password.update.after.registration
34f19db8-9620-4057-8a32-8a0706498c76	webauthn-passwordless	credentials
97206320-1c97-48a4-bd97-a6bb0f2e7a9b	webauthn-passwordless	credentials
bd22b0e6-3a6f-4970-9bc7-cab190128c6c	false	require.password.update.after.registration
c9ea456f-4409-47ce-9abb-eb59ad4d2b33	missing	update.profile.on.first.login
\.

--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.

--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
0882bff5-d2f7-42ed-bae0-181c59835dfa	t	f	master-realm	0	f	\N	\N	t	\N	f	345a4401-4184-4713-959a-273d7f8fe7d8	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	345a4401-4184-4713-959a-273d7f8fe7d8	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	345a4401-4184-4713-959a-273d7f8fe7d8	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
d571bab1-a113-458c-a963-a83900f6b6b9	t	f	broker	0	f	\N	\N	t	\N	f	345a4401-4184-4713-959a-273d7f8fe7d8	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
c75ada75-7228-463d-81bc-2d96e1253ae5	t	t	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	345a4401-4184-4713-959a-273d7f8fe7d8	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
b9ef6f30-8f8f-4e8d-8631-705843a1537b	t	t	admin-cli	0	t	\N	\N	f	\N	f	345a4401-4184-4713-959a-273d7f8fe7d8	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
70e4395b-86b7-497b-bd41-236eac2aad6b	t	f	realm-management	0	f	\N	\N	t	\N	f	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
671898bc-9014-4cbc-ab63-604fb1767d16	t	t	jalsoochak-admin	0	f	JNJtIjAVpEOrIsLl3MUfBVF3ryxgmFmX		f		f	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	openid-connect	-1	t	f		t	client-secret			\N	f	f	t	f
5c6d446d-0355-4b2c-8746-ae46f20420e6	t	f	broker	0	f	\N	\N	t	\N	f	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
c676ddcd-1d0c-418b-aff2-690fe19a9fb3	t	t	admin-cli	0	t	\N	\N	f	\N	f	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
8a864bd5-419a-4390-b42f-512d78d23e8a	t	f	admin-permissions	0	f	\N	\N	f	\N	f	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	openid-connect	0	f	f	\N	t	\N	\N	\N	\N	t	f	f	f
549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	f	jalsoochak-realm-realm	0	f	\N	\N	t	\N	f	345a4401-4184-4713-959a-273d7f8fe7d8	\N	0	f	f	jalsoochak-system Realm	f	client-secret	\N	\N	\N	t	f	f	f
2a74862e-2165-4e23-aec8-daa79e9ddcd1	t	t	security-admin-console	0	t	\N	/admin/jalsoochak-realm/console/	f	\N	f	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
b627e058-48c9-4c24-a3c1-4e678e99c1e1	t	f	account	0	t	\N	/realms/jalsoochak-realm/account/	f	\N	f	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
e6be4642-3e50-4ec2-8531-7f97846e3e1b	t	f	account-console	0	t	\N	/realms/jalsoochak-realm/account/	f	\N	f	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
eaf18766-7489-4693-a788-95fe5a56096a	t	t	jalsoochak-app	0	f	UKBsKQSzHugqfGKHNvdlvdQJ96WScTFJ		f		f	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	openid-connect	-1	t	f	Jalsoochak	f	client-secret			\N	t	f	t	f
\.

--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.client_attributes (client_id, name, value) FROM stdin;
ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	post.logout.redirect.uris	+
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	post.logout.redirect.uris	+
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	pkce.code.challenge.method	S256
c75ada75-7228-463d-81bc-2d96e1253ae5	post.logout.redirect.uris	+
c75ada75-7228-463d-81bc-2d96e1253ae5	pkce.code.challenge.method	S256
c75ada75-7228-463d-81bc-2d96e1253ae5	client.use.lightweight.access.token.enabled	true
b9ef6f30-8f8f-4e8d-8631-705843a1537b	client.use.lightweight.access.token.enabled	true
b627e058-48c9-4c24-a3c1-4e678e99c1e1	post.logout.redirect.uris	+
e6be4642-3e50-4ec2-8531-7f97846e3e1b	post.logout.redirect.uris	+
e6be4642-3e50-4ec2-8531-7f97846e3e1b	pkce.code.challenge.method	S256
2a74862e-2165-4e23-aec8-daa79e9ddcd1	post.logout.redirect.uris	+
2a74862e-2165-4e23-aec8-daa79e9ddcd1	pkce.code.challenge.method	S256
2a74862e-2165-4e23-aec8-daa79e9ddcd1	client.use.lightweight.access.token.enabled	true
c676ddcd-1d0c-418b-aff2-690fe19a9fb3	client.use.lightweight.access.token.enabled	true
eaf18766-7489-4693-a788-95fe5a56096a	client.secret.creation.time	1772786012
eaf18766-7489-4693-a788-95fe5a56096a	standard.token.exchange.enabled	false
eaf18766-7489-4693-a788-95fe5a56096a	oauth2.device.authorization.grant.enabled	false
eaf18766-7489-4693-a788-95fe5a56096a	oidc.ciba.grant.enabled	false
eaf18766-7489-4693-a788-95fe5a56096a	dpop.bound.access.tokens	false
eaf18766-7489-4693-a788-95fe5a56096a	backchannel.logout.session.required	true
eaf18766-7489-4693-a788-95fe5a56096a	backchannel.logout.revoke.offline.tokens	false
671898bc-9014-4cbc-ab63-604fb1767d16	client.secret.creation.time	1772786226
671898bc-9014-4cbc-ab63-604fb1767d16	standard.token.exchange.enabled	false
671898bc-9014-4cbc-ab63-604fb1767d16	oauth2.device.authorization.grant.enabled	false
671898bc-9014-4cbc-ab63-604fb1767d16	oidc.ciba.grant.enabled	false
671898bc-9014-4cbc-ab63-604fb1767d16	dpop.bound.access.tokens	false
671898bc-9014-4cbc-ab63-604fb1767d16	backchannel.logout.session.required	true
671898bc-9014-4cbc-ab63-604fb1767d16	backchannel.logout.revoke.offline.tokens	false
671898bc-9014-4cbc-ab63-604fb1767d16	realm_client	false
671898bc-9014-4cbc-ab63-604fb1767d16	display.on.consent.screen	false
671898bc-9014-4cbc-ab63-604fb1767d16	frontchannel.logout.session.required	true
eaf18766-7489-4693-a788-95fe5a56096a	realm_client	false
eaf18766-7489-4693-a788-95fe5a56096a	display.on.consent.screen	false
eaf18766-7489-4693-a788-95fe5a56096a	frontchannel.logout.session.required	true
671898bc-9014-4cbc-ab63-604fb1767d16	use.jwks.url	false
\.

--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.

--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.

--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.

--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
279cd9ad-27d4-41d0-a41f-deb236e5eb7e	offline_access	345a4401-4184-4713-959a-273d7f8fe7d8	OpenID Connect built-in scope: offline_access	openid-connect
e169428c-8210-485d-b4d6-51ac0508a7a7	role_list	345a4401-4184-4713-959a-273d7f8fe7d8	SAML role list	saml
9de0f3c1-94e4-4b37-9be6-290e9e70dbb1	saml_organization	345a4401-4184-4713-959a-273d7f8fe7d8	Organization Membership	saml
c6ef5496-9ea3-4061-a2e7-f5839ebc93f6	profile	345a4401-4184-4713-959a-273d7f8fe7d8	OpenID Connect built-in scope: profile	openid-connect
3aaec0aa-6d5f-4383-bd0e-64d449f0f4ad	email	345a4401-4184-4713-959a-273d7f8fe7d8	OpenID Connect built-in scope: email	openid-connect
ba7666c5-bd3a-4216-a1b3-6b8e0618db50	address	345a4401-4184-4713-959a-273d7f8fe7d8	OpenID Connect built-in scope: address	openid-connect
c98d8ab5-3ed4-41c4-8ab9-711dd26fedf9	phone	345a4401-4184-4713-959a-273d7f8fe7d8	OpenID Connect built-in scope: phone	openid-connect
7670374c-38c8-4ce1-afc7-3233d6c5afb7	roles	345a4401-4184-4713-959a-273d7f8fe7d8	OpenID Connect scope for add user roles to the access token	openid-connect
23ab64b0-6621-4890-8a67-546712a626cc	web-origins	345a4401-4184-4713-959a-273d7f8fe7d8	OpenID Connect scope for add allowed web origins to the access token	openid-connect
dbd5c158-6752-4bfd-b55d-0ff621d0255c	microprofile-jwt	345a4401-4184-4713-959a-273d7f8fe7d8	Microprofile - JWT built-in scope	openid-connect
fe482c73-148f-419e-9019-51fb4bed5502	acr	345a4401-4184-4713-959a-273d7f8fe7d8	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
6a70d0f6-8746-4464-b5aa-d9ec7bd8c011	basic	345a4401-4184-4713-959a-273d7f8fe7d8	OpenID Connect scope for add all basic claims to the token	openid-connect
b65c9fc0-d67a-43a9-b07e-35aeb20529f0	service_account	345a4401-4184-4713-959a-273d7f8fe7d8	Specific scope for a client enabled for service accounts	openid-connect
2434b2c5-1e4e-4d85-9222-922081123890	organization	345a4401-4184-4713-959a-273d7f8fe7d8	Additional claims about the organization a subject belongs to	openid-connect
17fa8a05-6fa4-4260-b3e6-cd827d25060f	offline_access	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	OpenID Connect built-in scope: offline_access	openid-connect
cef7df65-ceb0-412e-8b66-0e91eeaff99e	role_list	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	SAML role list	saml
3afb8b4f-6aae-4fa9-b985-ee63be61d8c8	saml_organization	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	Organization Membership	saml
4753d207-1667-426f-b578-a14ef8e62c3e	profile	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	OpenID Connect built-in scope: profile	openid-connect
e8f77819-59bf-46fc-925b-895b1ad6afa8	email	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	OpenID Connect built-in scope: email	openid-connect
8c09b9cd-6516-46d9-8beb-6bc5dbffde0e	address	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	OpenID Connect built-in scope: address	openid-connect
1849dac8-8a3a-4083-9897-bca83c73e5e0	phone	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	OpenID Connect built-in scope: phone	openid-connect
7d3ccd02-8d97-4481-a0a8-09fc972bde94	roles	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	OpenID Connect scope for add user roles to the access token	openid-connect
a1118fdc-93e8-46be-a9c5-d3c8daad7426	web-origins	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	OpenID Connect scope for add allowed web origins to the access token	openid-connect
55d2d135-58ec-41e8-9b67-32add6ca139a	microprofile-jwt	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	Microprofile - JWT built-in scope	openid-connect
52f7182c-9781-40dc-957d-03d402db06da	acr	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
3e08b33b-8105-4f3c-879d-dcecca0be295	basic	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	OpenID Connect scope for add all basic claims to the token	openid-connect
19317eab-83fc-4cf8-a0a2-228239c25d4a	service_account	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	Specific scope for a client enabled for service accounts	openid-connect
0f708434-54d7-4362-b40d-68ad95fc14f5	organization	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	Additional claims about the organization a subject belongs to	openid-connect
\.

--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
279cd9ad-27d4-41d0-a41f-deb236e5eb7e	true	display.on.consent.screen
279cd9ad-27d4-41d0-a41f-deb236e5eb7e	${offlineAccessScopeConsentText}	consent.screen.text
e169428c-8210-485d-b4d6-51ac0508a7a7	true	display.on.consent.screen
e169428c-8210-485d-b4d6-51ac0508a7a7	${samlRoleListScopeConsentText}	consent.screen.text
9de0f3c1-94e4-4b37-9be6-290e9e70dbb1	false	display.on.consent.screen
c6ef5496-9ea3-4061-a2e7-f5839ebc93f6	true	display.on.consent.screen
c6ef5496-9ea3-4061-a2e7-f5839ebc93f6	${profileScopeConsentText}	consent.screen.text
c6ef5496-9ea3-4061-a2e7-f5839ebc93f6	true	include.in.token.scope
3aaec0aa-6d5f-4383-bd0e-64d449f0f4ad	true	display.on.consent.screen
3aaec0aa-6d5f-4383-bd0e-64d449f0f4ad	${emailScopeConsentText}	consent.screen.text
3aaec0aa-6d5f-4383-bd0e-64d449f0f4ad	true	include.in.token.scope
ba7666c5-bd3a-4216-a1b3-6b8e0618db50	true	display.on.consent.screen
ba7666c5-bd3a-4216-a1b3-6b8e0618db50	${addressScopeConsentText}	consent.screen.text
ba7666c5-bd3a-4216-a1b3-6b8e0618db50	true	include.in.token.scope
c98d8ab5-3ed4-41c4-8ab9-711dd26fedf9	true	display.on.consent.screen
c98d8ab5-3ed4-41c4-8ab9-711dd26fedf9	${phoneScopeConsentText}	consent.screen.text
c98d8ab5-3ed4-41c4-8ab9-711dd26fedf9	true	include.in.token.scope
7670374c-38c8-4ce1-afc7-3233d6c5afb7	true	display.on.consent.screen
7670374c-38c8-4ce1-afc7-3233d6c5afb7	${rolesScopeConsentText}	consent.screen.text
7670374c-38c8-4ce1-afc7-3233d6c5afb7	false	include.in.token.scope
23ab64b0-6621-4890-8a67-546712a626cc	false	display.on.consent.screen
23ab64b0-6621-4890-8a67-546712a626cc		consent.screen.text
23ab64b0-6621-4890-8a67-546712a626cc	false	include.in.token.scope
dbd5c158-6752-4bfd-b55d-0ff621d0255c	false	display.on.consent.screen
dbd5c158-6752-4bfd-b55d-0ff621d0255c	true	include.in.token.scope
fe482c73-148f-419e-9019-51fb4bed5502	false	display.on.consent.screen
fe482c73-148f-419e-9019-51fb4bed5502	false	include.in.token.scope
6a70d0f6-8746-4464-b5aa-d9ec7bd8c011	false	display.on.consent.screen
6a70d0f6-8746-4464-b5aa-d9ec7bd8c011	false	include.in.token.scope
b65c9fc0-d67a-43a9-b07e-35aeb20529f0	false	display.on.consent.screen
b65c9fc0-d67a-43a9-b07e-35aeb20529f0	false	include.in.token.scope
2434b2c5-1e4e-4d85-9222-922081123890	true	display.on.consent.screen
2434b2c5-1e4e-4d85-9222-922081123890	${organizationScopeConsentText}	consent.screen.text
2434b2c5-1e4e-4d85-9222-922081123890	true	include.in.token.scope
17fa8a05-6fa4-4260-b3e6-cd827d25060f	true	display.on.consent.screen
17fa8a05-6fa4-4260-b3e6-cd827d25060f	${offlineAccessScopeConsentText}	consent.screen.text
cef7df65-ceb0-412e-8b66-0e91eeaff99e	true	display.on.consent.screen
cef7df65-ceb0-412e-8b66-0e91eeaff99e	${samlRoleListScopeConsentText}	consent.screen.text
3afb8b4f-6aae-4fa9-b985-ee63be61d8c8	false	display.on.consent.screen
4753d207-1667-426f-b578-a14ef8e62c3e	true	display.on.consent.screen
4753d207-1667-426f-b578-a14ef8e62c3e	${profileScopeConsentText}	consent.screen.text
4753d207-1667-426f-b578-a14ef8e62c3e	true	include.in.token.scope
e8f77819-59bf-46fc-925b-895b1ad6afa8	true	display.on.consent.screen
e8f77819-59bf-46fc-925b-895b1ad6afa8	${emailScopeConsentText}	consent.screen.text
e8f77819-59bf-46fc-925b-895b1ad6afa8	true	include.in.token.scope
8c09b9cd-6516-46d9-8beb-6bc5dbffde0e	true	display.on.consent.screen
8c09b9cd-6516-46d9-8beb-6bc5dbffde0e	${addressScopeConsentText}	consent.screen.text
8c09b9cd-6516-46d9-8beb-6bc5dbffde0e	true	include.in.token.scope
1849dac8-8a3a-4083-9897-bca83c73e5e0	true	display.on.consent.screen
1849dac8-8a3a-4083-9897-bca83c73e5e0	${phoneScopeConsentText}	consent.screen.text
1849dac8-8a3a-4083-9897-bca83c73e5e0	true	include.in.token.scope
7d3ccd02-8d97-4481-a0a8-09fc972bde94	true	display.on.consent.screen
7d3ccd02-8d97-4481-a0a8-09fc972bde94	${rolesScopeConsentText}	consent.screen.text
7d3ccd02-8d97-4481-a0a8-09fc972bde94	false	include.in.token.scope
a1118fdc-93e8-46be-a9c5-d3c8daad7426	false	display.on.consent.screen
a1118fdc-93e8-46be-a9c5-d3c8daad7426		consent.screen.text
a1118fdc-93e8-46be-a9c5-d3c8daad7426	false	include.in.token.scope
55d2d135-58ec-41e8-9b67-32add6ca139a	false	display.on.consent.screen
55d2d135-58ec-41e8-9b67-32add6ca139a	true	include.in.token.scope
52f7182c-9781-40dc-957d-03d402db06da	false	display.on.consent.screen
52f7182c-9781-40dc-957d-03d402db06da	false	include.in.token.scope
3e08b33b-8105-4f3c-879d-dcecca0be295	false	display.on.consent.screen
3e08b33b-8105-4f3c-879d-dcecca0be295	false	include.in.token.scope
19317eab-83fc-4cf8-a0a2-228239c25d4a	false	display.on.consent.screen
19317eab-83fc-4cf8-a0a2-228239c25d4a	false	include.in.token.scope
0f708434-54d7-4362-b40d-68ad95fc14f5	true	display.on.consent.screen
0f708434-54d7-4362-b40d-68ad95fc14f5	${organizationScopeConsentText}	consent.screen.text
0f708434-54d7-4362-b40d-68ad95fc14f5	true	include.in.token.scope
\.

--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	fe482c73-148f-419e-9019-51fb4bed5502	t
ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6	t
ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	3aaec0aa-6d5f-4383-bd0e-64d449f0f4ad	t
ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	23ab64b0-6621-4890-8a67-546712a626cc	t
ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	7670374c-38c8-4ce1-afc7-3233d6c5afb7	t
ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	6a70d0f6-8746-4464-b5aa-d9ec7bd8c011	t
ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	279cd9ad-27d4-41d0-a41f-deb236e5eb7e	f
ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	ba7666c5-bd3a-4216-a1b3-6b8e0618db50	f
ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	c98d8ab5-3ed4-41c4-8ab9-711dd26fedf9	f
ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	2434b2c5-1e4e-4d85-9222-922081123890	f
ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	dbd5c158-6752-4bfd-b55d-0ff621d0255c	f
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	fe482c73-148f-419e-9019-51fb4bed5502	t
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6	t
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	3aaec0aa-6d5f-4383-bd0e-64d449f0f4ad	t
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	23ab64b0-6621-4890-8a67-546712a626cc	t
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	7670374c-38c8-4ce1-afc7-3233d6c5afb7	t
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	6a70d0f6-8746-4464-b5aa-d9ec7bd8c011	t
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	279cd9ad-27d4-41d0-a41f-deb236e5eb7e	f
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	ba7666c5-bd3a-4216-a1b3-6b8e0618db50	f
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	c98d8ab5-3ed4-41c4-8ab9-711dd26fedf9	f
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	2434b2c5-1e4e-4d85-9222-922081123890	f
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	dbd5c158-6752-4bfd-b55d-0ff621d0255c	f
b9ef6f30-8f8f-4e8d-8631-705843a1537b	fe482c73-148f-419e-9019-51fb4bed5502	t
b9ef6f30-8f8f-4e8d-8631-705843a1537b	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6	t
b9ef6f30-8f8f-4e8d-8631-705843a1537b	3aaec0aa-6d5f-4383-bd0e-64d449f0f4ad	t
b9ef6f30-8f8f-4e8d-8631-705843a1537b	23ab64b0-6621-4890-8a67-546712a626cc	t
b9ef6f30-8f8f-4e8d-8631-705843a1537b	7670374c-38c8-4ce1-afc7-3233d6c5afb7	t
b9ef6f30-8f8f-4e8d-8631-705843a1537b	6a70d0f6-8746-4464-b5aa-d9ec7bd8c011	t
b9ef6f30-8f8f-4e8d-8631-705843a1537b	279cd9ad-27d4-41d0-a41f-deb236e5eb7e	f
b9ef6f30-8f8f-4e8d-8631-705843a1537b	ba7666c5-bd3a-4216-a1b3-6b8e0618db50	f
b9ef6f30-8f8f-4e8d-8631-705843a1537b	c98d8ab5-3ed4-41c4-8ab9-711dd26fedf9	f
b9ef6f30-8f8f-4e8d-8631-705843a1537b	2434b2c5-1e4e-4d85-9222-922081123890	f
b9ef6f30-8f8f-4e8d-8631-705843a1537b	dbd5c158-6752-4bfd-b55d-0ff621d0255c	f
d571bab1-a113-458c-a963-a83900f6b6b9	fe482c73-148f-419e-9019-51fb4bed5502	t
d571bab1-a113-458c-a963-a83900f6b6b9	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6	t
d571bab1-a113-458c-a963-a83900f6b6b9	3aaec0aa-6d5f-4383-bd0e-64d449f0f4ad	t
d571bab1-a113-458c-a963-a83900f6b6b9	23ab64b0-6621-4890-8a67-546712a626cc	t
d571bab1-a113-458c-a963-a83900f6b6b9	7670374c-38c8-4ce1-afc7-3233d6c5afb7	t
d571bab1-a113-458c-a963-a83900f6b6b9	6a70d0f6-8746-4464-b5aa-d9ec7bd8c011	t
d571bab1-a113-458c-a963-a83900f6b6b9	279cd9ad-27d4-41d0-a41f-deb236e5eb7e	f
d571bab1-a113-458c-a963-a83900f6b6b9	ba7666c5-bd3a-4216-a1b3-6b8e0618db50	f
d571bab1-a113-458c-a963-a83900f6b6b9	c98d8ab5-3ed4-41c4-8ab9-711dd26fedf9	f
d571bab1-a113-458c-a963-a83900f6b6b9	2434b2c5-1e4e-4d85-9222-922081123890	f
d571bab1-a113-458c-a963-a83900f6b6b9	dbd5c158-6752-4bfd-b55d-0ff621d0255c	f
0882bff5-d2f7-42ed-bae0-181c59835dfa	fe482c73-148f-419e-9019-51fb4bed5502	t
0882bff5-d2f7-42ed-bae0-181c59835dfa	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6	t
0882bff5-d2f7-42ed-bae0-181c59835dfa	3aaec0aa-6d5f-4383-bd0e-64d449f0f4ad	t
0882bff5-d2f7-42ed-bae0-181c59835dfa	23ab64b0-6621-4890-8a67-546712a626cc	t
0882bff5-d2f7-42ed-bae0-181c59835dfa	7670374c-38c8-4ce1-afc7-3233d6c5afb7	t
0882bff5-d2f7-42ed-bae0-181c59835dfa	6a70d0f6-8746-4464-b5aa-d9ec7bd8c011	t
0882bff5-d2f7-42ed-bae0-181c59835dfa	279cd9ad-27d4-41d0-a41f-deb236e5eb7e	f
0882bff5-d2f7-42ed-bae0-181c59835dfa	ba7666c5-bd3a-4216-a1b3-6b8e0618db50	f
0882bff5-d2f7-42ed-bae0-181c59835dfa	c98d8ab5-3ed4-41c4-8ab9-711dd26fedf9	f
0882bff5-d2f7-42ed-bae0-181c59835dfa	2434b2c5-1e4e-4d85-9222-922081123890	f
0882bff5-d2f7-42ed-bae0-181c59835dfa	dbd5c158-6752-4bfd-b55d-0ff621d0255c	f
c75ada75-7228-463d-81bc-2d96e1253ae5	fe482c73-148f-419e-9019-51fb4bed5502	t
c75ada75-7228-463d-81bc-2d96e1253ae5	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6	t
c75ada75-7228-463d-81bc-2d96e1253ae5	3aaec0aa-6d5f-4383-bd0e-64d449f0f4ad	t
c75ada75-7228-463d-81bc-2d96e1253ae5	23ab64b0-6621-4890-8a67-546712a626cc	t
c75ada75-7228-463d-81bc-2d96e1253ae5	7670374c-38c8-4ce1-afc7-3233d6c5afb7	t
c75ada75-7228-463d-81bc-2d96e1253ae5	6a70d0f6-8746-4464-b5aa-d9ec7bd8c011	t
c75ada75-7228-463d-81bc-2d96e1253ae5	279cd9ad-27d4-41d0-a41f-deb236e5eb7e	f
c75ada75-7228-463d-81bc-2d96e1253ae5	ba7666c5-bd3a-4216-a1b3-6b8e0618db50	f
c75ada75-7228-463d-81bc-2d96e1253ae5	c98d8ab5-3ed4-41c4-8ab9-711dd26fedf9	f
c75ada75-7228-463d-81bc-2d96e1253ae5	2434b2c5-1e4e-4d85-9222-922081123890	f
c75ada75-7228-463d-81bc-2d96e1253ae5	dbd5c158-6752-4bfd-b55d-0ff621d0255c	f
b627e058-48c9-4c24-a3c1-4e678e99c1e1	52f7182c-9781-40dc-957d-03d402db06da	t
b627e058-48c9-4c24-a3c1-4e678e99c1e1	3e08b33b-8105-4f3c-879d-dcecca0be295	t
b627e058-48c9-4c24-a3c1-4e678e99c1e1	e8f77819-59bf-46fc-925b-895b1ad6afa8	t
b627e058-48c9-4c24-a3c1-4e678e99c1e1	a1118fdc-93e8-46be-a9c5-d3c8daad7426	t
b627e058-48c9-4c24-a3c1-4e678e99c1e1	4753d207-1667-426f-b578-a14ef8e62c3e	t
b627e058-48c9-4c24-a3c1-4e678e99c1e1	7d3ccd02-8d97-4481-a0a8-09fc972bde94	t
b627e058-48c9-4c24-a3c1-4e678e99c1e1	17fa8a05-6fa4-4260-b3e6-cd827d25060f	f
b627e058-48c9-4c24-a3c1-4e678e99c1e1	1849dac8-8a3a-4083-9897-bca83c73e5e0	f
b627e058-48c9-4c24-a3c1-4e678e99c1e1	0f708434-54d7-4362-b40d-68ad95fc14f5	f
b627e058-48c9-4c24-a3c1-4e678e99c1e1	8c09b9cd-6516-46d9-8beb-6bc5dbffde0e	f
b627e058-48c9-4c24-a3c1-4e678e99c1e1	55d2d135-58ec-41e8-9b67-32add6ca139a	f
e6be4642-3e50-4ec2-8531-7f97846e3e1b	52f7182c-9781-40dc-957d-03d402db06da	t
e6be4642-3e50-4ec2-8531-7f97846e3e1b	3e08b33b-8105-4f3c-879d-dcecca0be295	t
e6be4642-3e50-4ec2-8531-7f97846e3e1b	e8f77819-59bf-46fc-925b-895b1ad6afa8	t
e6be4642-3e50-4ec2-8531-7f97846e3e1b	a1118fdc-93e8-46be-a9c5-d3c8daad7426	t
e6be4642-3e50-4ec2-8531-7f97846e3e1b	4753d207-1667-426f-b578-a14ef8e62c3e	t
e6be4642-3e50-4ec2-8531-7f97846e3e1b	7d3ccd02-8d97-4481-a0a8-09fc972bde94	t
e6be4642-3e50-4ec2-8531-7f97846e3e1b	17fa8a05-6fa4-4260-b3e6-cd827d25060f	f
e6be4642-3e50-4ec2-8531-7f97846e3e1b	1849dac8-8a3a-4083-9897-bca83c73e5e0	f
e6be4642-3e50-4ec2-8531-7f97846e3e1b	0f708434-54d7-4362-b40d-68ad95fc14f5	f
e6be4642-3e50-4ec2-8531-7f97846e3e1b	8c09b9cd-6516-46d9-8beb-6bc5dbffde0e	f
e6be4642-3e50-4ec2-8531-7f97846e3e1b	55d2d135-58ec-41e8-9b67-32add6ca139a	f
c676ddcd-1d0c-418b-aff2-690fe19a9fb3	52f7182c-9781-40dc-957d-03d402db06da	t
c676ddcd-1d0c-418b-aff2-690fe19a9fb3	3e08b33b-8105-4f3c-879d-dcecca0be295	t
c676ddcd-1d0c-418b-aff2-690fe19a9fb3	e8f77819-59bf-46fc-925b-895b1ad6afa8	t
c676ddcd-1d0c-418b-aff2-690fe19a9fb3	a1118fdc-93e8-46be-a9c5-d3c8daad7426	t
c676ddcd-1d0c-418b-aff2-690fe19a9fb3	4753d207-1667-426f-b578-a14ef8e62c3e	t
c676ddcd-1d0c-418b-aff2-690fe19a9fb3	7d3ccd02-8d97-4481-a0a8-09fc972bde94	t
c676ddcd-1d0c-418b-aff2-690fe19a9fb3	17fa8a05-6fa4-4260-b3e6-cd827d25060f	f
c676ddcd-1d0c-418b-aff2-690fe19a9fb3	1849dac8-8a3a-4083-9897-bca83c73e5e0	f
c676ddcd-1d0c-418b-aff2-690fe19a9fb3	0f708434-54d7-4362-b40d-68ad95fc14f5	f
c676ddcd-1d0c-418b-aff2-690fe19a9fb3	8c09b9cd-6516-46d9-8beb-6bc5dbffde0e	f
c676ddcd-1d0c-418b-aff2-690fe19a9fb3	55d2d135-58ec-41e8-9b67-32add6ca139a	f
5c6d446d-0355-4b2c-8746-ae46f20420e6	52f7182c-9781-40dc-957d-03d402db06da	t
5c6d446d-0355-4b2c-8746-ae46f20420e6	3e08b33b-8105-4f3c-879d-dcecca0be295	t
5c6d446d-0355-4b2c-8746-ae46f20420e6	e8f77819-59bf-46fc-925b-895b1ad6afa8	t
5c6d446d-0355-4b2c-8746-ae46f20420e6	a1118fdc-93e8-46be-a9c5-d3c8daad7426	t
5c6d446d-0355-4b2c-8746-ae46f20420e6	4753d207-1667-426f-b578-a14ef8e62c3e	t
5c6d446d-0355-4b2c-8746-ae46f20420e6	7d3ccd02-8d97-4481-a0a8-09fc972bde94	t
5c6d446d-0355-4b2c-8746-ae46f20420e6	17fa8a05-6fa4-4260-b3e6-cd827d25060f	f
5c6d446d-0355-4b2c-8746-ae46f20420e6	1849dac8-8a3a-4083-9897-bca83c73e5e0	f
5c6d446d-0355-4b2c-8746-ae46f20420e6	0f708434-54d7-4362-b40d-68ad95fc14f5	f
5c6d446d-0355-4b2c-8746-ae46f20420e6	8c09b9cd-6516-46d9-8beb-6bc5dbffde0e	f
5c6d446d-0355-4b2c-8746-ae46f20420e6	55d2d135-58ec-41e8-9b67-32add6ca139a	f
70e4395b-86b7-497b-bd41-236eac2aad6b	52f7182c-9781-40dc-957d-03d402db06da	t
70e4395b-86b7-497b-bd41-236eac2aad6b	3e08b33b-8105-4f3c-879d-dcecca0be295	t
70e4395b-86b7-497b-bd41-236eac2aad6b	e8f77819-59bf-46fc-925b-895b1ad6afa8	t
70e4395b-86b7-497b-bd41-236eac2aad6b	a1118fdc-93e8-46be-a9c5-d3c8daad7426	t
70e4395b-86b7-497b-bd41-236eac2aad6b	4753d207-1667-426f-b578-a14ef8e62c3e	t
70e4395b-86b7-497b-bd41-236eac2aad6b	7d3ccd02-8d97-4481-a0a8-09fc972bde94	t
70e4395b-86b7-497b-bd41-236eac2aad6b	17fa8a05-6fa4-4260-b3e6-cd827d25060f	f
70e4395b-86b7-497b-bd41-236eac2aad6b	1849dac8-8a3a-4083-9897-bca83c73e5e0	f
70e4395b-86b7-497b-bd41-236eac2aad6b	0f708434-54d7-4362-b40d-68ad95fc14f5	f
70e4395b-86b7-497b-bd41-236eac2aad6b	8c09b9cd-6516-46d9-8beb-6bc5dbffde0e	f
70e4395b-86b7-497b-bd41-236eac2aad6b	55d2d135-58ec-41e8-9b67-32add6ca139a	f
2a74862e-2165-4e23-aec8-daa79e9ddcd1	52f7182c-9781-40dc-957d-03d402db06da	t
2a74862e-2165-4e23-aec8-daa79e9ddcd1	3e08b33b-8105-4f3c-879d-dcecca0be295	t
2a74862e-2165-4e23-aec8-daa79e9ddcd1	e8f77819-59bf-46fc-925b-895b1ad6afa8	t
2a74862e-2165-4e23-aec8-daa79e9ddcd1	a1118fdc-93e8-46be-a9c5-d3c8daad7426	t
2a74862e-2165-4e23-aec8-daa79e9ddcd1	4753d207-1667-426f-b578-a14ef8e62c3e	t
2a74862e-2165-4e23-aec8-daa79e9ddcd1	7d3ccd02-8d97-4481-a0a8-09fc972bde94	t
2a74862e-2165-4e23-aec8-daa79e9ddcd1	17fa8a05-6fa4-4260-b3e6-cd827d25060f	f
2a74862e-2165-4e23-aec8-daa79e9ddcd1	1849dac8-8a3a-4083-9897-bca83c73e5e0	f
2a74862e-2165-4e23-aec8-daa79e9ddcd1	0f708434-54d7-4362-b40d-68ad95fc14f5	f
2a74862e-2165-4e23-aec8-daa79e9ddcd1	8c09b9cd-6516-46d9-8beb-6bc5dbffde0e	f
2a74862e-2165-4e23-aec8-daa79e9ddcd1	55d2d135-58ec-41e8-9b67-32add6ca139a	f
8a864bd5-419a-4390-b42f-512d78d23e8a	52f7182c-9781-40dc-957d-03d402db06da	t
8a864bd5-419a-4390-b42f-512d78d23e8a	3e08b33b-8105-4f3c-879d-dcecca0be295	t
8a864bd5-419a-4390-b42f-512d78d23e8a	e8f77819-59bf-46fc-925b-895b1ad6afa8	t
8a864bd5-419a-4390-b42f-512d78d23e8a	a1118fdc-93e8-46be-a9c5-d3c8daad7426	t
8a864bd5-419a-4390-b42f-512d78d23e8a	4753d207-1667-426f-b578-a14ef8e62c3e	t
8a864bd5-419a-4390-b42f-512d78d23e8a	7d3ccd02-8d97-4481-a0a8-09fc972bde94	t
8a864bd5-419a-4390-b42f-512d78d23e8a	17fa8a05-6fa4-4260-b3e6-cd827d25060f	f
8a864bd5-419a-4390-b42f-512d78d23e8a	1849dac8-8a3a-4083-9897-bca83c73e5e0	f
8a864bd5-419a-4390-b42f-512d78d23e8a	0f708434-54d7-4362-b40d-68ad95fc14f5	f
8a864bd5-419a-4390-b42f-512d78d23e8a	8c09b9cd-6516-46d9-8beb-6bc5dbffde0e	f
8a864bd5-419a-4390-b42f-512d78d23e8a	55d2d135-58ec-41e8-9b67-32add6ca139a	f
eaf18766-7489-4693-a788-95fe5a56096a	52f7182c-9781-40dc-957d-03d402db06da	t
eaf18766-7489-4693-a788-95fe5a56096a	3e08b33b-8105-4f3c-879d-dcecca0be295	t
eaf18766-7489-4693-a788-95fe5a56096a	e8f77819-59bf-46fc-925b-895b1ad6afa8	t
eaf18766-7489-4693-a788-95fe5a56096a	a1118fdc-93e8-46be-a9c5-d3c8daad7426	t
eaf18766-7489-4693-a788-95fe5a56096a	4753d207-1667-426f-b578-a14ef8e62c3e	t
eaf18766-7489-4693-a788-95fe5a56096a	7d3ccd02-8d97-4481-a0a8-09fc972bde94	t
eaf18766-7489-4693-a788-95fe5a56096a	17fa8a05-6fa4-4260-b3e6-cd827d25060f	f
eaf18766-7489-4693-a788-95fe5a56096a	1849dac8-8a3a-4083-9897-bca83c73e5e0	f
eaf18766-7489-4693-a788-95fe5a56096a	0f708434-54d7-4362-b40d-68ad95fc14f5	f
eaf18766-7489-4693-a788-95fe5a56096a	8c09b9cd-6516-46d9-8beb-6bc5dbffde0e	f
eaf18766-7489-4693-a788-95fe5a56096a	55d2d135-58ec-41e8-9b67-32add6ca139a	f
671898bc-9014-4cbc-ab63-604fb1767d16	52f7182c-9781-40dc-957d-03d402db06da	t
671898bc-9014-4cbc-ab63-604fb1767d16	3e08b33b-8105-4f3c-879d-dcecca0be295	t
671898bc-9014-4cbc-ab63-604fb1767d16	e8f77819-59bf-46fc-925b-895b1ad6afa8	t
671898bc-9014-4cbc-ab63-604fb1767d16	a1118fdc-93e8-46be-a9c5-d3c8daad7426	t
671898bc-9014-4cbc-ab63-604fb1767d16	4753d207-1667-426f-b578-a14ef8e62c3e	t
671898bc-9014-4cbc-ab63-604fb1767d16	7d3ccd02-8d97-4481-a0a8-09fc972bde94	t
671898bc-9014-4cbc-ab63-604fb1767d16	17fa8a05-6fa4-4260-b3e6-cd827d25060f	f
671898bc-9014-4cbc-ab63-604fb1767d16	1849dac8-8a3a-4083-9897-bca83c73e5e0	f
671898bc-9014-4cbc-ab63-604fb1767d16	0f708434-54d7-4362-b40d-68ad95fc14f5	f
671898bc-9014-4cbc-ab63-604fb1767d16	8c09b9cd-6516-46d9-8beb-6bc5dbffde0e	f
671898bc-9014-4cbc-ab63-604fb1767d16	55d2d135-58ec-41e8-9b67-32add6ca139a	f
671898bc-9014-4cbc-ab63-604fb1767d16	19317eab-83fc-4cf8-a0a2-228239c25d4a	t
\.

--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
279cd9ad-27d4-41d0-a41f-deb236e5eb7e	b9b92eb1-5e28-4ba0-be54-cd698df008f7
17fa8a05-6fa4-4260-b3e6-cd827d25060f	da5fbb23-0af6-4618-ba2f-0c7df3abb1e0
\.

--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
474bb7e2-602a-49f3-a661-6a0156a4d3fa	Trusted Hosts	345a4401-4184-4713-959a-273d7f8fe7d8	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	345a4401-4184-4713-959a-273d7f8fe7d8	anonymous
a807cc4d-af55-4895-aab1-7cac6c9963c1	Consent Required	345a4401-4184-4713-959a-273d7f8fe7d8	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	345a4401-4184-4713-959a-273d7f8fe7d8	anonymous
03f97c44-2a02-4ad9-8883-ac843b23cc7b	Full Scope Disabled	345a4401-4184-4713-959a-273d7f8fe7d8	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	345a4401-4184-4713-959a-273d7f8fe7d8	anonymous
65cca9cd-1a56-449a-8b28-eaa1cf226abf	Max Clients Limit	345a4401-4184-4713-959a-273d7f8fe7d8	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	345a4401-4184-4713-959a-273d7f8fe7d8	anonymous
4fd72d0a-0eb2-4ffe-8c46-1cc6b293573f	Allowed Protocol Mapper Types	345a4401-4184-4713-959a-273d7f8fe7d8	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	345a4401-4184-4713-959a-273d7f8fe7d8	anonymous
f30bc3f3-e8df-4d53-a11f-80ff43096223	Allowed Client Scopes	345a4401-4184-4713-959a-273d7f8fe7d8	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	345a4401-4184-4713-959a-273d7f8fe7d8	anonymous
b3bd8066-5a4e-4d35-b20d-297fe6d1c3d0	Allowed Protocol Mapper Types	345a4401-4184-4713-959a-273d7f8fe7d8	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	345a4401-4184-4713-959a-273d7f8fe7d8	authenticated
57540bfd-4697-43c4-be08-d88a42390f00	Allowed Client Scopes	345a4401-4184-4713-959a-273d7f8fe7d8	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	345a4401-4184-4713-959a-273d7f8fe7d8	authenticated
c4873b5d-0dbf-48eb-8109-18fcaeb55d50	rsa-generated	345a4401-4184-4713-959a-273d7f8fe7d8	rsa-generated	org.keycloak.keys.KeyProvider	345a4401-4184-4713-959a-273d7f8fe7d8	\N
baedaf4b-5a1e-46ed-bde1-3ea1f1cef166	rsa-enc-generated	345a4401-4184-4713-959a-273d7f8fe7d8	rsa-enc-generated	org.keycloak.keys.KeyProvider	345a4401-4184-4713-959a-273d7f8fe7d8	\N
311178ef-a3b2-4dcc-b1cd-d6c1f7845291	hmac-generated-hs512	345a4401-4184-4713-959a-273d7f8fe7d8	hmac-generated	org.keycloak.keys.KeyProvider	345a4401-4184-4713-959a-273d7f8fe7d8	\N
9d46b350-4a24-4e11-8c90-c389f5877ba0	aes-generated	345a4401-4184-4713-959a-273d7f8fe7d8	aes-generated	org.keycloak.keys.KeyProvider	345a4401-4184-4713-959a-273d7f8fe7d8	\N
c5d19f60-41bf-47e1-9a12-dba21268325c	\N	345a4401-4184-4713-959a-273d7f8fe7d8	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	345a4401-4184-4713-959a-273d7f8fe7d8	\N
ae259458-550c-4cad-907b-6d2caf55b0dd	rsa-generated	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	rsa-generated	org.keycloak.keys.KeyProvider	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	\N
ef801c9c-c048-4fb1-88ae-84f5e726facb	rsa-enc-generated	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	rsa-enc-generated	org.keycloak.keys.KeyProvider	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	\N
0627347f-2d16-4e57-ad9a-d2446bfff736	hmac-generated-hs512	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	hmac-generated	org.keycloak.keys.KeyProvider	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	\N
58da1204-ecc3-4d3f-9f97-d80d6a10f6b5	aes-generated	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	aes-generated	org.keycloak.keys.KeyProvider	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	\N
240e2020-082c-49e7-8089-06eee32a9df8	Trusted Hosts	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	anonymous
3fa2d12d-5239-4b49-aef5-92b0f468a043	Consent Required	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	anonymous
b72f33a9-f6af-409a-bae7-2b8e2c3e5aca	Full Scope Disabled	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	anonymous
ee6807d5-b84c-4b47-b807-81ba976ec062	Max Clients Limit	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	anonymous
461da666-c882-49e0-a972-6f6b4e45c7ec	Allowed Protocol Mapper Types	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	anonymous
1de502d2-b975-4bf0-b5be-cc82d16d0b01	Allowed Client Scopes	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	anonymous
ad8ae498-4298-4d58-b3c8-0168fdd81c8f	Allowed Protocol Mapper Types	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	authenticated
b2b1a67d-da40-4c5b-b724-95fd2b244d46	Allowed Client Scopes	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	authenticated
77a32213-db25-4184-95ef-a2e5340fbd19	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	\N
\.

--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.component_config (id, component_id, name, value) FROM stdin;
e2b793d7-fcb2-4da2-a1fd-995113d4f9bb	4fd72d0a-0eb2-4ffe-8c46-1cc6b293573f	allowed-protocol-mapper-types	saml-user-property-mapper
810cc3f7-3ada-4c0d-a460-5a7fad5c6b2d	4fd72d0a-0eb2-4ffe-8c46-1cc6b293573f	allowed-protocol-mapper-types	oidc-address-mapper
a1c16110-2a7a-42d4-81fe-21d65f6b5f5d	4fd72d0a-0eb2-4ffe-8c46-1cc6b293573f	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
b9c8cf18-1c1c-42c1-bc54-d95b034c844f	4fd72d0a-0eb2-4ffe-8c46-1cc6b293573f	allowed-protocol-mapper-types	oidc-full-name-mapper
c901c376-12fa-4080-8278-a1a1ad7ba0ae	4fd72d0a-0eb2-4ffe-8c46-1cc6b293573f	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
2ddec6f1-dd3b-44a2-950a-160fb73c53a3	4fd72d0a-0eb2-4ffe-8c46-1cc6b293573f	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
e007da49-d42d-4976-bb65-6801e4322922	4fd72d0a-0eb2-4ffe-8c46-1cc6b293573f	allowed-protocol-mapper-types	saml-role-list-mapper
45064957-4791-45ac-8951-2ba1d78812dd	4fd72d0a-0eb2-4ffe-8c46-1cc6b293573f	allowed-protocol-mapper-types	saml-user-attribute-mapper
fb7eb04c-eea4-4be1-bfa9-360454c52906	b3bd8066-5a4e-4d35-b20d-297fe6d1c3d0	allowed-protocol-mapper-types	oidc-address-mapper
1361da5c-2f23-454f-9109-32003349c1ca	b3bd8066-5a4e-4d35-b20d-297fe6d1c3d0	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
fca57a0b-8b77-4ec6-9fed-ad758ed7b288	b3bd8066-5a4e-4d35-b20d-297fe6d1c3d0	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
afd2eb6f-a700-4cdd-b54b-97d685aae67a	b3bd8066-5a4e-4d35-b20d-297fe6d1c3d0	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
472d03a7-5774-4293-8427-e38f2cbf2d7f	b3bd8066-5a4e-4d35-b20d-297fe6d1c3d0	allowed-protocol-mapper-types	saml-user-attribute-mapper
6cae39a4-0b89-4bc0-b768-a1fbc05e1381	b3bd8066-5a4e-4d35-b20d-297fe6d1c3d0	allowed-protocol-mapper-types	saml-role-list-mapper
858251d0-4905-43dc-9ad0-9b7987c28791	b3bd8066-5a4e-4d35-b20d-297fe6d1c3d0	allowed-protocol-mapper-types	saml-user-property-mapper
8ec78501-1b96-42b4-b2f7-1eac86284b71	b3bd8066-5a4e-4d35-b20d-297fe6d1c3d0	allowed-protocol-mapper-types	oidc-full-name-mapper
5416bb9a-6c18-4069-a29b-8e29df6f69cc	474bb7e2-602a-49f3-a661-6a0156a4d3fa	client-uris-must-match	true
9995e6a4-41f0-4e92-a93d-099f04d0c725	474bb7e2-602a-49f3-a661-6a0156a4d3fa	host-sending-registration-request-must-match	true
6e056e26-f93b-4150-a790-58723a673653	f30bc3f3-e8df-4d53-a11f-80ff43096223	allow-default-scopes	true
2be9991b-48c2-4f4a-ba88-6269cb85d6a8	57540bfd-4697-43c4-be08-d88a42390f00	allow-default-scopes	true
06573e34-38ab-455e-baae-b47475a5e1e8	65cca9cd-1a56-449a-8b28-eaa1cf226abf	max-clients	200
5268bffb-165d-4775-bf8f-00ee4dbae76a	9d46b350-4a24-4e11-8c90-c389f5877ba0	kid	fa5d8e9b-0fff-4462-946f-a15ff8c4bc1f
914d5bad-a43b-405a-a1de-c9092605422a	9d46b350-4a24-4e11-8c90-c389f5877ba0	priority	100
abaa141f-1b30-47c8-acc8-9532745e72bc	9d46b350-4a24-4e11-8c90-c389f5877ba0	secret	LHrdaxBrvKDH_QnGh_ogfA
7760eaf1-d0b3-421b-be51-5c9629f2f8c9	311178ef-a3b2-4dcc-b1cd-d6c1f7845291	algorithm	HS512
e0f7edbe-0418-405c-a2f7-035bb6629a1e	311178ef-a3b2-4dcc-b1cd-d6c1f7845291	secret	2-qUBQUCgoOJE7ZxKqlsyV7Td2YnkXMmqcxBpAaaRYJb5yYZmnz9me3q_0GxjwEIIOjuA_G4VjJEDyLPIfcurhRzU7VKad8K9HzKWD0-J6ipFcHUQnJGsR_hgMLe_bRdzOH2tH9otA2STxMN9pB9AO5HuOScHLDkND4bw8ZSVtE
046f7902-8353-439d-b546-0b775b5ecbb2	311178ef-a3b2-4dcc-b1cd-d6c1f7845291	priority	100
30756531-e2f9-4d82-8d67-c0d4e073c879	311178ef-a3b2-4dcc-b1cd-d6c1f7845291	kid	41581441-bad5-4a94-8836-d52ff8d1eab8
69f11fbf-9d8e-4bea-a940-a2d5bb2252d2	c5d19f60-41bf-47e1-9a12-dba21268325c	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
f87ef9f0-7b49-4573-9d85-c20c7796b8f6	baedaf4b-5a1e-46ed-bde1-3ea1f1cef166	privateKey	MIIEowIBAAKCAQEA2igJaGN1jTK+705ti7Glv8a2zrp4zjnJf8lRDWpcO3Rjrnc4l/XESzhc6XCicurUuWUzQMVXkAR/QX8TuARWXQ/2oZyIN6ORWwDBi5/g2j3Oh5Yn5jSJMDSj01ZtmkqTRZ/H4NwXhhBDblH6e5flUu6M+Zj+mjy3Ro9c9uPas2hrh5PnCC6bDTHd6qwDX5Dx5VsztAK6gysupZyqQ9sVE/D+RuNHSjUCVJV32CwVYLc1n4t451MFLJwreK9IuTKbjQ6NH2YPLxtj5kQ55D9shX4FLCJVKG+rmuoZuhpayELbjD4QVSotY2PbQH4/9PnmMAsnhweVtl4VLX9zOeauAQIDAQABAoIBAALxBBWGyynvDHiRSR0eHPp/rhubVbU+0712PymY3m52PbPEuLjDz3+dP48Mkavkg8uOFFE/miOtzg0KTc7u9qipVJQfwEJNll2Yg9dsP9Iq4RtTUlvH6fmhLboal1SPhl+4x9/7iEcLpwXuiVDDpWiMyPFqZ9wmU1v00aj4V71A5C/KgnyfHNCK26eMJcj/magCuyK48lQvTJybLPZqz/0u/eSizc5spw7l7tzzuHaikjakF0VObNes7+UTETLkflHYTBnfX06yYtZQVwd7tFGvU1YOvzUmGlMNxb8KSthma0x1/+rYbB5MiGSo8Dujp34HaUo8kWbSzOs0vm4ETykCgYEA8KB9aDXKZm/mKyroNf401zMdAG7+1YMwELnxB7Hi3ZBMNfjIwQ65WaIEFTc14W/ruFdZfPC0Hvp+ZYoNjJN00rXaXMY3k6CtowFzZHU+Wtkb5wSTBLYS0Zkzw5UX3AuqP6picuzR+WtQw5AXN4ba9G91kWZgPsLyGqTgN0sHepsCgYEA6BgJRKw/ERcv1FZeieWA+hoqRKFlxS8kEHYxATExcOCLfvKTDb0O8H6xcSMpBVMnq3GQojqzIq9kmxehk2ujvUtTtmco/GzpYhEwd5SIh173B8vPFSMfhtDVc/BKxlz3cKGG1M5nAiuiJYJX1FXl7yB3A9aXD6PIuB6HEHTmxZMCgYBO1kZAPl9x8HeY7RXnmsH1P+ngmn0jtzeoQ0OVIdMShJRzmm8r0YcotsxfpxcgJWs1mmjXZoWdILUIz5Jg3G8KGkrQ2qCa3aoGHhOQdllXqopZxkXk5UKFKYysJ80Ja0j8UvaucKja7y4m5K62ophaPapnWQNvjK+Fyz8q3oo0wQKBgQDVmqmNBmnUtN5UMlk32H1nsQUNvO0JGWW7sMtRKZEzLbW01FP65PEG7dMpKQ7r06hC5XYTmKqdVYbmJk2SfBJqeRVGXpMeHq58jw1oQM+WpxP7nNutvHGbhj+tQI3RGmawxjhtSrkLClVk6B0lUxkXh22BntHQlxB4Q8BSqQRq+QKBgAEcYWPdrBMGZFXcxVCxZTzHeuj8/RbOwFocrG73TzngrRD6VX7SMrMMB0BqPkzzflM/XFxsgHNOGGcniBBf7aIit4y3+hmgpqwoBDStHDNRw2d+6yk5QL2HrJfAcxoTga58huiPEmRpzczzdcSco3a0JVWcczqiuW1adYHtnvVx
c6320c94-727d-4e9d-9f00-058b5cb279ae	baedaf4b-5a1e-46ed-bde1-3ea1f1cef166	certificate	MIICmzCCAYMCBgGcmYBpoDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjYwMjI2MTAyOTE1WhcNMzYwMjI2MTAzMDU1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDaKAloY3WNMr7vTm2LsaW/xrbOunjOOcl/yVENalw7dGOudziX9cRLOFzpcKJy6tS5ZTNAxVeQBH9BfxO4BFZdD/ahnIg3o5FbAMGLn+DaPc6HlifmNIkwNKPTVm2aSpNFn8fg3BeGEENuUfp7l+VS7oz5mP6aPLdGj1z249qzaGuHk+cILpsNMd3qrANfkPHlWzO0ArqDKy6lnKpD2xUT8P5G40dKNQJUlXfYLBVgtzWfi3jnUwUsnCt4r0i5MpuNDo0fZg8vG2PmRDnkP2yFfgUsIlUob6ua6hm6GlrIQtuMPhBVKi1jY9tAfj/0+eYwCyeHB5W2XhUtf3M55q4BAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAJRWq9boGS42EYz2Zkg67rcfoEgNCw/j7YvXG6WyddYzcuzWJWnJgi158wJ7yWyrxhw2qT7oDst8Y+JEPA9nJ6MkxcCHvXgmoA6nzHFlulPaY+4S/HUHCJZek5q0/0tnI6G6GcGewP15l/NJA46oYbJvEf3X5RkHDkCE65UbvWNZrrgfahoyT7VhEgkUVjcB+dx4tIikwPFAt43x57woiAu3/cwfYGEn8oRf/PP2+NCniz8EE34ZrtHHu2sd+E3xdRAT5vzO7AplA+6YrshGV3bbP9/X2J9EX940/+pybvfnrKuCk3cBHZJ1nWVnrvzyWYunkyenVdQFjPC3C5635q0=
08978561-b793-4d90-a740-fdbe6e82aeff	baedaf4b-5a1e-46ed-bde1-3ea1f1cef166	algorithm	RSA-OAEP
d267bc99-7d88-4237-8650-10b0d9afe0b6	baedaf4b-5a1e-46ed-bde1-3ea1f1cef166	keyUse	ENC
6bfe6093-b1b5-452e-93a2-727c65709027	baedaf4b-5a1e-46ed-bde1-3ea1f1cef166	priority	100
0f7052d4-7504-4d9a-ad62-f71eaa5aaed6	c4873b5d-0dbf-48eb-8109-18fcaeb55d50	privateKey	MIIEpQIBAAKCAQEA2PD22wQkLkQhRL4C1O25ksu1BWM/aH4p4aJGAe8rGfHlx+srnldGpyp8Dx5SDGEj9I6nTzDL2IZKBhWPsGQl5BIRVhji2xqAsbDC8SzqVmJ/9notcBE2e7+loc3L+FiqQ6IcYZG/xgjs/KqYh5hgDXLrLRoc//MqnXN8q4YDbO9f6FT3gGj8OQ3LFVydXNK7GaA5791MFAX3WnEOuh6YLcSFrTSgYY9emwmoBi1suLMN63KEmrgnPBxQsOzfbPd2pjTxTJNgcDxnjEod1uPRrt1OvHh++yPD48A6aB8Bs2jSdjx19WaewrmGirYn/6oVI4GXrJXo/+mLbPfypT+8swIDAQABAoIBACEqPWLgMDPOgJOExOQOb7dMYyEuugvcdcSjzTYQfTNbMriscB+l0gxOR2b8SKjR1PBXOqa1nAQ/C2QAudXKiaxjQrk51ryOQaxojHTYW/7W0h85MGcYio7Cjqy8zHjr/SOXzeTwpjO9O5Wo8uaP2edUcTWU72gFobcuZ5nFRBLMAXewtN7qr+x5VwsKyg+ROyf9mAYyVKcN07qC+KOSOldBKUKTF7wBX2xWSMH/NQbhjhQeOG41I3hK6Rn2AQscd9k2BmWw+lvDjdDVN+GCrxe+BfT+BqRIfnpuuJmxQzKxAc7GwxMmuOCbOunjG5IDjLQWzrwm4A4y89R+0iwEo3ECgYEA8QbWZfVTY5AUgVwlRlQgmUQqxbkCOZV14bgieJeXkhahGaqmWvJ+howji8MxRFXMn0YQ0cfewaB2G+PnZnQr5G2viwg7q6r5gM7YXne5F1krqGoadnzRjv7ekKPphHyGB0MRN+KvbYthoDREEf/4TQ2gzbZRTFNwtzq2mZGvB1sCgYEA5msVo9J8hYsfeWSK/igq8k1t4+46vaDQqJjpZhweD4g3XUyRvQMbsUDB2bfvVJACVd6VbRu7o0CtJWwTk6uQzcoXSGEG/OIi/5Duzb0UYWegyx2Niuz7IiQkTO1tS9mkt2234afdVv+WXBnwc6RLOau/9bUFAldPDTCuE/A094kCgYEAi7pEBp2fNyPqz0eFEG1q7I9ZIIDtqkZcLXva+AAhzX4y7LdCc40LDqMlZDvHTu9Sja9HxuXQ3H1Smz6XAo0seOOhlb8zIIUg2ayQQMu1ULTQG3VPXAtmTTix/DYaBUVPSdx2mehffOkFsqM6Jxk2cC0LYNZl8RKaUI7IFuUfC+sCgYEAvaNQkh4AYiCYbN51DqycfAOB99/v9HXQhZIkNefaTco8VstX/wn51q6HXNrnXN+RLH8e2EfE7J2kY3JJwnWnndc/xlAk4ihzyYbNJAMELQ6O5dySy84y+mxoe+/EznJ4AIeKmWwA3UNJys+GeIa1aueR+3VahAy7gQ2Zl8tQrJECgYEAkpSaulneoM0f2NHxdB6+Grgx+vOquPTEoqeQ1uqYULkDRmaBzkNmzOsvhaPgQQOC/Q6RpcWaHA83znK+fPREziehUWwsGsB/dhBvD8V75FsDXomrvF2kvXt3yZ7UroinssWRL5dXj5Yyf44nkT9Wi5nWQzS8/N8+P9dWXIcsHYc=
e2790e7d-5839-4c55-b048-2d18106779eb	c4873b5d-0dbf-48eb-8109-18fcaeb55d50	certificate	MIICmzCCAYMCBgGcmYBoJTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjYwMjI2MTAyOTE1WhcNMzYwMjI2MTAzMDU1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDY8PbbBCQuRCFEvgLU7bmSy7UFYz9ofinhokYB7ysZ8eXH6yueV0anKnwPHlIMYSP0jqdPMMvYhkoGFY+wZCXkEhFWGOLbGoCxsMLxLOpWYn/2ei1wETZ7v6Whzcv4WKpDohxhkb/GCOz8qpiHmGANcustGhz/8yqdc3yrhgNs71/oVPeAaPw5DcsVXJ1c0rsZoDnv3UwUBfdacQ66HpgtxIWtNKBhj16bCagGLWy4sw3rcoSauCc8HFCw7N9s93amNPFMk2BwPGeMSh3W49Gu3U68eH77I8PjwDpoHwGzaNJ2PHX1Zp7CuYaKtif/qhUjgZeslej/6Yts9/KlP7yzAgMBAAEwDQYJKoZIhvcNAQELBQADggEBACAs7f25PU9SWIG8uv64CNErUD74qKDRHpjqxJJ4hbZOUhf9BH7SmoymAUTYdITWsnulWVTkrTJtTgrl8uTuhB/BMx1y+llnjfAPedpfb1Uu/uFA96O8fzdsXHUk66cWUx2mLyJzI0ZLyCIUL9tt+yu8R2nm9LNbQmPkW7ShAeGhpACP69kM6ZDlGjhg/2vZKgRcolvo/J70TkpEWF+uYxjiO6LPZAl5/InHjsXkfnLzl5ATWBTxjvrAbCFTTYGiuRq3iAgiCLIZZ9dzOGV2BA0XtaihrXxj2+lCCBMJm3iLMBYazAxc1sof3/WOrzXAIPYv4gO4i+t2Z/KK7NzpiMQ=
4b181b07-26f7-436c-8634-b91452a0510b	c4873b5d-0dbf-48eb-8109-18fcaeb55d50	keyUse	SIG
7286259f-0794-49ca-b231-f71d0fb156a3	c4873b5d-0dbf-48eb-8109-18fcaeb55d50	priority	100
7187e00c-9215-4c5f-a0ec-8cb1e32a6785	ae259458-550c-4cad-907b-6d2caf55b0dd	priority	100
8e9e4ab2-c565-4f89-a315-8ab676d5aee3	ae259458-550c-4cad-907b-6d2caf55b0dd	keyUse	SIG
2f185701-0842-452d-a3f9-aba12f5e6ec4	ae259458-550c-4cad-907b-6d2caf55b0dd	certificate	MIICsTCCAZkCBgGcsXHA2TANBgkqhkiG9w0BAQsFADAcMRowGAYDVQQDDBFqYWxzb29jaGFrLXN5c3RlbTAeFw0yNjAzMDMwMjA0MDhaFw0zNjAzMDMwMjA1NDhaMBwxGjAYBgNVBAMMEWphbHNvb2NoYWstc3lzdGVtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkMT9rQdp7cVdrqeS3LnJttWe6wtv9bkzHc+6MRkXlIPWtIadT6G9vhM5NIiv5QisJiD/piflKphQIuFM1pXbbR+jp5tlQFmwtZa/R5YjtuTBzv1ggKOfm/fB6e0SkTqrWf+W9k0Owpm4I9lmMPqdhnYJgtoaQefm+ceYMSgw2z4UADfLG0DDD+7yLUjVL4Dlbx4D19s1ijQ6+YJH2jstW7eK5RbkZhBNzCD0oIMQyG5ZuFtzEa8ZReIuxN59AM2yFYWXrJ7P/CeAvNL1fi8li/eikF4soUc45SyL3q3KF3emD9cRf0T5UtF/KeXafpRyv3edSqZq/6vyn16aAVmryQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQCMfXifYdgfu2OH6Lv6bTcjBp6qDbe2l78f5M5vuCWsMhQVPHVcsQZmvkMzxKHR5gNKilaBPbB5H2UAuU7Y2Fukbk8FyEAxe6IBxoGUsvRBYuI2M+K5wBtrqo8z3AxKwii23o3BAFZSKx8WrIkKAWv1fH+vhKTMN9aA6NFulOH/+QSwlKlKrHUn2V9IdF48wXw7tZBiY5+0KOC8+TMssbH7JbFKRsBG9CCGHKiEtNsKsVWZ+Lgejo3eSZBRhde8MiZv2ctklmnTIVWx+aW/eFg7/bSUIm2NAxW40NU8v4JF/76ltO/HMifIioM3uXOOHkKBQ5yYz36J/IExqN70X8mt
6cb32944-4341-4b0e-84f1-ba9bd5598c2a	ae259458-550c-4cad-907b-6d2caf55b0dd	privateKey	MIIEpQIBAAKCAQEAkMT9rQdp7cVdrqeS3LnJttWe6wtv9bkzHc+6MRkXlIPWtIadT6G9vhM5NIiv5QisJiD/piflKphQIuFM1pXbbR+jp5tlQFmwtZa/R5YjtuTBzv1ggKOfm/fB6e0SkTqrWf+W9k0Owpm4I9lmMPqdhnYJgtoaQefm+ceYMSgw2z4UADfLG0DDD+7yLUjVL4Dlbx4D19s1ijQ6+YJH2jstW7eK5RbkZhBNzCD0oIMQyG5ZuFtzEa8ZReIuxN59AM2yFYWXrJ7P/CeAvNL1fi8li/eikF4soUc45SyL3q3KF3emD9cRf0T5UtF/KeXafpRyv3edSqZq/6vyn16aAVmryQIDAQABAoIBAAaStShnLOV3d7+Tevjz5A9dv2mRYz/bTPF6ciwixSXwfv4DGy8nizmPPqKOnrrl1AgmqSjiiJaQpBnTVDVtiDEaFciJRxV/BQWXrr9ptx0poY2cBkbM9xUiMI8mHRjUOr27O7/a45PNHjXde/T3GhIl95xV+gl6RavbZsL7nc1EgKpC3F1lrbNTBStInQpABqH31oN0f+mjaKNX7y4smF7nYMGECqMccoT6/6cb6EhytetUNYfe5g4fCfNK00CR5GSxAOx2fJ5rjW/SbeBZEC+9Qc1HDaI9RWLdlJBUMHOGzKB9Uoh7Ty07VIXKm93GiY6bNSlRCYunwRP4GvN+YLECgYEAy66JrxBSZ+dKRDH8kToEtX81OTTRVgXxr9RZRAUsSdo7N8AJHgTcYgR/MvxtvcenzQ50L5LBDlc7rYwCgH3+3Z95E02so6Byv+guC81CbylE6EB9kjZIvuYB25+waC7cUGrtej62l0JrCG9VwTrTZNZhLZAN9Inby+3WzfqgdjkCgYEAtfSRwwUhg/LX5BShszMh4oexxoOtu6wbuBuM9gPFgo7lY4hEOyJLjtP8mFjPgeyyxgA3DJmuZVm7KDm06cESedyj/RaA8ps0Z8FEJEQcFL9so+BIy8Z8pJeu+CJGtjDlOR8B6h5A6ze0p/NHdotfoxmIiQq084jgL9YyXOrwYhECgYEAudoRGAS0rMqHIaLa60kdct8YGZLwUKYr2lzQ9xghSWIwFrbLmvCkh2vDBSsAl+LOYnWF3sLyFbvTYJAY2FYfcOpK+CowFT4adrHNEkfBDt2BWss9yWRvDIGjwFr+BJJ9xYNMHfeLdInOUGwGu8KJkcFr+r8vfKsuO+5RyrGeKUECgYEAs8/eYCho55mL6lTNO2czfEb20yP8A3Pg7L8lPVWa0Rvf6s2WCA4rNxmdDPzvDAla3jsGK8iPxI65WtY0R7DKTm1SDeE4Swg/8KzYZzJ7wbEuboBN0Dr1oD5Z5dMRqCiHzjwrSy7cntatDDBplefD+k1YVX2kNus0CXIW0SZHqdECgYEAqjd0siXLjkmm86ICxLBsvXguYftE8w6MvagjP9P8eeduPQuI8luqf/u6uvt2bcOQtdGPMmMl/P1uO/onJRjnZBAGB0Inl2p8rsnUUSrucTBgfDFZeT6n/6gn8M8cPE3CDW4x3EJq4Y3RroiMjXzVkfSft2wCHSftYqvsTlbLMZc=
62cc5dab-37df-412a-bc0b-ced4529a691e	ef801c9c-c048-4fb1-88ae-84f5e726facb	keyUse	ENC
59ed61f6-933f-42c8-83fa-7d0c92df5918	ef801c9c-c048-4fb1-88ae-84f5e726facb	privateKey	MIIEpAIBAAKCAQEA5C1g+pLKedpJgTrp16rU0TkhualcaXuMfjdOYmPwR5sUGB0psY31IFDuN5cEUeTbs2Ysm+2aGnZVlZR2wA3UiOaJxVCZ3VKqdqYZt1PDpPHqSvvF1qi1oPg+4nIBlt4SywQLqB4OLSRUzaUmcl+519l8mNXMmDy5beUimIWmmXFhBCDKtQLrmp8H3c4KNMDA5eE3nZbWlZL1DSmkJMwAos741tIiuRoa0PphAN5q8aIizcKc8AqmkcuEb9/FaRS7AKOdJPBuqhqqzFflc3LVZqB0TeCzIM+IWP94Caq+EfJIVMCO9w40TB81+W0jG8KifyxUYA63JvuZF5sa4i0itQIDAQABAoIBAAymjW1nDQ3DcfbVvthDsufkrH+AKcz5Whk3VMO0ucImkW8i0shyz+faRNLVLxqhPyMLo6aDfltAO09/OzQ7sBBlA7dqWBWCu0u3us5EuSCgfvZoThgwI13I1ae1XWwxZMZXs5O/Etci4AbExMRrlUCn4LYSiHTaTQeQQCJHqqxwF30nL9VOGewrMMOaO9EEtmQ03bYr4ajU+agOkqStHXvRm+QpeRaUHkWziDiGAWZ6RV8FT2CQ9cgIfKHFrVR3ssxwG8Og9Wb67V4xZrGk0Q/eAA/CM/uD6weYwlm2ncPfQr7SSzdhrGEp97D9gHXgq3JwCWc7TkgE3TjAKhvfdUECgYEA9JrzcmrTBtD9a8uKvNa9MymmWEfyM75PAooQDk0ajzz/8scHt99jazRsYripykCrJeDjTOGD2+oi3IrxwUW2tc3Y9e+VXYWdK7HycjOJC0JuCOtFAHOuZ8lJ8BTxnISBTExRqMoU2YXSu0H+XyZhBzEJlJq9olhayPo/AgcI/WECgYEA7s6D1HfYy3CaUn7Dtood8hHQs6ZF2aPk1U5ZDTY552pPsiFO9jUvfg8PALV3UbY8pNXbF7N5anLMXXmasgMYvmqQTUFaSi45n5MaUUBw354LmoBtbUwniRS+cooXVOFRGFmqZWfq9pkuyuXZZz9itgkXK56EKRxUkCsSRQdq8dUCgYEAtl9dSZ6qDjf96sQMgfVdhWr1Unb592haAlur0u3b8pYZgwqwD4Dn4ENq2EQ0m86RjKFa97RgmrO8IFEcJOz0aCK9M8jYxazcXXrEeC9Ca3mxDsdTYB3gGBO1I+KJrhgBS0DP1Zgt6WzkjKeMn6a+yxzdtsWUxBk6PwSNu9ZA9qECgYEAu1dNel/utmKG3lLODKS7q0yoklbNk1iMy33kRIYW1OHE1bRlsqa0tErx9RdnHLY/SvzuHODSTlzy0B326tGdFryYqdKsF2e+Et6fFcDdC8B7z+ASeFz24wZgBZEpjpAYQ2cMUvM8E+rGF6xLakECmlX1VGXNvkaYXGU9tuOD1WUCgYAj8sgdzb9TtlpbNeqPOJPGTYN2LaWK53gUt+1c34lxuYpthsnelf/rGBNLvG3/JXUvLkIBKbIpPxwBBHDtC2o2uDgXHo6Bh6oeRyXSUFPE4L45IX/ooaR4tXO013tTNjRGtxihMt6CHGxasKgS5WzivsIFbXIFXdM/aihmQ8kbNQ==
93c40fb1-d3d4-4ff8-9e64-5d0533bd7c31	ef801c9c-c048-4fb1-88ae-84f5e726facb	priority	100
122fbd7d-db81-4d75-8f9b-41975328a8cb	ef801c9c-c048-4fb1-88ae-84f5e726facb	algorithm	RSA-OAEP
7e1d6d99-7688-4bd7-afab-6db00e6fcf08	ef801c9c-c048-4fb1-88ae-84f5e726facb	certificate	MIICsTCCAZkCBgGcsXHBWjANBgkqhkiG9w0BAQsFADAcMRowGAYDVQQDDBFqYWxzb29jaGFrLXN5c3RlbTAeFw0yNjAzMDMwMjA0MDhaFw0zNjAzMDMwMjA1NDhaMBwxGjAYBgNVBAMMEWphbHNvb2NoYWstc3lzdGVtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5C1g+pLKedpJgTrp16rU0TkhualcaXuMfjdOYmPwR5sUGB0psY31IFDuN5cEUeTbs2Ysm+2aGnZVlZR2wA3UiOaJxVCZ3VKqdqYZt1PDpPHqSvvF1qi1oPg+4nIBlt4SywQLqB4OLSRUzaUmcl+519l8mNXMmDy5beUimIWmmXFhBCDKtQLrmp8H3c4KNMDA5eE3nZbWlZL1DSmkJMwAos741tIiuRoa0PphAN5q8aIizcKc8AqmkcuEb9/FaRS7AKOdJPBuqhqqzFflc3LVZqB0TeCzIM+IWP94Caq+EfJIVMCO9w40TB81+W0jG8KifyxUYA63JvuZF5sa4i0itQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBzTV+td9NPloxHCFghR1jDgSmrEsXZd0VhATgBLBkokn/AexOfsbxYvCm3t+/Dqi1KrC0La9DDWTuLH/E0LawIuLFQo5Fsens3eCIw8aogFAPAQ1RylXZtEl8adTi3kN1+t9FloQ/I0K6x0mNA9L+9OBYGn8RRxcQY8DW/YX3PouLI+fJOnw7jn0JIS59bjoM+LPlH9KqzuJdKFGJATBB8J/uq9+ywSg7p10NM49wpDzpOS+HLzwq8tF7CVsZjdfhRDvg7da7/kebtqjFg1/wMrfyUAFTRMBPmZySZ2StTfb7pau22/d2AkzdrjZfbGJMp70+0fm1WREokNdcBlM93
74ae1ae2-1f9d-4ae3-b711-309e5f4efca6	0627347f-2d16-4e57-ad9a-d2446bfff736	priority	100
7646dce4-7dbc-4757-935f-7a63d9b530ab	0627347f-2d16-4e57-ad9a-d2446bfff736	algorithm	HS512
9a8c96d3-4c9f-4007-b7ec-b38db59f18e8	0627347f-2d16-4e57-ad9a-d2446bfff736	secret	xfXsf1LTslu3D3RRVIq99TbbdFVoGGBe5vDgPQJkhVyspZMZDS7KmzuJJ28QL7jX2E1vqVATstwpsYEovzAxx_u8g59s-3dPd7dU5xGAbeYRqSmE7Lw1xIS9COV3hR8L5maxSljC3FmO_NRKVSCVB-imULLm3-vBh6gaRKLQYWw
60121bcb-ac42-4d20-8a1f-ab8318a9f5f1	0627347f-2d16-4e57-ad9a-d2446bfff736	kid	5c68d597-7957-4903-8bbd-5c4dda5c9bde
2c2cad63-634d-4f18-a2dd-da2645c4239b	58da1204-ecc3-4d3f-9f97-d80d6a10f6b5	secret	Dt7O59uPTErIRjphFQzInA
6dcb24c3-97d0-41a6-a7e4-85c6fbda694c	58da1204-ecc3-4d3f-9f97-d80d6a10f6b5	kid	1d5abfdf-7d30-4284-9825-5f2871048974
e3d78221-a4e5-4eaa-9c09-7f7972aef127	58da1204-ecc3-4d3f-9f97-d80d6a10f6b5	priority	100
a0a73ce8-c4a5-4042-8e6e-96853c3aba15	461da666-c882-49e0-a972-6f6b4e45c7ec	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
808a4ffa-5026-49b0-ad99-7634c8a6c310	461da666-c882-49e0-a972-6f6b4e45c7ec	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
13e3b355-ba33-43c6-9807-b81e37dbe29e	461da666-c882-49e0-a972-6f6b4e45c7ec	allowed-protocol-mapper-types	saml-user-property-mapper
babff76c-a1ac-4887-9a34-601b3e8c7290	461da666-c882-49e0-a972-6f6b4e45c7ec	allowed-protocol-mapper-types	saml-role-list-mapper
d05c5e12-f562-4c57-8dd3-126a3d2b2907	461da666-c882-49e0-a972-6f6b4e45c7ec	allowed-protocol-mapper-types	saml-user-attribute-mapper
ee05a95f-e773-465d-af7e-d892b7f5bcbd	461da666-c882-49e0-a972-6f6b4e45c7ec	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
4cc3b913-d408-4ca7-8689-5b8b6acb3c19	461da666-c882-49e0-a972-6f6b4e45c7ec	allowed-protocol-mapper-types	oidc-full-name-mapper
ba23aaf2-fd74-410a-ac2d-00b7711ce186	461da666-c882-49e0-a972-6f6b4e45c7ec	allowed-protocol-mapper-types	oidc-address-mapper
19ac8885-65c8-474f-831c-67406307fc1c	240e2020-082c-49e7-8089-06eee32a9df8	host-sending-registration-request-must-match	true
ab1d6c99-f267-419c-b71f-e67ba2297996	240e2020-082c-49e7-8089-06eee32a9df8	client-uris-must-match	true
3780fa18-b590-4185-b021-6c1443c8a31e	ee6807d5-b84c-4b47-b807-81ba976ec062	max-clients	200
a1305c82-260f-4fa7-8550-4574e403c21e	ad8ae498-4298-4d58-b3c8-0168fdd81c8f	allowed-protocol-mapper-types	oidc-address-mapper
b8a93751-2bd1-4f3f-99c2-3b25816bbfe4	ad8ae498-4298-4d58-b3c8-0168fdd81c8f	allowed-protocol-mapper-types	saml-user-attribute-mapper
8f604782-e1d3-4cdf-a9be-fb8bd6471899	ad8ae498-4298-4d58-b3c8-0168fdd81c8f	allowed-protocol-mapper-types	saml-user-property-mapper
a4d81bb5-48e0-4499-a91d-bc22168934cf	ad8ae498-4298-4d58-b3c8-0168fdd81c8f	allowed-protocol-mapper-types	oidc-full-name-mapper
989f48ea-6399-4a05-bfaf-cd46ad69cb1c	ad8ae498-4298-4d58-b3c8-0168fdd81c8f	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
429e3bc3-0836-43db-9693-da26ef8b4f0b	ad8ae498-4298-4d58-b3c8-0168fdd81c8f	allowed-protocol-mapper-types	saml-role-list-mapper
3a1d7d92-e9db-40c7-91ba-d68cddf3dd83	ad8ae498-4298-4d58-b3c8-0168fdd81c8f	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
7074c884-d426-443b-94f5-310f286357d6	ad8ae498-4298-4d58-b3c8-0168fdd81c8f	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
d98009c3-151b-4866-995c-2e7d9eb2d1af	1de502d2-b975-4bf0-b5be-cc82d16d0b01	allow-default-scopes	true
12379847-7d20-4239-bf57-33d2b78a62fb	b2b1a67d-da40-4c5b-b724-95fd2b244d46	allow-default-scopes	true
113c7ed7-0593-48fb-aace-e10066277829	77a32213-db25-4184-95ef-a2e5340fbd19	kc.user.profile.config	{"attributes":[{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"annotations":{},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"annotations":{},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"annotations":{},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"tenant_state_code","displayName":"${tenant_state_code}","validations":{},"annotations":{},"permissions":{"view":["admin","user"],"edit":["admin"]},"multivalued":false},{"name":"user_type","displayName":"${user_type}","validations":{},"annotations":{},"permissions":{"view":["admin","user"],"edit":["admin"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
\.

--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.composite_role (composite, child_role) FROM stdin;
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	7a4d80cb-4d51-454b-aa31-d5086199973e
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	f2099631-f753-4eee-b2d0-ea0f5a75c475
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	7502179f-611e-40a4-a94d-6861d4477dba
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	12301126-8177-40b6-91ee-62ee9b150aec
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	cf6cd38c-4d9a-4ec6-b4dd-cc3fdb3c72b5
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	8f674b8f-388f-4e04-b6b5-a1399d52439b
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	bb91cb50-4393-40e3-9a5d-bf361d3d634a
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	e62cdd27-ebb2-4b6b-a48b-488bfd274906
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	9298e26b-7134-494b-b334-34946fc2e59b
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	e3341d41-0e1c-47e9-95dd-0ed9324d30b3
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	887e8240-c495-48d0-958c-5c6657c64636
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	6d664150-4249-4cbd-8a63-ffd3837fed56
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	316f4eb0-d681-4946-a166-c7af709bfcc6
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	d3764067-daa1-46bb-bf50-d550e5846959
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	f9921a4b-049e-4757-bdbf-18d72e948537
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	d59ba452-737c-4c39-851f-6485aa6713a9
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	98ddd54d-a1cf-46da-a821-1ca7c52624e8
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	171227b2-0dea-4568-a0d0-d8da39293bfb
12301126-8177-40b6-91ee-62ee9b150aec	f9921a4b-049e-4757-bdbf-18d72e948537
12301126-8177-40b6-91ee-62ee9b150aec	171227b2-0dea-4568-a0d0-d8da39293bfb
415b52c5-eeff-4bc1-ae7c-7bcb8862455a	a1f09ca2-a32f-425d-915b-ef4c543c476a
cf6cd38c-4d9a-4ec6-b4dd-cc3fdb3c72b5	d59ba452-737c-4c39-851f-6485aa6713a9
415b52c5-eeff-4bc1-ae7c-7bcb8862455a	5607af5d-8d31-42e4-a88d-3945f8ccd17c
5607af5d-8d31-42e4-a88d-3945f8ccd17c	bb918485-c243-46f3-87d4-d1889c5e1d7e
0b3cb824-eddb-4ba8-80cf-2af8c1df8d48	b60e8a85-efc0-49fb-8257-0c2e70d1b95e
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	99123171-c8c2-4b80-9fb4-6238cd8d5e9c
415b52c5-eeff-4bc1-ae7c-7bcb8862455a	b9b92eb1-5e28-4ba0-be54-cd698df008f7
415b52c5-eeff-4bc1-ae7c-7bcb8862455a	47f182f0-d282-4488-9c81-098b1bdc785d
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	64f4f937-8102-412f-a508-8b30bd1e60df
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	b8a0f179-19f6-4fd4-a2fd-391c1789a14f
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	8b57db9b-9c69-45dc-940c-15ede5cfe62c
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	4c9d8c01-1b67-44e8-a51a-daac77ce9139
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	dacc1dce-cb4d-49f2-b9d5-e2b6b40904c1
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	2b39b5f1-7701-4116-9abb-42c49d944056
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	08b5af0f-0bad-4f09-ae73-573b78556edd
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	49323885-fe85-456d-b153-46311862674a
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	eca2f910-3bd8-47c7-9fa5-61a5ef517719
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	bf1f8154-3555-4747-a4f6-4ad97ac0a661
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	a66d7f1b-cff9-4e28-abf1-3ac6c71a2bd9
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	65f9e651-06cd-4211-9772-0293b68a865f
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	2b94c865-a31e-40c0-9b3e-a1e7f3e0e8f4
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	62404b1b-f4dd-4334-8a9b-f5c02bd4398b
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	d467e7fe-1206-41c9-9fe4-9bd02dabe533
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	bedd6945-ee1c-4c40-a0b0-c560ac08b2bb
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	4144bdab-2a48-442b-b62f-06b6110702e2
4c9d8c01-1b67-44e8-a51a-daac77ce9139	d467e7fe-1206-41c9-9fe4-9bd02dabe533
8b57db9b-9c69-45dc-940c-15ede5cfe62c	4144bdab-2a48-442b-b62f-06b6110702e2
8b57db9b-9c69-45dc-940c-15ede5cfe62c	62404b1b-f4dd-4334-8a9b-f5c02bd4398b
364a8005-b1c3-469e-a131-27e4d5e06340	e578903e-47b9-4d92-b9be-411313b5884e
364a8005-b1c3-469e-a131-27e4d5e06340	52bb6611-3887-4fea-ab30-39225f36f3d0
364a8005-b1c3-469e-a131-27e4d5e06340	5bb2fa47-0e2c-4c98-a1d8-e00ec0d34d4f
364a8005-b1c3-469e-a131-27e4d5e06340	137bdb3a-25bf-41ce-82ac-0ce8d7ef91ce
364a8005-b1c3-469e-a131-27e4d5e06340	7aed636a-5def-4c50-b5f7-618321a36e11
364a8005-b1c3-469e-a131-27e4d5e06340	c3a72ce0-f590-40c6-a620-a988b0376825
364a8005-b1c3-469e-a131-27e4d5e06340	c0b6e507-71c9-497b-b401-a8741834d4ce
364a8005-b1c3-469e-a131-27e4d5e06340	49f42704-56e4-4aea-b9d1-457f4fd38fb3
364a8005-b1c3-469e-a131-27e4d5e06340	8fc92887-4d49-4ef8-877b-1af16b98ba94
364a8005-b1c3-469e-a131-27e4d5e06340	56bf7966-2023-4522-83be-ca66ea7ebd12
364a8005-b1c3-469e-a131-27e4d5e06340	1de8589c-764e-4904-a12d-b7a88010702b
364a8005-b1c3-469e-a131-27e4d5e06340	68a19383-6819-4c45-8f54-fe7d875a2c07
364a8005-b1c3-469e-a131-27e4d5e06340	dffb3863-ce99-43b5-835f-8b439274538d
364a8005-b1c3-469e-a131-27e4d5e06340	6fd6ffc0-2426-4019-b05d-939f7e2dc06c
364a8005-b1c3-469e-a131-27e4d5e06340	a28e765d-c32b-4423-bf1a-410a62241727
364a8005-b1c3-469e-a131-27e4d5e06340	3e70acf4-a726-4360-9073-32d452da6db9
364a8005-b1c3-469e-a131-27e4d5e06340	68b64ca4-a5b7-4380-8948-045e9ac9d942
137bdb3a-25bf-41ce-82ac-0ce8d7ef91ce	a28e765d-c32b-4423-bf1a-410a62241727
5bb2fa47-0e2c-4c98-a1d8-e00ec0d34d4f	68b64ca4-a5b7-4380-8948-045e9ac9d942
5bb2fa47-0e2c-4c98-a1d8-e00ec0d34d4f	6fd6ffc0-2426-4019-b05d-939f7e2dc06c
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	ea415296-b113-428c-a93a-cc4a3421684b
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	c2f8be08-f52a-4697-9f35-3060d7e30e64
c2f8be08-f52a-4697-9f35-3060d7e30e64	e24bca48-1487-40ce-9cc4-b3874e643547
20ce2b75-44fc-4d2e-aa4d-bccc6917b958	0f8c513d-3786-42bc-b4f8-87c0002ce2dd
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	6c5738d4-bb41-4836-9681-daeb9633635c
364a8005-b1c3-469e-a131-27e4d5e06340	b0c90a3c-3a51-4107-97d0-9c94d0118487
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	da5fbb23-0af6-4618-ba2f-0c7df3abb1e0
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	a5cf30a2-6103-4597-99c9-e8fbcaa79bbc
\.

--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority, version) FROM stdin;
a6465f52-be65-42b2-b79e-df37272dc342	\N	password	f0949a79-c15b-4f64-8f46-1de2545cae14	1772101855811	\N	{"value":"dOYPCvq8x0ReNwxI1Rhj4rtbC9oqp34J/du6wTqioNU=","salt":"4mTiAqPbdxtSVLlLO8Znxg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
1823e8d4-ad7f-45be-ae15-38e68e675433	\N	password	1167ffcb-9b74-40da-97cf-94bfadd5a99d	1773294131103	My password	{"value":"WVezI9dEBeLwrZNLeLnBUfPUw96Hfq3EBLF1m30HW1M=","salt":"QHczTaZa56IOWOkPGW8d4g==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	1
4dfc37b6-2f0b-4b36-8f12-ad30714b59f2	\N	password	e18f96fb-61ca-472e-beaa-68dd99a6081e	1773409210481	\N	{"value":"LlScJm8GTi0sAlSEBrfBxYZek1LGQXShyZ3E0ZMJIQE=","salt":"1VEPeOidUwrUtGpRpu2TeQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
5c370fe3-b2aa-494f-8e98-b3bba37c73c6	\N	password	fe708873-b3cf-4234-a772-9eaa2d9be2df	1773060216897	\N	{"value":"MpDY0TRpFurZgwtnBxwOZZH+zzGROkgNJrNaazDgiZQ=","salt":"qPGHBPAMPQIQqvxndsjPDA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	3
4a5825ea-fa1a-4b3a-965d-7edf0b99d730	\N	password	ae90a340-11bf-4a23-b52e-16228da17213	1773149449312	\N	{"value":"/z+jmyvzT3tundsVFSCRomWCKp/yH3l3YAIQeRuE48s=","salt":"hmquxMdO47M+UXWIroy9hA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
3df54737-8779-4497-8116-8706cafa6c86	\N	password	8889b000-efa9-45e6-8039-cec381bfe1f9	1773410616901	\N	{"value":"AO5wIhcDsV6jaRHLaQ0G+ieTvWvc5NekbY2lgpup2tM=","salt":"grXWqdg2kwY2G1VuhBFvZg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
d114135e-27d9-4bbc-8a0a-79f01179a8bd	\N	password	5b3ee9d0-09e1-4e7c-b1de-8834cb556621	1773495468625	\N	{"value":"/zytjuDRXZ20bHeSVIhdeDwC71heldx9dD6/2hnNFpo=","salt":"oO2axkDTzZ64bgnDsC3yxg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
50cdd8ba-92b7-490e-8b92-2acf75be5719	\N	password	c2400918-3904-4eca-9a29-7411798bdde3	1773410970377	\N	{"value":"PJvGPNwDykAo2VeOtmR1f/DuR4SmKe3GhMnXUueggsw=","salt":"mx7w0IbhkRCzriTsUbgdzQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
588dff08-dc28-4885-935a-783fe10cde3d	\N	password	4882e302-8df3-4430-b60f-444b85a975cd	1773495902288	\N	{"value":"9epaB+YJMQqcktYhJfXtkbq3iHfm+FsVvt6H5y2/uq0=","salt":"NdGXmhbTAfwkLtTNcAE3lw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
b7546b00-aae2-4c40-b473-c21cf56b5870	\N	password	88b54d5a-6d9d-4241-98c8-672170338819	1773489570276	\N	{"value":"pCRv7VjMZobm/exoXKq3b/XpmGNXOS/3mx9J8puq+tw=","salt":"QWUaO33DG5WZNNywwA78HQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	1
e34f2686-5d5e-43c1-a9e2-3a7bddf80c17	\N	password	e6086cbd-e8d1-4653-858c-8db3efcb55fa	1773646902582	\N	{"value":"Z8+2tKx3Y9FTf1IVLEIUe47EasMyKFVjgLTuRLk55KY=","salt":"QWuClksU+7/QIpey/N6z8g==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	1
13a746b7-5af6-46b8-a96f-e96818193f10	\N	password	023b1f46-6352-4be7-ad6f-eb51f59524b9	1773494934332	\N	{"value":"/G0vz/7iMg/Y6BpwtOeqXJlj0oWh73KtY+7PACKagq8=","salt":"JzLg6CmtsrpdtQ9PmeTHMA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
84ea500e-c4b8-4f81-9822-a02c4b0f110e	\N	password	cb363695-d4a6-4f83-9f2e-2241d23e0c57	1773654984919	\N	{"value":"6pl9tgBmi3sjV64bWhu6gBWUNSpt7Gwu2aftySWiGVU=","salt":"PzKHQTKZPrDXLg1UaOTzCg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	6
375a8c57-8032-454a-8647-56afdec637be	\N	password	81d461f6-3226-4957-bf3e-33c45ac10ed0	1773646181025	\N	{"value":"h7TlzaWIJqlxh11PCUlKRYd+muKFfD34o2RzQWfRBxs=","salt":"upV1hHzRdTHZou1R+Cb/qg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	1
11f322a0-d002-446c-a953-9f172b896af5	\N	password	db1fc5a5-deed-42eb-828b-5c555698f990	1773693997384	My password	{"value":"UAGT4ZYWC/71eyNDkWJhlJ3bwNlMMRZlMsZi24qAwq4=","salt":"81e+kBiPtvTLmrU+dL4o7A==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	1
b4b3fd39-b850-4ba8-afdb-f0c83736ffb4	\N	password	b1ef69eb-bac2-4d3a-9f0b-171e8cc004af	1773664451951	\N	{"value":"mMJCs2imNODcpqoKaplrF3YY9J6o/lSPU9ezHFlxKbo=","salt":"b3H1bGSsaNOU5D5F2djHkw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
4f33ad73-5853-493e-a9cf-66bf9aa0115e	\N	password	d4e28bba-de8d-4685-997e-78908579acc0	1773712095494	My password	{"value":"o+KkzHVe3MvLu+3wRr00+uabaBLdOBVPV8KcakbAWNQ=","salt":"foyhIKsjV8Mn/pqz3bgiWw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	1
1d8e7d26-8191-4817-a55e-261cc11e9e0c	\N	password	3bc4b222-9fa8-46c0-acc8-3186b561f545	1773758479445	\N	{"value":"0SEBlK4X7HCEC3zevp2sg0k6Kea0lmqtUTq6u3MpHqc=","salt":"5Unda7mstyk19NroeIhjIg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
e0e0ea42-3175-4174-9181-d9a9e3835fca	\N	password	206c22e3-de43-42d5-a769-2dd0a8562cb0	1773926772671	\N	{"value":"WZYu+/mVRVmy7bS+9bNiUV4rNh4qPkBkyAHXkH7k8zQ=","salt":"S7y/CT7YnJprjwU/aWx7Pw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
33317012-0afa-4a8a-a2e2-3d2777d63dff	\N	password	676374c2-0baa-4e63-8cc0-ff4f5b844755	1774116741876	\N	{"value":"1naRS/0+ee0GikMlwsw3lYUwyqU0YC6a2Q/xCQY/XRE=","salt":"8KB00NgJfG8FERsSEaRq0w==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	8
fb2b2474-7e79-41a7-af93-425ebc4a0b62	\N	password	cbb668ab-5f85-4e8e-b167-c504971c84f9	1774252124436	\N	{"value":"ERcsEi1G0pRjDcp7B5fNMcsyU8TM0pxc2ftWJs/eLLE=","salt":"naAS23zBsBXTonJhLX/JsA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
edc54312-be83-487f-91b1-92e3d9882981	\N	password	a397868c-c9f2-4a90-9885-4c22c875aea7	1774255334555	\N	{"value":"XObr7fEYxChxkgKPVPVMA/f6UYipmYCtIG+wV4shLOs=","salt":"Q28nMkGuASu9oKkA1D7tfA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
f4eb1de4-2d05-46c4-b62c-0d173d755cf7	\N	password	52549e3e-8931-491e-94fd-1aae25eba5af	1774275273822	\N	{"value":"tde7Gs7fsYaXKGjx5GolP5jWVzKLNU3JWXtmdpwSzHg=","salt":"jsx7ZqKBMtuxJNdflyvhDg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	2
6e5718fd-05fd-443f-b85f-1fa51d76b768	\N	password	fe2abd63-7c6b-40f4-a55b-cf0599a7b3d4	1774277700747	\N	{"value":"71gR2rQRkX7cuC3HE6xCg23LwlZV99f29oPYEMjS6q4=","salt":"NhVi1WIXCE+ieDEU++qd5Q==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
123b1b40-8040-4d4c-91d8-9dcef75dd326	\N	password	a0a3fd0a-0936-45a0-a4b9-fca607fc69e0	1774279045687	\N	{"value":"D67DXYSF5M5B8SG6CZ5bSLiuCVHQxd3yhVM8oEa0ZHw=","salt":"hJzbr6MdwR2Se55Jz0RKIg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
28af367f-2456-4046-a5a5-f8e3f4ddc767	\N	password	dd2ca154-0481-4d12-a36b-478f0cc72253	1774360476918	\N	{"value":"kw7RlrOcXQ0N/r/h/sqM5M41ATCY0bZznZCb2Ty4ubk=","salt":"JcZCdHThoLq7/r8pUlN4BA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
a0a391b9-29d8-4d32-a525-3dee700fdd43	\N	password	f45c2296-bfa3-488c-97f3-b8c1869253fc	1774465250702	\N	{"value":"OVvsh73URtWy+wlBYAgxyn5R6uto2osJdc0HWAgsrww=","salt":"sscTgdSqEGBkpxjQbNNjEg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
614bc918-c517-4d51-8a1b-494e25fcf235	\N	password	60ca2a05-a5e1-4214-aab9-4abf52b22557	1774864049688	\N	{"value":"C90X9ZN4ngGWLhXrYh2zLDYlfVRt+BDyNVuQUv28YQo=","salt":"p+ihQ/EzEA7HyFxXMXshFg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
b9438a2a-fd76-4452-8dd8-e2652d669d28	\N	password	cf172056-0b84-4046-8037-293cf69f95f5	1774864372474	\N	{"value":"9ivqDuN/90+N9s76kt0tp0nudvmAcdgZf0ZiM9X9Mw8=","salt":"IchBokZEtbBI5FCyWIG7cQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
0f29c9ed-d22f-4a1f-a089-7bd47b90d812	\N	password	dceee8a7-beb9-4908-8553-aa1015aa4311	1774944142275	\N	{"value":"bZmW7a4yXXsM/qcLzs8krIAx2j48eYqTZYd+1d9ju4w=","salt":"b1tOFhTxc7Ds5GD1a3SGrA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
f7c8e99f-e080-4e27-8217-e44a804a6bad	\N	password	ec6bccf3-affe-40f8-990f-6948a4e46ef8	1774948837478	\N	{"value":"Cx4aG2IrAIuf738ii0MArEo8G1uiZCjppE2uMASqELs=","salt":"orOo4N50Tk7YBD4AtLtPVQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
8362d0de-cfa0-4b7f-beff-2df2f0fcee23	\N	password	a3583c57-e3a5-4694-92f6-8d4505f9839a	1774957535884	\N	{"value":"a0S1xrYR1kKDlCCeR2XfRZLGt/k7B7xFhuWJj1IHOHc=","salt":"863ruJcw8xZkafeY0m6Igg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
f04e5dfb-6146-45f7-98ad-fc0b18677b8a	\N	password	e8852ed8-954f-4322-b78b-b571ef350275	1774968070695	\N	{"value":"pMgvGqI/z670Qrc3S7uQnvvDlajHiMDa/OoYmIGYT2A=","salt":"774YNKnvmMPYm6s4xuezcA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
60ecf35d-7254-4ecf-a21d-1daed02470de	\N	password	048c2de6-2d96-4928-a522-fa92da2dee8d	1775028711940	\N	{"value":"4JvTfqW60Vy3vU5cfcoBJDbE4ep9AC9u5EAw8vinbAw=","salt":"42zCqu0p6rBLFyuAJKjsPg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
1c00661c-636b-44ae-99c8-b167faec848d	\N	password	93588d7f-3447-4084-8f3c-5db7bf08a3b1	1775038776010	\N	{"value":"wVBthf5n5RTXNpiJha1OfyCzs1GL4JppBroFvmKw3Z0=","salt":"znfUfdLj2mVr+zXIvbLAjg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
32f63c12-7c51-4a93-95ca-04c98b54b1a9	\N	password	94f7dffa-ba0a-4b82-b1a4-6da7bbd8ab7d	1775041033721	\N	{"value":"23Cf7qUn2NRCgWFl9L4E6UMa1HLfO+WFIodgQawPBnA=","salt":"2UGqk0wHEbTzc1HICwGkww==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
cd9c087c-c132-462c-bf50-64125be31bc4	\N	password	adae6f53-20ff-43b4-b446-ab9076f20e91	1775041894557	\N	{"value":"BLWYNlOq4i6eEXuYiUuAzuaw4A0y4goYQcniGbMCgeo=","salt":"AYvnEHZE6DmUXSNAAldiMw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
caa5d145-919b-49a5-bbd0-6f231d440938	\N	password	237822d7-2bf9-4d79-a590-6bc9c6fa6c21	1775047590795	\N	{"value":"eSTYpH5wtGuXliwz97ZkCY95LHnkSA7XEFKFae0YTJU=","salt":"ATiOj2ge8LseK8Iso7AECw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
7e013d51-a8a8-43f3-9594-df0d59d45446	\N	password	144725da-ce29-4188-96ee-8b35071d4797	1775060790102	\N	{"value":"IrTU8K+KeC3zSe9ABuhd4jFqXX7c0WdAGXOFGbZtax0=","salt":"ni/k9JDRvNc19eVVGk4I/A==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
7934625c-d52a-4caa-aeb7-c2f31ebc102d	\N	password	500c4ed6-a2ca-48e7-aa91-b6e0b6d0a77a	1775114894015	\N	{"value":"XISsQf8qsBUcFDmjtbgTfzG9OSySNTNbSVskeOS2Gls=","salt":"IBNiVrTQR2T+pB2KYYVl8A==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
8f19cca7-f264-4de5-bd0f-0595bb68fa4e	\N	password	a5f338c8-2cf8-41a8-8456-8ae7d425555e	1775119742734	\N	{"value":"MfJQBZAKevfPVGOD3oam5rulJWQJrhMP7XyNxZiKotM=","salt":"MPUgrmH6ntqkbh+WYFlI+A==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
9a923f0f-dbd3-40aa-8d49-24b54994409c	\N	password	0230c74f-d858-4aa2-a87d-68a986698825	1775119825490	\N	{"value":"Fg4rObV2ze9Cf2NgBMLGZ4p1C6YREeH3t20w5R3pOXI=","salt":"Xh8n3QRuspiPZTwZtSfE5g==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
4f30ab91-c91d-4c64-a1b8-e68d67153088	\N	password	d3419d44-1755-4943-9f09-2d8eab01246f	1775134423217	\N	{"value":"eWJ03c48mNDugMgJAQONKIROKkF+82RDho2NF4X12Wg=","salt":"PYs0JbJ7r4pq2aZZmKfa9g==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
\.

--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2026-02-26 10:30:48.997561	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.33.0	\N	\N	2101846647
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2026-02-26 10:30:49.009568	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.33.0	\N	\N	2101846647
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2026-02-26 10:30:49.030453	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.33.0	\N	\N	2101846647
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2026-02-26 10:30:49.034554	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.33.0	\N	\N	2101846647
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2026-02-26 10:30:49.076936	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.33.0	\N	\N	2101846647
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2026-02-26 10:30:49.08227	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.33.0	\N	\N	2101846647
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2026-02-26 10:30:49.11752	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.33.0	\N	\N	2101846647
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2026-02-26 10:30:49.121722	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.33.0	\N	\N	2101846647
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2026-02-26 10:30:49.126425	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.33.0	\N	\N	2101846647
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2026-02-26 10:30:49.162085	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.33.0	\N	\N	2101846647
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2026-02-26 10:30:49.190107	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.33.0	\N	\N	2101846647
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2026-02-26 10:30:49.1938	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.33.0	\N	\N	2101846647
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2026-02-26 10:30:49.205229	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.33.0	\N	\N	2101846647
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2026-02-26 10:30:49.214882	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.33.0	\N	\N	2101846647
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2026-02-26 10:30:49.216322	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	2101846647
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2026-02-26 10:30:49.218716	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.33.0	\N	\N	2101846647
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2026-02-26 10:30:49.220834	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.33.0	\N	\N	2101846647
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2026-02-26 10:30:49.240823	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.33.0	\N	\N	2101846647
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2026-02-26 10:30:49.259119	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.33.0	\N	\N	2101846647
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2026-02-26 10:30:49.262517	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.33.0	\N	\N	2101846647
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2026-02-26 10:30:51.625933	119	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.33.0	\N	\N	2101846647
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2026-02-26 10:30:49.265426	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.33.0	\N	\N	2101846647
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2026-02-26 10:30:49.267979	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.33.0	\N	\N	2101846647
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2026-02-26 10:30:49.310281	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.33.0	\N	\N	2101846647
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2026-02-26 10:30:49.314312	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.33.0	\N	\N	2101846647
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2026-02-26 10:30:49.315734	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.33.0	\N	\N	2101846647
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2026-02-26 10:30:49.574688	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.33.0	\N	\N	2101846647
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2026-02-26 10:30:49.598186	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.33.0	\N	\N	2101846647
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2026-02-26 10:30:49.600725	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.33.0	\N	\N	2101846647
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2026-02-26 10:30:49.620735	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.33.0	\N	\N	2101846647
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2026-02-26 10:30:49.633505	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.33.0	\N	\N	2101846647
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2026-02-26 10:30:49.648109	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.33.0	\N	\N	2101846647
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2026-02-26 10:30:49.650982	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.33.0	\N	\N	2101846647
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2026-02-26 10:30:49.655822	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	2101846647
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2026-02-26 10:30:49.657705	34	MARK_RAN	9:f9753208029f582525ed12011a19d054	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.33.0	\N	\N	2101846647
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2026-02-26 10:30:49.669798	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.33.0	\N	\N	2101846647
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2026-02-26 10:30:49.674335	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.33.0	\N	\N	2101846647
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2026-02-26 10:30:49.678951	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	2101846647
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2026-02-26 10:30:49.681863	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.33.0	\N	\N	2101846647
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2026-02-26 10:30:49.684676	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.33.0	\N	\N	2101846647
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2026-02-26 10:30:49.685934	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.33.0	\N	\N	2101846647
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2026-02-26 10:30:49.687634	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.33.0	\N	\N	2101846647
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2026-02-26 10:30:49.690438	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.33.0	\N	\N	2101846647
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2026-02-26 10:30:50.590835	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.33.0	\N	\N	2101846647
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2026-02-26 10:30:50.595075	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.33.0	\N	\N	2101846647
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2026-02-26 10:30:50.598579	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.33.0	\N	\N	2101846647
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2026-02-26 10:30:50.60114	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.33.0	\N	\N	2101846647
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2026-02-26 10:30:50.602527	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.33.0	\N	\N	2101846647
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2026-02-26 10:30:50.667925	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.33.0	\N	\N	2101846647
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2026-02-26 10:30:50.671559	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.33.0	\N	\N	2101846647
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2026-02-26 10:30:50.682448	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.33.0	\N	\N	2101846647
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2026-02-26 10:30:50.872423	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.33.0	\N	\N	2101846647
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2026-02-26 10:30:50.875875	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	2101846647
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2026-02-26 10:30:50.878193	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.33.0	\N	\N	2101846647
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2026-02-26 10:30:50.880051	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.33.0	\N	\N	2101846647
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2026-02-26 10:30:50.883767	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.33.0	\N	\N	2101846647
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2026-02-26 10:30:50.886776	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.33.0	\N	\N	2101846647
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2026-02-26 10:30:50.910458	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.33.0	\N	\N	2101846647
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2026-02-26 10:30:51.092841	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.33.0	\N	\N	2101846647
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2026-02-26 10:30:51.102303	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.33.0	\N	\N	2101846647
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2026-02-26 10:30:51.10678	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.33.0	\N	\N	2101846647
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2026-02-26 10:30:51.112151	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.33.0	\N	\N	2101846647
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2026-02-26 10:30:51.114834	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.33.0	\N	\N	2101846647
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2026-02-26 10:30:51.117954	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.33.0	\N	\N	2101846647
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2026-02-26 10:30:51.11992	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.33.0	\N	\N	2101846647
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2026-02-26 10:30:51.12195	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.33.0	\N	\N	2101846647
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2026-02-26 10:30:51.144254	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.33.0	\N	\N	2101846647
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2026-02-26 10:30:51.164401	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.33.0	\N	\N	2101846647
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2026-02-26 10:30:51.167754	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.33.0	\N	\N	2101846647
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2026-02-26 10:30:51.194011	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.33.0	\N	\N	2101846647
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2026-02-26 10:30:51.198153	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.33.0	\N	\N	2101846647
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2026-02-26 10:30:51.201574	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.33.0	\N	\N	2101846647
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2026-02-26 10:30:51.206045	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.33.0	\N	\N	2101846647
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2026-02-26 10:30:51.210276	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.33.0	\N	\N	2101846647
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2026-02-26 10:30:51.212549	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.33.0	\N	\N	2101846647
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2026-02-26 10:30:51.223003	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.33.0	\N	\N	2101846647
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2026-02-26 10:30:51.245661	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.33.0	\N	\N	2101846647
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2026-02-26 10:30:51.248914	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.33.0	\N	\N	2101846647
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2026-02-26 10:30:51.250251	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.33.0	\N	\N	2101846647
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2026-02-26 10:30:51.260498	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.33.0	\N	\N	2101846647
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2026-02-26 10:30:51.262038	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.33.0	\N	\N	2101846647
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2026-02-26 10:30:51.28391	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.33.0	\N	\N	2101846647
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2026-02-26 10:30:51.285238	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	2101846647
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2026-02-26 10:30:51.289073	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	2101846647
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2026-02-26 10:30:51.290349	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	2101846647
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2026-02-26 10:30:51.313495	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.33.0	\N	\N	2101846647
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2026-02-26 10:30:51.317	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.33.0	\N	\N	2101846647
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2026-02-26 10:30:51.322052	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.33.0	\N	\N	2101846647
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2026-02-26 10:30:51.326409	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.33.0	\N	\N	2101846647
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2026-02-26 10:30:51.330089	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.33.0	\N	\N	2101846647
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2026-02-26 10:30:51.33445	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.33.0	\N	\N	2101846647
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2026-02-26 10:30:51.35505	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	2101846647
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2026-02-26 10:30:51.359414	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.33.0	\N	\N	2101846647
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2026-02-26 10:30:51.360846	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.33.0	\N	\N	2101846647
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2026-02-26 10:30:51.365516	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.33.0	\N	\N	2101846647
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2026-02-26 10:30:51.367065	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.33.0	\N	\N	2101846647
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2026-02-26 10:30:51.370951	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.33.0	\N	\N	2101846647
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2026-02-26 10:30:51.422886	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	2101846647
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2026-02-26 10:30:51.424417	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	2101846647
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2026-02-26 10:30:51.431995	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	2101846647
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2026-02-26 10:30:51.454994	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	2101846647
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2026-02-26 10:30:51.456475	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	2101846647
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2026-02-26 10:30:51.478542	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.33.0	\N	\N	2101846647
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2026-02-26 10:30:51.482352	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.33.0	\N	\N	2101846647
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2026-02-26 10:30:51.48798	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.33.0	\N	\N	2101846647
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2026-02-26 10:30:51.508078	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.33.0	\N	\N	2101846647
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2026-02-26 10:30:51.531447	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.33.0	\N	\N	2101846647
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2026-02-26 10:30:51.554572	107	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.33.0	\N	\N	2101846647
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2026-02-26 10:30:51.557916	108	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.33.0	\N	\N	2101846647
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2026-02-26 10:30:51.579028	109	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.33.0	\N	\N	2101846647
20.0.0-12964-supported-dbs-edb-migration	keycloak	META-INF/jpa-changelog-20.0.0.xml	2026-02-26 10:30:51.602569	110	EXECUTED	9:a6b18a8e38062df5793edbe064f4aecd	dropIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE; createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.33.0	\N	\N	2101846647
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2026-02-26 10:30:51.604148	111	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.33.0	\N	\N	2101846647
client-attributes-string-accomodation-fixed-pre-drop-index	keycloak	META-INF/jpa-changelog-20.0.0.xml	2026-02-26 10:30:51.607464	112	EXECUTED	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	2101846647
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2026-02-26 10:30:51.610889	113	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	2101846647
client-attributes-string-accomodation-fixed-post-create-index	keycloak	META-INF/jpa-changelog-20.0.0.xml	2026-02-26 10:30:51.612117	114	MARK_RAN	9:bd2bd0fc7768cf0845ac96a8786fa735	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	2101846647
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2026-02-26 10:30:51.614425	115	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.33.0	\N	\N	2101846647
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2026-02-26 10:30:51.620209	116	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.33.0	\N	\N	2101846647
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2026-02-26 10:30:51.622102	117	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.33.0	\N	\N	2101846647
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2026-02-26 10:30:51.624698	118	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.33.0	\N	\N	2101846647
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2026-02-26 10:30:51.629633	120	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.33.0	\N	\N	2101846647
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2026-02-26 10:30:51.632318	121	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.33.0	\N	\N	2101846647
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2026-02-26 10:30:51.70512	122	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.33.0	\N	\N	2101846647
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2026-02-26 10:30:51.707741	123	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.33.0	\N	\N	2101846647
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2026-02-26 10:30:51.710981	124	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	2101846647
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2026-02-26 10:30:51.731716	125	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	2101846647
24.0.0-26618-edb-migration	keycloak	META-INF/jpa-changelog-24.0.0.xml	2026-02-26 10:30:51.753532	126	EXECUTED	9:2f684b29d414cd47efe3a3599f390741	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES; createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	2101846647
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2026-02-26 10:30:51.756162	127	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.33.0	\N	\N	2101846647
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2026-02-26 10:30:51.758124	128	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	2101846647
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2026-02-26 10:30:51.759827	129	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	2101846647
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2026-02-26 10:30:51.763683	130	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.33.0	\N	\N	2101846647
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2026-02-26 10:30:51.784367	131	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	2101846647
25.0.0-28265-index-cleanup-uss-createdon	keycloak	META-INF/jpa-changelog-25.0.0.xml	2026-02-26 10:30:51.789801	132	EXECUTED	9:78ab4fc129ed5e8265dbcc3485fba92f	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	2101846647
25.0.0-28265-index-cleanup-uss-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2026-02-26 10:30:51.794445	133	EXECUTED	9:de5f7c1f7e10994ed8b62e621d20eaab	dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	2101846647
25.0.0-28265-index-cleanup-uss-by-usersess	keycloak	META-INF/jpa-changelog-25.0.0.xml	2026-02-26 10:30:51.800019	134	EXECUTED	9:6eee220d024e38e89c799417ec33667f	dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	2101846647
25.0.0-28265-index-cleanup-css-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2026-02-26 10:30:51.805156	135	EXECUTED	9:5411d2fb2891d3e8d63ddb55dfa3c0c9	dropIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION		\N	4.33.0	\N	\N	2101846647
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2026-02-26 10:30:51.806647	136	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	2101846647
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2026-02-26 10:30:51.827032	137	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	2101846647
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2026-02-26 10:30:51.832745	138	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.33.0	\N	\N	2101846647
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2026-02-26 10:30:51.838049	139	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.33.0	\N	\N	2101846647
unique-consentuser-edb-migration	keycloak	META-INF/jpa-changelog-25.0.0.xml	2026-02-26 10:30:51.843531	140	MARK_RAN	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.33.0	\N	\N	2101846647
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2026-02-26 10:30:51.845239	141	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.33.0	\N	\N	2101846647
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2026-02-26 10:30:51.894036	142	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.33.0	\N	\N	2101846647
26.0.0-org-alias	keycloak	META-INF/jpa-changelog-26.0.0.xml	2026-02-26 10:30:51.898401	143	EXECUTED	9:6ef7d63e4412b3c2d66ed179159886a4	addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG		\N	4.33.0	\N	\N	2101846647
26.0.0-org-group	keycloak	META-INF/jpa-changelog-26.0.0.xml	2026-02-26 10:30:51.903436	144	EXECUTED	9:da8e8087d80ef2ace4f89d8c5b9ca223	addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange		\N	4.33.0	\N	\N	2101846647
26.0.0-org-indexes	keycloak	META-INF/jpa-changelog-26.0.0.xml	2026-02-26 10:30:51.923565	145	EXECUTED	9:79b05dcd610a8c7f25ec05135eec0857	createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN		\N	4.33.0	\N	\N	2101846647
26.0.0-org-group-membership	keycloak	META-INF/jpa-changelog-26.0.0.xml	2026-02-26 10:30:51.927217	146	EXECUTED	9:a6ace2ce583a421d89b01ba2a28dc2d4	addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP		\N	4.33.0	\N	\N	2101846647
31296-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2026-02-26 10:30:51.9308	147	EXECUTED	9:64ef94489d42a358e8304b0e245f0ed4	createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN		\N	4.33.0	\N	\N	2101846647
31725-index-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2026-02-26 10:30:51.951654	148	EXECUTED	9:b994246ec2bf7c94da881e1d28782c7b	createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN		\N	4.33.0	\N	\N	2101846647
26.0.0-idps-for-login	keycloak	META-INF/jpa-changelog-26.0.0.xml	2026-02-26 10:30:51.993036	149	EXECUTED	9:51f5fffadf986983d4bd59582c6c1604	addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange		\N	4.33.0	\N	\N	2101846647
26.0.0-32583-drop-redundant-index-on-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2026-02-26 10:30:51.99777	150	EXECUTED	9:24972d83bf27317a055d234187bb4af9	dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION		\N	4.33.0	\N	\N	2101846647
26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2026-02-26 10:30:52.00418	151	EXECUTED	9:febdc0f47f2ed241c59e60f58c3ceea5	dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...		\N	4.33.0	\N	\N	2101846647
26.0.0-33201-org-redirect-url	keycloak	META-INF/jpa-changelog-26.0.0.xml	2026-02-26 10:30:52.006834	152	EXECUTED	9:4d0e22b0ac68ebe9794fa9cb752ea660	addColumn tableName=ORG		\N	4.33.0	\N	\N	2101846647
29399-jdbc-ping-default	keycloak	META-INF/jpa-changelog-26.1.0.xml	2026-02-26 10:30:52.010392	153	EXECUTED	9:007dbe99d7203fca403b89d4edfdf21e	createTable tableName=JGROUPS_PING; addPrimaryKey constraintName=CONSTRAINT_JGROUPS_PING, tableName=JGROUPS_PING		\N	4.33.0	\N	\N	2101846647
26.1.0-34013	keycloak	META-INF/jpa-changelog-26.1.0.xml	2026-02-26 10:30:52.013956	154	EXECUTED	9:e6b686a15759aef99a6d758a5c4c6a26	addColumn tableName=ADMIN_EVENT_ENTITY		\N	4.33.0	\N	\N	2101846647
26.1.0-34380	keycloak	META-INF/jpa-changelog-26.1.0.xml	2026-02-26 10:30:52.016745	155	EXECUTED	9:ac8b9edb7c2b6c17a1c7a11fcf5ccf01	dropTable tableName=USERNAME_LOGIN_FAILURE		\N	4.33.0	\N	\N	2101846647
26.2.0-36750	keycloak	META-INF/jpa-changelog-26.2.0.xml	2026-02-26 10:30:52.020001	156	EXECUTED	9:b49ce951c22f7eb16480ff085640a33a	createTable tableName=SERVER_CONFIG		\N	4.33.0	\N	\N	2101846647
26.2.0-26106	keycloak	META-INF/jpa-changelog-26.2.0.xml	2026-02-26 10:30:52.022673	157	EXECUTED	9:b5877d5dab7d10ff3a9d209d7beb6680	addColumn tableName=CREDENTIAL		\N	4.33.0	\N	\N	2101846647
26.2.6-39866-duplicate	keycloak	META-INF/jpa-changelog-26.2.6.xml	2026-02-26 10:30:52.024766	158	EXECUTED	9:1dc67ccee24f30331db2cba4f372e40e	customChange		\N	4.33.0	\N	\N	2101846647
26.2.6-39866-uk	keycloak	META-INF/jpa-changelog-26.2.6.xml	2026-02-26 10:30:52.02767	159	EXECUTED	9:b70b76f47210cf0a5f4ef0e219eac7cd	addUniqueConstraint constraintName=UK_MIGRATION_VERSION, tableName=MIGRATION_MODEL		\N	4.33.0	\N	\N	2101846647
26.2.6-40088-duplicate	keycloak	META-INF/jpa-changelog-26.2.6.xml	2026-02-26 10:30:52.029723	160	EXECUTED	9:cc7e02ed69ab31979afb1982f9670e8f	customChange		\N	4.33.0	\N	\N	2101846647
26.2.6-40088-uk	keycloak	META-INF/jpa-changelog-26.2.6.xml	2026-02-26 10:30:52.03216	161	EXECUTED	9:5bb848128da7bc4595cc507383325241	addUniqueConstraint constraintName=UK_MIGRATION_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.33.0	\N	\N	2101846647
26.3.0-groups-description	keycloak	META-INF/jpa-changelog-26.3.0.xml	2026-02-26 10:30:52.034826	162	EXECUTED	9:e1a3c05574326fb5b246b73b9a4c4d49	addColumn tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	2101846647
26.4.0-40933-saml-encryption-attributes	keycloak	META-INF/jpa-changelog-26.4.0.xml	2026-02-26 10:30:52.036893	163	EXECUTED	9:7e9eaba362ca105efdda202303a4fe49	customChange		\N	4.33.0	\N	\N	2101846647
26.4.0-51321	keycloak	META-INF/jpa-changelog-26.4.0.xml	2026-02-26 10:30:52.055846	164	EXECUTED	9:34bab2bc56f75ffd7e347c580874e306	createIndex indexName=IDX_EVENT_ENTITY_USER_ID_TYPE, tableName=EVENT_ENTITY		\N	4.33.0	\N	\N	2101846647
40343-workflow-state-table	keycloak	META-INF/jpa-changelog-26.4.0.xml	2026-02-26 10:30:52.090732	165	EXECUTED	9:ed3ab4723ceed210e5b5e60ac4562106	createTable tableName=WORKFLOW_STATE; addPrimaryKey constraintName=PK_WORKFLOW_STATE, tableName=WORKFLOW_STATE; addUniqueConstraint constraintName=UQ_WORKFLOW_RESOURCE, tableName=WORKFLOW_STATE; createIndex indexName=IDX_WORKFLOW_STATE_STEP, table...		\N	4.33.0	\N	\N	2101846647
26.5.0-index-offline-css-by-client	keycloak	META-INF/jpa-changelog-26.5.0.xml	2026-02-26 10:30:52.110575	166	EXECUTED	9:383e981ce95d16e32af757b7998820f7	createIndex indexName=IDX_OFFLINE_CSS_BY_CLIENT, tableName=OFFLINE_CLIENT_SESSION		\N	4.33.0	\N	\N	2101846647
26.5.0-index-offline-css-by-client-storage-provider	keycloak	META-INF/jpa-changelog-26.5.0.xml	2026-02-26 10:30:52.130811	167	EXECUTED	9:f5bc200e6fa7d7e483854dee535ca425	createIndex indexName=IDX_OFFLINE_CSS_BY_CLIENT_STORAGE_PROVIDER, tableName=OFFLINE_CLIENT_SESSION		\N	4.33.0	\N	\N	2101846647
\.

--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
\.

--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
345a4401-4184-4713-959a-273d7f8fe7d8	279cd9ad-27d4-41d0-a41f-deb236e5eb7e	f
345a4401-4184-4713-959a-273d7f8fe7d8	e169428c-8210-485d-b4d6-51ac0508a7a7	t
345a4401-4184-4713-959a-273d7f8fe7d8	9de0f3c1-94e4-4b37-9be6-290e9e70dbb1	t
345a4401-4184-4713-959a-273d7f8fe7d8	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6	t
345a4401-4184-4713-959a-273d7f8fe7d8	3aaec0aa-6d5f-4383-bd0e-64d449f0f4ad	t
345a4401-4184-4713-959a-273d7f8fe7d8	ba7666c5-bd3a-4216-a1b3-6b8e0618db50	f
345a4401-4184-4713-959a-273d7f8fe7d8	c98d8ab5-3ed4-41c4-8ab9-711dd26fedf9	f
345a4401-4184-4713-959a-273d7f8fe7d8	7670374c-38c8-4ce1-afc7-3233d6c5afb7	t
345a4401-4184-4713-959a-273d7f8fe7d8	23ab64b0-6621-4890-8a67-546712a626cc	t
345a4401-4184-4713-959a-273d7f8fe7d8	dbd5c158-6752-4bfd-b55d-0ff621d0255c	f
345a4401-4184-4713-959a-273d7f8fe7d8	6a70d0f6-8746-4464-b5aa-d9ec7bd8c011	t
345a4401-4184-4713-959a-273d7f8fe7d8	2434b2c5-1e4e-4d85-9222-922081123890	f
345a4401-4184-4713-959a-273d7f8fe7d8	fe482c73-148f-419e-9019-51fb4bed5502	t
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	17fa8a05-6fa4-4260-b3e6-cd827d25060f	f
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	cef7df65-ceb0-412e-8b66-0e91eeaff99e	t
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	3afb8b4f-6aae-4fa9-b985-ee63be61d8c8	t
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	4753d207-1667-426f-b578-a14ef8e62c3e	t
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	e8f77819-59bf-46fc-925b-895b1ad6afa8	t
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	8c09b9cd-6516-46d9-8beb-6bc5dbffde0e	f
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	1849dac8-8a3a-4083-9897-bca83c73e5e0	f
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	7d3ccd02-8d97-4481-a0a8-09fc972bde94	t
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	a1118fdc-93e8-46be-a9c5-d3c8daad7426	t
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	55d2d135-58ec-41e8-9b67-32add6ca139a	f
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	52f7182c-9781-40dc-957d-03d402db06da	t
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	3e08b33b-8105-4f3c-879d-dcecca0be295	t
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	0f708434-54d7-4362-b40d-68ad95fc14f5	f
\.

--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.

--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.

--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.

--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.

--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.

--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.

--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.

--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.

--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.

--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.

--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.

--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin; \.

--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
\.

--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.

--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.

--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.

--
-- Data for Name: jgroups_ping; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.jgroups_ping (address, name, cluster_name, ip, coord) FROM stdin;
uuid://00000000-0000-0000-0000-000000000007	keycloak-0-56897	ISPN	10.244.1.31:7800	t
\.

--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.keycloak_group (id, name, parent_group, realm_id, type, description) FROM stdin;
aaf9f8dd-0872-430d-b672-9e42d425b14f	dummy	 	345a4401-4184-4713-959a-273d7f8fe7d8	0	dummy phno
\.

--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
415b52c5-eeff-4bc1-ae7c-7bcb8862455a	345a4401-4184-4713-959a-273d7f8fe7d8	f	${role_default-roles}	default-roles-master	345a4401-4184-4713-959a-273d7f8fe7d8	\N	\N
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	345a4401-4184-4713-959a-273d7f8fe7d8	f	${role_admin}	admin	345a4401-4184-4713-959a-273d7f8fe7d8	\N	\N
7a4d80cb-4d51-454b-aa31-d5086199973e	345a4401-4184-4713-959a-273d7f8fe7d8	f	${role_create-realm}	create-realm	345a4401-4184-4713-959a-273d7f8fe7d8	\N	\N
f2099631-f753-4eee-b2d0-ea0f5a75c475	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_create-client}	create-client	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
7502179f-611e-40a4-a94d-6861d4477dba	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_view-realm}	view-realm	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
12301126-8177-40b6-91ee-62ee9b150aec	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_view-users}	view-users	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
cf6cd38c-4d9a-4ec6-b4dd-cc3fdb3c72b5	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_view-clients}	view-clients	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
8f674b8f-388f-4e04-b6b5-a1399d52439b	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_view-events}	view-events	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
bb91cb50-4393-40e3-9a5d-bf361d3d634a	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_view-identity-providers}	view-identity-providers	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
e62cdd27-ebb2-4b6b-a48b-488bfd274906	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_view-authorization}	view-authorization	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
9298e26b-7134-494b-b334-34946fc2e59b	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_manage-realm}	manage-realm	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
e3341d41-0e1c-47e9-95dd-0ed9324d30b3	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_manage-users}	manage-users	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
887e8240-c495-48d0-958c-5c6657c64636	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_manage-clients}	manage-clients	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
6d664150-4249-4cbd-8a63-ffd3837fed56	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_manage-events}	manage-events	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
316f4eb0-d681-4946-a166-c7af709bfcc6	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_manage-identity-providers}	manage-identity-providers	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
d3764067-daa1-46bb-bf50-d550e5846959	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_manage-authorization}	manage-authorization	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
f9921a4b-049e-4757-bdbf-18d72e948537	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_query-users}	query-users	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
d59ba452-737c-4c39-851f-6485aa6713a9	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_query-clients}	query-clients	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
98ddd54d-a1cf-46da-a821-1ca7c52624e8	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_query-realms}	query-realms	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
171227b2-0dea-4568-a0d0-d8da39293bfb	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_query-groups}	query-groups	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
a1f09ca2-a32f-425d-915b-ef4c543c476a	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	t	${role_view-profile}	view-profile	345a4401-4184-4713-959a-273d7f8fe7d8	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	\N
5607af5d-8d31-42e4-a88d-3945f8ccd17c	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	t	${role_manage-account}	manage-account	345a4401-4184-4713-959a-273d7f8fe7d8	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	\N
bb918485-c243-46f3-87d4-d1889c5e1d7e	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	t	${role_manage-account-links}	manage-account-links	345a4401-4184-4713-959a-273d7f8fe7d8	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	\N
ae184ac9-e4fc-47f2-9a3c-cacb27c4c334	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	t	${role_view-applications}	view-applications	345a4401-4184-4713-959a-273d7f8fe7d8	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	\N
b60e8a85-efc0-49fb-8257-0c2e70d1b95e	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	t	${role_view-consent}	view-consent	345a4401-4184-4713-959a-273d7f8fe7d8	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	\N
0b3cb824-eddb-4ba8-80cf-2af8c1df8d48	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	t	${role_manage-consent}	manage-consent	345a4401-4184-4713-959a-273d7f8fe7d8	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	\N
892f40d7-0dba-46b1-bf6f-8c3a2f49dbb2	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	t	${role_view-groups}	view-groups	345a4401-4184-4713-959a-273d7f8fe7d8	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	\N
cb97af9c-624f-4f3a-9806-1a639b472d9d	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	t	${role_delete-account}	delete-account	345a4401-4184-4713-959a-273d7f8fe7d8	ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	\N
3bebd1c6-1841-465c-9cb7-ba6860848044	d571bab1-a113-458c-a963-a83900f6b6b9	t	${role_read-token}	read-token	345a4401-4184-4713-959a-273d7f8fe7d8	d571bab1-a113-458c-a963-a83900f6b6b9	\N
99123171-c8c2-4b80-9fb4-6238cd8d5e9c	0882bff5-d2f7-42ed-bae0-181c59835dfa	t	${role_impersonation}	impersonation	345a4401-4184-4713-959a-273d7f8fe7d8	0882bff5-d2f7-42ed-bae0-181c59835dfa	\N
b9b92eb1-5e28-4ba0-be54-cd698df008f7	345a4401-4184-4713-959a-273d7f8fe7d8	f	${role_offline-access}	offline_access	345a4401-4184-4713-959a-273d7f8fe7d8	\N	\N
47f182f0-d282-4488-9c81-098b1bdc785d	345a4401-4184-4713-959a-273d7f8fe7d8	f	${role_uma_authorization}	uma_authorization	345a4401-4184-4713-959a-273d7f8fe7d8	\N	\N
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	f	${role_default-roles}	default-roles-jalsoochak-system	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	\N	\N
64f4f937-8102-412f-a508-8b30bd1e60df	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_create-client}	create-client	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
b8a0f179-19f6-4fd4-a2fd-391c1789a14f	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_view-realm}	view-realm	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
8b57db9b-9c69-45dc-940c-15ede5cfe62c	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_view-users}	view-users	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
4c9d8c01-1b67-44e8-a51a-daac77ce9139	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_view-clients}	view-clients	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
dacc1dce-cb4d-49f2-b9d5-e2b6b40904c1	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_view-events}	view-events	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
2b39b5f1-7701-4116-9abb-42c49d944056	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_view-identity-providers}	view-identity-providers	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
08b5af0f-0bad-4f09-ae73-573b78556edd	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_view-authorization}	view-authorization	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
49323885-fe85-456d-b153-46311862674a	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_manage-realm}	manage-realm	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
eca2f910-3bd8-47c7-9fa5-61a5ef517719	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_manage-users}	manage-users	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
bf1f8154-3555-4747-a4f6-4ad97ac0a661	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_manage-clients}	manage-clients	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
a66d7f1b-cff9-4e28-abf1-3ac6c71a2bd9	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_manage-events}	manage-events	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
65f9e651-06cd-4211-9772-0293b68a865f	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_manage-identity-providers}	manage-identity-providers	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
2b94c865-a31e-40c0-9b3e-a1e7f3e0e8f4	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_manage-authorization}	manage-authorization	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
62404b1b-f4dd-4334-8a9b-f5c02bd4398b	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_query-users}	query-users	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
d467e7fe-1206-41c9-9fe4-9bd02dabe533	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_query-clients}	query-clients	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
bedd6945-ee1c-4c40-a0b0-c560ac08b2bb	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_query-realms}	query-realms	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
4144bdab-2a48-442b-b62f-06b6110702e2	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_query-groups}	query-groups	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
364a8005-b1c3-469e-a131-27e4d5e06340	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_realm-admin}	realm-admin	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
e578903e-47b9-4d92-b9be-411313b5884e	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_create-client}	create-client	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
52bb6611-3887-4fea-ab30-39225f36f3d0	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_view-realm}	view-realm	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
5bb2fa47-0e2c-4c98-a1d8-e00ec0d34d4f	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_view-users}	view-users	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
137bdb3a-25bf-41ce-82ac-0ce8d7ef91ce	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_view-clients}	view-clients	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
7aed636a-5def-4c50-b5f7-618321a36e11	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_view-events}	view-events	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
c3a72ce0-f590-40c6-a620-a988b0376825	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_view-identity-providers}	view-identity-providers	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
c0b6e507-71c9-497b-b401-a8741834d4ce	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_view-authorization}	view-authorization	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
49f42704-56e4-4aea-b9d1-457f4fd38fb3	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_manage-realm}	manage-realm	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
8fc92887-4d49-4ef8-877b-1af16b98ba94	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_manage-users}	manage-users	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
56bf7966-2023-4522-83be-ca66ea7ebd12	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_manage-clients}	manage-clients	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
1de8589c-764e-4904-a12d-b7a88010702b	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_manage-events}	manage-events	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
68a19383-6819-4c45-8f54-fe7d875a2c07	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_manage-identity-providers}	manage-identity-providers	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
dffb3863-ce99-43b5-835f-8b439274538d	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_manage-authorization}	manage-authorization	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
6fd6ffc0-2426-4019-b05d-939f7e2dc06c	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_query-users}	query-users	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
a28e765d-c32b-4423-bf1a-410a62241727	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_query-clients}	query-clients	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
3e70acf4-a726-4360-9073-32d452da6db9	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_query-realms}	query-realms	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
68b64ca4-a5b7-4380-8948-045e9ac9d942	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_query-groups}	query-groups	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
ea415296-b113-428c-a93a-cc4a3421684b	b627e058-48c9-4c24-a3c1-4e678e99c1e1	t	${role_view-profile}	view-profile	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	b627e058-48c9-4c24-a3c1-4e678e99c1e1	\N
c2f8be08-f52a-4697-9f35-3060d7e30e64	b627e058-48c9-4c24-a3c1-4e678e99c1e1	t	${role_manage-account}	manage-account	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	b627e058-48c9-4c24-a3c1-4e678e99c1e1	\N
e24bca48-1487-40ce-9cc4-b3874e643547	b627e058-48c9-4c24-a3c1-4e678e99c1e1	t	${role_manage-account-links}	manage-account-links	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	b627e058-48c9-4c24-a3c1-4e678e99c1e1	\N
1de18aaa-6d96-4388-bf90-51bea902f87f	b627e058-48c9-4c24-a3c1-4e678e99c1e1	t	${role_view-applications}	view-applications	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	b627e058-48c9-4c24-a3c1-4e678e99c1e1	\N
0f8c513d-3786-42bc-b4f8-87c0002ce2dd	b627e058-48c9-4c24-a3c1-4e678e99c1e1	t	${role_view-consent}	view-consent	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	b627e058-48c9-4c24-a3c1-4e678e99c1e1	\N
20ce2b75-44fc-4d2e-aa4d-bccc6917b958	b627e058-48c9-4c24-a3c1-4e678e99c1e1	t	${role_manage-consent}	manage-consent	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	b627e058-48c9-4c24-a3c1-4e678e99c1e1	\N
e07a872e-679b-45be-8997-3f79051d3288	b627e058-48c9-4c24-a3c1-4e678e99c1e1	t	${role_view-groups}	view-groups	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	b627e058-48c9-4c24-a3c1-4e678e99c1e1	\N
2c1fec41-bba9-4c10-8cb6-d829cf53f24a	b627e058-48c9-4c24-a3c1-4e678e99c1e1	t	${role_delete-account}	delete-account	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	b627e058-48c9-4c24-a3c1-4e678e99c1e1	\N
6c5738d4-bb41-4836-9681-daeb9633635c	549ccf4a-fba8-49c8-869c-69f94e19b8f1	t	${role_impersonation}	impersonation	345a4401-4184-4713-959a-273d7f8fe7d8	549ccf4a-fba8-49c8-869c-69f94e19b8f1	\N
b0c90a3c-3a51-4107-97d0-9c94d0118487	70e4395b-86b7-497b-bd41-236eac2aad6b	t	${role_impersonation}	impersonation	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	70e4395b-86b7-497b-bd41-236eac2aad6b	\N
a13f73bd-1a06-4a28-b9b6-59f3155a92e6	5c6d446d-0355-4b2c-8746-ae46f20420e6	t	${role_read-token}	read-token	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	5c6d446d-0355-4b2c-8746-ae46f20420e6	\N
da5fbb23-0af6-4618-ba2f-0c7df3abb1e0	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	f	${role_offline-access}	offline_access	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	\N	\N
a5cf30a2-6103-4597-99c9-e8fbcaa79bbc	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	f	${role_uma_authorization}	uma_authorization	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	\N	\N
1081e9d7-a3d2-4a21-be6d-8374e7145768	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	f	Full system access — cross-tenant admin operations. Create other super user & state admins. Works at the National level. Minimum there should be 1 super user.	SUPER_USER	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	\N	\N
bd143611-7a68-410b-80b7-7de95d5fed56	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	f	Tenant-scoped admin. Create other state admins. Works at the Tenant (State/UT) level. Minimum there should be 1 active state admin for each tenant.	STATE_ADMIN	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	\N	\N
e78bcfd5-4a4c-4014-869b-8d0c561b1bec	345a4401-4184-4713-959a-273d7f8fe7d8	f	super user	SUPER_USER	345a4401-4184-4713-959a-273d7f8fe7d8	\N	\N
\.

--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.migration_model (id, version, update_time) FROM stdin;
18ckb	26.4.6	1772101854
\.

--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
\.

--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
\.

--
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
\.

--
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin; \.

--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.policy_config (policy_id, name, value) FROM stdin; \.

--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
5a6958ff-7e58-44f3-8687-54cd9ae33024	audience resolve	openid-connect	oidc-audience-resolve-mapper	eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	\N
5810c4e6-7cd6-4850-a75a-92a1d841da03	locale	openid-connect	oidc-usermodel-attribute-mapper	c75ada75-7228-463d-81bc-2d96e1253ae5	\N
3a5062b5-7624-4202-8efd-5815786df6ed	role list	saml	saml-role-list-mapper	\N	e169428c-8210-485d-b4d6-51ac0508a7a7
3e057e44-37ec-4b71-a8cc-3ddef3cbcf12	organization	saml	saml-organization-membership-mapper	\N	9de0f3c1-94e4-4b37-9be6-290e9e70dbb1
f3d6b157-d188-4d3e-8f49-16ccbec7d7ef	full name	openid-connect	oidc-full-name-mapper	\N	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6
33bd2dd1-5306-4508-8626-8887f6eadf61	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6
79438090-fbf7-4ec1-95c9-90fb6a065a43	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6
0328d070-31cb-4b2d-a07c-da25ad30243c	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6
4f824e5e-83ab-4af1-94ad-c306d241d6f1	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6
c15db933-134d-4a52-b4a8-e37d2b27896e	username	openid-connect	oidc-usermodel-attribute-mapper	\N	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6
8be42e75-93d4-49ef-9219-8e86b8243c51	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6
8b716f03-fcf1-4563-a2b6-fdee006ed4cb	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6
4e7fa4dd-0b1e-4c47-8d03-9debb3eefd68	website	openid-connect	oidc-usermodel-attribute-mapper	\N	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6
7eebe603-9009-4f07-b4aa-4fe8aefa456a	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6
87dd21cb-0aad-4d07-99a6-42a70d8f1fb8	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6
3dd4581c-ab12-48b4-b82b-f2349c4fbf29	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6
4078d52e-89d6-4494-8be9-4d25b8e44f85	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6
7e09831e-8ad9-479f-8c16-ccc1ba898235	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	c6ef5496-9ea3-4061-a2e7-f5839ebc93f6
f4d08e8e-4c1c-40e3-bab9-4d5879224a4f	email	openid-connect	oidc-usermodel-attribute-mapper	\N	3aaec0aa-6d5f-4383-bd0e-64d449f0f4ad
35f1372a-a070-40f6-827f-9c9cd44deaf9	email verified	openid-connect	oidc-usermodel-property-mapper	\N	3aaec0aa-6d5f-4383-bd0e-64d449f0f4ad
18f82b82-acd4-4aef-bb87-eff942bfe978	address	openid-connect	oidc-address-mapper	\N	ba7666c5-bd3a-4216-a1b3-6b8e0618db50
4b5f0148-707b-4578-b9d5-f9c73ab6060b	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	c98d8ab5-3ed4-41c4-8ab9-711dd26fedf9
a70cbfa7-1aa0-47e9-b276-b31781b96868	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	c98d8ab5-3ed4-41c4-8ab9-711dd26fedf9
96e2729c-d722-4e96-8c99-6d8d98dff58d	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	7670374c-38c8-4ce1-afc7-3233d6c5afb7
4b817f79-5270-4e7b-8ae1-b289d192dad2	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	7670374c-38c8-4ce1-afc7-3233d6c5afb7
3b3cb7c1-dffb-4304-9dbe-70696150be5a	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	7670374c-38c8-4ce1-afc7-3233d6c5afb7
4a9d5bf8-2929-4481-8f67-c1cecc2f0292	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	23ab64b0-6621-4890-8a67-546712a626cc
35afd694-9a76-415b-8ea8-2fbf8949daee	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	dbd5c158-6752-4bfd-b55d-0ff621d0255c
407a174e-faa8-47ee-ae1b-f4619f2f49e8	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	dbd5c158-6752-4bfd-b55d-0ff621d0255c
46dbe1b5-be5e-4d04-9d19-c515550db9ba	acr loa level	openid-connect	oidc-acr-mapper	\N	fe482c73-148f-419e-9019-51fb4bed5502
a84b8b5f-e568-4181-a122-7a4107dc0219	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	6a70d0f6-8746-4464-b5aa-d9ec7bd8c011
33e5fb23-4ef5-44df-a512-36bbade969ac	sub	openid-connect	oidc-sub-mapper	\N	6a70d0f6-8746-4464-b5aa-d9ec7bd8c011
9abd706d-86ba-4225-b145-d108c1c8c865	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	b65c9fc0-d67a-43a9-b07e-35aeb20529f0
a4f27d29-c557-405a-8ca7-95f7ccfc2429	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	b65c9fc0-d67a-43a9-b07e-35aeb20529f0
6cb3e2e4-b7b1-4f40-9010-57ea660ec6ba	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	b65c9fc0-d67a-43a9-b07e-35aeb20529f0
95f63df7-5f9f-420f-8438-758e7717c096	organization	openid-connect	oidc-organization-membership-mapper	\N	2434b2c5-1e4e-4d85-9222-922081123890
d9a006e7-72a6-4158-ab69-bb8887327f22	audience resolve	openid-connect	oidc-audience-resolve-mapper	e6be4642-3e50-4ec2-8531-7f97846e3e1b	\N
9537341e-17e8-420f-b964-e9855eb0664a	role list	saml	saml-role-list-mapper	\N	cef7df65-ceb0-412e-8b66-0e91eeaff99e
820c0e67-2012-4317-a7bc-e0b7e1ddf643	organization	saml	saml-organization-membership-mapper	\N	3afb8b4f-6aae-4fa9-b985-ee63be61d8c8
8e51591f-edde-441d-9bc7-99ebc577911d	full name	openid-connect	oidc-full-name-mapper	\N	4753d207-1667-426f-b578-a14ef8e62c3e
7977e639-9a7c-4e53-9a5d-a43888d1144b	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	4753d207-1667-426f-b578-a14ef8e62c3e
9e140793-4e98-4f87-9f03-e92acd526a62	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	4753d207-1667-426f-b578-a14ef8e62c3e
6fb1b65a-6ff9-41ee-abd4-65630dbc3a8e	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	4753d207-1667-426f-b578-a14ef8e62c3e
893c0c7f-dd6c-4a54-b0d5-fa030e33d1d2	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	4753d207-1667-426f-b578-a14ef8e62c3e
989c1db2-10e0-41ee-a0f9-f925bd5a38bc	username	openid-connect	oidc-usermodel-attribute-mapper	\N	4753d207-1667-426f-b578-a14ef8e62c3e
c0411399-4829-45d7-a102-9ba56a21dbf7	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	4753d207-1667-426f-b578-a14ef8e62c3e
c6a58271-4431-4419-91e9-0b1891daf422	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	4753d207-1667-426f-b578-a14ef8e62c3e
b617c337-eb9a-4528-9d8a-113f89fb83ed	website	openid-connect	oidc-usermodel-attribute-mapper	\N	4753d207-1667-426f-b578-a14ef8e62c3e
b2c87314-0ffe-4a36-8ae6-95b6e0ba12eb	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	4753d207-1667-426f-b578-a14ef8e62c3e
df1379f8-14eb-4da2-979e-52af9030682d	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	4753d207-1667-426f-b578-a14ef8e62c3e
8fe5a1a9-75bb-48b9-af23-364022160b68	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	4753d207-1667-426f-b578-a14ef8e62c3e
af987870-0abd-4f88-8f1b-735bf999f79b	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	4753d207-1667-426f-b578-a14ef8e62c3e
da556282-c6cb-4544-864e-8f978f647824	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	4753d207-1667-426f-b578-a14ef8e62c3e
9febf6a3-f3a8-46da-8a08-8897be51be6f	email	openid-connect	oidc-usermodel-attribute-mapper	\N	e8f77819-59bf-46fc-925b-895b1ad6afa8
ce0a3578-dcd8-4aad-a3de-a8ff27ee570a	email verified	openid-connect	oidc-usermodel-property-mapper	\N	e8f77819-59bf-46fc-925b-895b1ad6afa8
62e067f0-86fd-4430-91b2-9a541412b819	address	openid-connect	oidc-address-mapper	\N	8c09b9cd-6516-46d9-8beb-6bc5dbffde0e
005ed372-a598-4505-a523-95e1d25aa2f6	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	1849dac8-8a3a-4083-9897-bca83c73e5e0
2074a7c0-e5d7-43e3-a56b-b6241ab20d2b	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	1849dac8-8a3a-4083-9897-bca83c73e5e0
b9bddda1-61ab-42cc-b080-4e221ce9d0a4	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	7d3ccd02-8d97-4481-a0a8-09fc972bde94
4cfc078a-29ba-4e57-afec-435749d4b604	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	7d3ccd02-8d97-4481-a0a8-09fc972bde94
1065e6bf-d40c-4dc3-81dc-81a7281d4aa5	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	7d3ccd02-8d97-4481-a0a8-09fc972bde94
dc11110d-3462-4c33-a783-ae7fd5173e3d	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	a1118fdc-93e8-46be-a9c5-d3c8daad7426
872a55d4-f8db-4ded-b18d-c06056413971	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	55d2d135-58ec-41e8-9b67-32add6ca139a
48937fac-d158-4343-8990-2c3f106a18c4	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	55d2d135-58ec-41e8-9b67-32add6ca139a
0cf67637-a5d8-484a-9ce8-3a40a204be67	acr loa level	openid-connect	oidc-acr-mapper	\N	52f7182c-9781-40dc-957d-03d402db06da
0f673d6d-1b0c-415d-b986-5c44db570c1f	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	3e08b33b-8105-4f3c-879d-dcecca0be295
2bba4deb-89cb-491e-b4f5-912c25fbe6c1	sub	openid-connect	oidc-sub-mapper	\N	3e08b33b-8105-4f3c-879d-dcecca0be295
ade7b998-e996-4d97-99f8-11f10c5f65a8	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	19317eab-83fc-4cf8-a0a2-228239c25d4a
ce0a9dd1-d170-4d04-8379-88a8960488f3	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	19317eab-83fc-4cf8-a0a2-228239c25d4a
0fb729cc-1404-49a2-9e2e-9e3ae206dd28	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	19317eab-83fc-4cf8-a0a2-228239c25d4a
5404cfdb-05bf-4ed5-9946-640558b02548	organization	openid-connect	oidc-organization-membership-mapper	\N	0f708434-54d7-4362-b40d-68ad95fc14f5
66e9f1c5-42ba-4e52-aa8d-62adbfe46887	locale	openid-connect	oidc-usermodel-attribute-mapper	2a74862e-2165-4e23-aec8-daa79e9ddcd1	\N
b8b75b7d-074f-41d7-b5aa-d3fc113488ae	realm-roles	openid-connect	oidc-usermodel-realm-role-mapper	eaf18766-7489-4693-a788-95fe5a56096a	\N
2c43a846-d1d5-4c5b-a284-a57fcd58f433	tenant_state_code	openid-connect	oidc-usermodel-attribute-mapper	eaf18766-7489-4693-a788-95fe5a56096a	\N
27cb48e5-72a2-4e1f-b8f7-df48b1d5bbd1	user_type	openid-connect	oidc-usermodel-attribute-mapper	eaf18766-7489-4693-a788-95fe5a56096a	\N
\.

--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
5810c4e6-7cd6-4850-a75a-92a1d841da03	true	introspection.token.claim
5810c4e6-7cd6-4850-a75a-92a1d841da03	true	userinfo.token.claim
5810c4e6-7cd6-4850-a75a-92a1d841da03	locale	user.attribute
5810c4e6-7cd6-4850-a75a-92a1d841da03	true	id.token.claim
5810c4e6-7cd6-4850-a75a-92a1d841da03	true	access.token.claim
5810c4e6-7cd6-4850-a75a-92a1d841da03	locale	claim.name
5810c4e6-7cd6-4850-a75a-92a1d841da03	String	jsonType.label
3a5062b5-7624-4202-8efd-5815786df6ed	false	single
3a5062b5-7624-4202-8efd-5815786df6ed	Basic	attribute.nameformat
3a5062b5-7624-4202-8efd-5815786df6ed	Role	attribute.name
0328d070-31cb-4b2d-a07c-da25ad30243c	true	introspection.token.claim
0328d070-31cb-4b2d-a07c-da25ad30243c	true	userinfo.token.claim
0328d070-31cb-4b2d-a07c-da25ad30243c	middleName	user.attribute
0328d070-31cb-4b2d-a07c-da25ad30243c	true	id.token.claim
0328d070-31cb-4b2d-a07c-da25ad30243c	true	access.token.claim
0328d070-31cb-4b2d-a07c-da25ad30243c	middle_name	claim.name
0328d070-31cb-4b2d-a07c-da25ad30243c	String	jsonType.label
33bd2dd1-5306-4508-8626-8887f6eadf61	true	introspection.token.claim
33bd2dd1-5306-4508-8626-8887f6eadf61	true	userinfo.token.claim
33bd2dd1-5306-4508-8626-8887f6eadf61	lastName	user.attribute
33bd2dd1-5306-4508-8626-8887f6eadf61	true	id.token.claim
33bd2dd1-5306-4508-8626-8887f6eadf61	true	access.token.claim
33bd2dd1-5306-4508-8626-8887f6eadf61	family_name	claim.name
33bd2dd1-5306-4508-8626-8887f6eadf61	String	jsonType.label
3dd4581c-ab12-48b4-b82b-f2349c4fbf29	true	introspection.token.claim
3dd4581c-ab12-48b4-b82b-f2349c4fbf29	true	userinfo.token.claim
3dd4581c-ab12-48b4-b82b-f2349c4fbf29	zoneinfo	user.attribute
3dd4581c-ab12-48b4-b82b-f2349c4fbf29	true	id.token.claim
3dd4581c-ab12-48b4-b82b-f2349c4fbf29	true	access.token.claim
3dd4581c-ab12-48b4-b82b-f2349c4fbf29	zoneinfo	claim.name
3dd4581c-ab12-48b4-b82b-f2349c4fbf29	String	jsonType.label
4078d52e-89d6-4494-8be9-4d25b8e44f85	true	introspection.token.claim
4078d52e-89d6-4494-8be9-4d25b8e44f85	true	userinfo.token.claim
4078d52e-89d6-4494-8be9-4d25b8e44f85	locale	user.attribute
4078d52e-89d6-4494-8be9-4d25b8e44f85	true	id.token.claim
4078d52e-89d6-4494-8be9-4d25b8e44f85	true	access.token.claim
4078d52e-89d6-4494-8be9-4d25b8e44f85	locale	claim.name
4078d52e-89d6-4494-8be9-4d25b8e44f85	String	jsonType.label
4e7fa4dd-0b1e-4c47-8d03-9debb3eefd68	true	introspection.token.claim
4e7fa4dd-0b1e-4c47-8d03-9debb3eefd68	true	userinfo.token.claim
4e7fa4dd-0b1e-4c47-8d03-9debb3eefd68	website	user.attribute
4e7fa4dd-0b1e-4c47-8d03-9debb3eefd68	true	id.token.claim
4e7fa4dd-0b1e-4c47-8d03-9debb3eefd68	true	access.token.claim
4e7fa4dd-0b1e-4c47-8d03-9debb3eefd68	website	claim.name
4e7fa4dd-0b1e-4c47-8d03-9debb3eefd68	String	jsonType.label
4f824e5e-83ab-4af1-94ad-c306d241d6f1	true	introspection.token.claim
4f824e5e-83ab-4af1-94ad-c306d241d6f1	true	userinfo.token.claim
4f824e5e-83ab-4af1-94ad-c306d241d6f1	nickname	user.attribute
4f824e5e-83ab-4af1-94ad-c306d241d6f1	true	id.token.claim
4f824e5e-83ab-4af1-94ad-c306d241d6f1	true	access.token.claim
4f824e5e-83ab-4af1-94ad-c306d241d6f1	nickname	claim.name
4f824e5e-83ab-4af1-94ad-c306d241d6f1	String	jsonType.label
79438090-fbf7-4ec1-95c9-90fb6a065a43	true	introspection.token.claim
79438090-fbf7-4ec1-95c9-90fb6a065a43	true	userinfo.token.claim
79438090-fbf7-4ec1-95c9-90fb6a065a43	firstName	user.attribute
79438090-fbf7-4ec1-95c9-90fb6a065a43	true	id.token.claim
79438090-fbf7-4ec1-95c9-90fb6a065a43	true	access.token.claim
79438090-fbf7-4ec1-95c9-90fb6a065a43	given_name	claim.name
79438090-fbf7-4ec1-95c9-90fb6a065a43	String	jsonType.label
7e09831e-8ad9-479f-8c16-ccc1ba898235	true	introspection.token.claim
7e09831e-8ad9-479f-8c16-ccc1ba898235	true	userinfo.token.claim
7e09831e-8ad9-479f-8c16-ccc1ba898235	updatedAt	user.attribute
7e09831e-8ad9-479f-8c16-ccc1ba898235	true	id.token.claim
7e09831e-8ad9-479f-8c16-ccc1ba898235	true	access.token.claim
7e09831e-8ad9-479f-8c16-ccc1ba898235	updated_at	claim.name
7e09831e-8ad9-479f-8c16-ccc1ba898235	long	jsonType.label
7eebe603-9009-4f07-b4aa-4fe8aefa456a	true	introspection.token.claim
7eebe603-9009-4f07-b4aa-4fe8aefa456a	true	userinfo.token.claim
7eebe603-9009-4f07-b4aa-4fe8aefa456a	gender	user.attribute
7eebe603-9009-4f07-b4aa-4fe8aefa456a	true	id.token.claim
7eebe603-9009-4f07-b4aa-4fe8aefa456a	true	access.token.claim
7eebe603-9009-4f07-b4aa-4fe8aefa456a	gender	claim.name
7eebe603-9009-4f07-b4aa-4fe8aefa456a	String	jsonType.label
87dd21cb-0aad-4d07-99a6-42a70d8f1fb8	true	introspection.token.claim
87dd21cb-0aad-4d07-99a6-42a70d8f1fb8	true	userinfo.token.claim
87dd21cb-0aad-4d07-99a6-42a70d8f1fb8	birthdate	user.attribute
87dd21cb-0aad-4d07-99a6-42a70d8f1fb8	true	id.token.claim
87dd21cb-0aad-4d07-99a6-42a70d8f1fb8	true	access.token.claim
87dd21cb-0aad-4d07-99a6-42a70d8f1fb8	birthdate	claim.name
87dd21cb-0aad-4d07-99a6-42a70d8f1fb8	String	jsonType.label
8b716f03-fcf1-4563-a2b6-fdee006ed4cb	true	introspection.token.claim
8b716f03-fcf1-4563-a2b6-fdee006ed4cb	true	userinfo.token.claim
8b716f03-fcf1-4563-a2b6-fdee006ed4cb	picture	user.attribute
8b716f03-fcf1-4563-a2b6-fdee006ed4cb	true	id.token.claim
8b716f03-fcf1-4563-a2b6-fdee006ed4cb	true	access.token.claim
8b716f03-fcf1-4563-a2b6-fdee006ed4cb	picture	claim.name
8b716f03-fcf1-4563-a2b6-fdee006ed4cb	String	jsonType.label
8be42e75-93d4-49ef-9219-8e86b8243c51	true	introspection.token.claim
8be42e75-93d4-49ef-9219-8e86b8243c51	true	userinfo.token.claim
8be42e75-93d4-49ef-9219-8e86b8243c51	profile	user.attribute
8be42e75-93d4-49ef-9219-8e86b8243c51	true	id.token.claim
8be42e75-93d4-49ef-9219-8e86b8243c51	true	access.token.claim
8be42e75-93d4-49ef-9219-8e86b8243c51	profile	claim.name
8be42e75-93d4-49ef-9219-8e86b8243c51	String	jsonType.label
c15db933-134d-4a52-b4a8-e37d2b27896e	true	introspection.token.claim
c15db933-134d-4a52-b4a8-e37d2b27896e	true	userinfo.token.claim
c15db933-134d-4a52-b4a8-e37d2b27896e	username	user.attribute
c15db933-134d-4a52-b4a8-e37d2b27896e	true	id.token.claim
c15db933-134d-4a52-b4a8-e37d2b27896e	true	access.token.claim
c15db933-134d-4a52-b4a8-e37d2b27896e	preferred_username	claim.name
c15db933-134d-4a52-b4a8-e37d2b27896e	String	jsonType.label
f3d6b157-d188-4d3e-8f49-16ccbec7d7ef	true	introspection.token.claim
f3d6b157-d188-4d3e-8f49-16ccbec7d7ef	true	userinfo.token.claim
f3d6b157-d188-4d3e-8f49-16ccbec7d7ef	true	id.token.claim
f3d6b157-d188-4d3e-8f49-16ccbec7d7ef	true	access.token.claim
35f1372a-a070-40f6-827f-9c9cd44deaf9	true	introspection.token.claim
35f1372a-a070-40f6-827f-9c9cd44deaf9	true	userinfo.token.claim
35f1372a-a070-40f6-827f-9c9cd44deaf9	emailVerified	user.attribute
35f1372a-a070-40f6-827f-9c9cd44deaf9	true	id.token.claim
35f1372a-a070-40f6-827f-9c9cd44deaf9	true	access.token.claim
35f1372a-a070-40f6-827f-9c9cd44deaf9	email_verified	claim.name
35f1372a-a070-40f6-827f-9c9cd44deaf9	boolean	jsonType.label
f4d08e8e-4c1c-40e3-bab9-4d5879224a4f	true	introspection.token.claim
f4d08e8e-4c1c-40e3-bab9-4d5879224a4f	true	userinfo.token.claim
f4d08e8e-4c1c-40e3-bab9-4d5879224a4f	email	user.attribute
f4d08e8e-4c1c-40e3-bab9-4d5879224a4f	true	id.token.claim
f4d08e8e-4c1c-40e3-bab9-4d5879224a4f	true	access.token.claim
f4d08e8e-4c1c-40e3-bab9-4d5879224a4f	email	claim.name
f4d08e8e-4c1c-40e3-bab9-4d5879224a4f	String	jsonType.label
18f82b82-acd4-4aef-bb87-eff942bfe978	formatted	user.attribute.formatted
18f82b82-acd4-4aef-bb87-eff942bfe978	country	user.attribute.country
18f82b82-acd4-4aef-bb87-eff942bfe978	true	introspection.token.claim
18f82b82-acd4-4aef-bb87-eff942bfe978	postal_code	user.attribute.postal_code
18f82b82-acd4-4aef-bb87-eff942bfe978	true	userinfo.token.claim
18f82b82-acd4-4aef-bb87-eff942bfe978	street	user.attribute.street
18f82b82-acd4-4aef-bb87-eff942bfe978	true	id.token.claim
18f82b82-acd4-4aef-bb87-eff942bfe978	region	user.attribute.region
18f82b82-acd4-4aef-bb87-eff942bfe978	true	access.token.claim
18f82b82-acd4-4aef-bb87-eff942bfe978	locality	user.attribute.locality
4b5f0148-707b-4578-b9d5-f9c73ab6060b	true	introspection.token.claim
4b5f0148-707b-4578-b9d5-f9c73ab6060b	true	userinfo.token.claim
4b5f0148-707b-4578-b9d5-f9c73ab6060b	phoneNumber	user.attribute
4b5f0148-707b-4578-b9d5-f9c73ab6060b	true	id.token.claim
4b5f0148-707b-4578-b9d5-f9c73ab6060b	true	access.token.claim
4b5f0148-707b-4578-b9d5-f9c73ab6060b	phone_number	claim.name
4b5f0148-707b-4578-b9d5-f9c73ab6060b	String	jsonType.label
a70cbfa7-1aa0-47e9-b276-b31781b96868	true	introspection.token.claim
a70cbfa7-1aa0-47e9-b276-b31781b96868	true	userinfo.token.claim
a70cbfa7-1aa0-47e9-b276-b31781b96868	phoneNumberVerified	user.attribute
a70cbfa7-1aa0-47e9-b276-b31781b96868	true	id.token.claim
a70cbfa7-1aa0-47e9-b276-b31781b96868	true	access.token.claim
a70cbfa7-1aa0-47e9-b276-b31781b96868	phone_number_verified	claim.name
a70cbfa7-1aa0-47e9-b276-b31781b96868	boolean	jsonType.label
3b3cb7c1-dffb-4304-9dbe-70696150be5a	true	introspection.token.claim
3b3cb7c1-dffb-4304-9dbe-70696150be5a	true	access.token.claim
4b817f79-5270-4e7b-8ae1-b289d192dad2	true	introspection.token.claim
4b817f79-5270-4e7b-8ae1-b289d192dad2	true	multivalued
4b817f79-5270-4e7b-8ae1-b289d192dad2	foo	user.attribute
4b817f79-5270-4e7b-8ae1-b289d192dad2	true	access.token.claim
4b817f79-5270-4e7b-8ae1-b289d192dad2	resource_access.${client_id}.roles	claim.name
4b817f79-5270-4e7b-8ae1-b289d192dad2	String	jsonType.label
96e2729c-d722-4e96-8c99-6d8d98dff58d	true	introspection.token.claim
96e2729c-d722-4e96-8c99-6d8d98dff58d	true	multivalued
96e2729c-d722-4e96-8c99-6d8d98dff58d	foo	user.attribute
96e2729c-d722-4e96-8c99-6d8d98dff58d	true	access.token.claim
96e2729c-d722-4e96-8c99-6d8d98dff58d	realm_access.roles	claim.name
96e2729c-d722-4e96-8c99-6d8d98dff58d	String	jsonType.label
4a9d5bf8-2929-4481-8f67-c1cecc2f0292	true	introspection.token.claim
4a9d5bf8-2929-4481-8f67-c1cecc2f0292	true	access.token.claim
35afd694-9a76-415b-8ea8-2fbf8949daee	true	introspection.token.claim
35afd694-9a76-415b-8ea8-2fbf8949daee	true	userinfo.token.claim
35afd694-9a76-415b-8ea8-2fbf8949daee	username	user.attribute
35afd694-9a76-415b-8ea8-2fbf8949daee	true	id.token.claim
35afd694-9a76-415b-8ea8-2fbf8949daee	true	access.token.claim
35afd694-9a76-415b-8ea8-2fbf8949daee	upn	claim.name
35afd694-9a76-415b-8ea8-2fbf8949daee	String	jsonType.label
407a174e-faa8-47ee-ae1b-f4619f2f49e8	true	introspection.token.claim
407a174e-faa8-47ee-ae1b-f4619f2f49e8	true	multivalued
407a174e-faa8-47ee-ae1b-f4619f2f49e8	foo	user.attribute
407a174e-faa8-47ee-ae1b-f4619f2f49e8	true	id.token.claim
407a174e-faa8-47ee-ae1b-f4619f2f49e8	true	access.token.claim
407a174e-faa8-47ee-ae1b-f4619f2f49e8	groups	claim.name
407a174e-faa8-47ee-ae1b-f4619f2f49e8	String	jsonType.label
46dbe1b5-be5e-4d04-9d19-c515550db9ba	true	introspection.token.claim
46dbe1b5-be5e-4d04-9d19-c515550db9ba	true	id.token.claim
46dbe1b5-be5e-4d04-9d19-c515550db9ba	true	access.token.claim
33e5fb23-4ef5-44df-a512-36bbade969ac	true	introspection.token.claim
33e5fb23-4ef5-44df-a512-36bbade969ac	true	access.token.claim
a84b8b5f-e568-4181-a122-7a4107dc0219	AUTH_TIME	user.session.note
a84b8b5f-e568-4181-a122-7a4107dc0219	true	introspection.token.claim
a84b8b5f-e568-4181-a122-7a4107dc0219	true	id.token.claim
a84b8b5f-e568-4181-a122-7a4107dc0219	true	access.token.claim
a84b8b5f-e568-4181-a122-7a4107dc0219	auth_time	claim.name
a84b8b5f-e568-4181-a122-7a4107dc0219	long	jsonType.label
6cb3e2e4-b7b1-4f40-9010-57ea660ec6ba	clientAddress	user.session.note
6cb3e2e4-b7b1-4f40-9010-57ea660ec6ba	true	introspection.token.claim
6cb3e2e4-b7b1-4f40-9010-57ea660ec6ba	true	id.token.claim
6cb3e2e4-b7b1-4f40-9010-57ea660ec6ba	true	access.token.claim
6cb3e2e4-b7b1-4f40-9010-57ea660ec6ba	clientAddress	claim.name
6cb3e2e4-b7b1-4f40-9010-57ea660ec6ba	String	jsonType.label
9abd706d-86ba-4225-b145-d108c1c8c865	client_id	user.session.note
9abd706d-86ba-4225-b145-d108c1c8c865	true	introspection.token.claim
9abd706d-86ba-4225-b145-d108c1c8c865	true	id.token.claim
9abd706d-86ba-4225-b145-d108c1c8c865	true	access.token.claim
9abd706d-86ba-4225-b145-d108c1c8c865	client_id	claim.name
9abd706d-86ba-4225-b145-d108c1c8c865	String	jsonType.label
a4f27d29-c557-405a-8ca7-95f7ccfc2429	clientHost	user.session.note
a4f27d29-c557-405a-8ca7-95f7ccfc2429	true	introspection.token.claim
a4f27d29-c557-405a-8ca7-95f7ccfc2429	true	id.token.claim
a4f27d29-c557-405a-8ca7-95f7ccfc2429	true	access.token.claim
a4f27d29-c557-405a-8ca7-95f7ccfc2429	clientHost	claim.name
a4f27d29-c557-405a-8ca7-95f7ccfc2429	String	jsonType.label
95f63df7-5f9f-420f-8438-758e7717c096	true	introspection.token.claim
95f63df7-5f9f-420f-8438-758e7717c096	true	multivalued
95f63df7-5f9f-420f-8438-758e7717c096	true	id.token.claim
95f63df7-5f9f-420f-8438-758e7717c096	true	access.token.claim
95f63df7-5f9f-420f-8438-758e7717c096	organization	claim.name
95f63df7-5f9f-420f-8438-758e7717c096	String	jsonType.label
9537341e-17e8-420f-b964-e9855eb0664a	false	single
9537341e-17e8-420f-b964-e9855eb0664a	Basic	attribute.nameformat
9537341e-17e8-420f-b964-e9855eb0664a	Role	attribute.name
6fb1b65a-6ff9-41ee-abd4-65630dbc3a8e	true	introspection.token.claim
6fb1b65a-6ff9-41ee-abd4-65630dbc3a8e	true	userinfo.token.claim
6fb1b65a-6ff9-41ee-abd4-65630dbc3a8e	middleName	user.attribute
6fb1b65a-6ff9-41ee-abd4-65630dbc3a8e	true	id.token.claim
6fb1b65a-6ff9-41ee-abd4-65630dbc3a8e	true	access.token.claim
6fb1b65a-6ff9-41ee-abd4-65630dbc3a8e	middle_name	claim.name
6fb1b65a-6ff9-41ee-abd4-65630dbc3a8e	String	jsonType.label
7977e639-9a7c-4e53-9a5d-a43888d1144b	true	introspection.token.claim
7977e639-9a7c-4e53-9a5d-a43888d1144b	true	userinfo.token.claim
7977e639-9a7c-4e53-9a5d-a43888d1144b	lastName	user.attribute
7977e639-9a7c-4e53-9a5d-a43888d1144b	true	id.token.claim
7977e639-9a7c-4e53-9a5d-a43888d1144b	true	access.token.claim
7977e639-9a7c-4e53-9a5d-a43888d1144b	family_name	claim.name
7977e639-9a7c-4e53-9a5d-a43888d1144b	String	jsonType.label
893c0c7f-dd6c-4a54-b0d5-fa030e33d1d2	true	introspection.token.claim
893c0c7f-dd6c-4a54-b0d5-fa030e33d1d2	true	userinfo.token.claim
893c0c7f-dd6c-4a54-b0d5-fa030e33d1d2	nickname	user.attribute
893c0c7f-dd6c-4a54-b0d5-fa030e33d1d2	true	id.token.claim
893c0c7f-dd6c-4a54-b0d5-fa030e33d1d2	true	access.token.claim
893c0c7f-dd6c-4a54-b0d5-fa030e33d1d2	nickname	claim.name
893c0c7f-dd6c-4a54-b0d5-fa030e33d1d2	String	jsonType.label
8e51591f-edde-441d-9bc7-99ebc577911d	true	introspection.token.claim
8e51591f-edde-441d-9bc7-99ebc577911d	true	userinfo.token.claim
8e51591f-edde-441d-9bc7-99ebc577911d	true	id.token.claim
8e51591f-edde-441d-9bc7-99ebc577911d	true	access.token.claim
8fe5a1a9-75bb-48b9-af23-364022160b68	true	introspection.token.claim
8fe5a1a9-75bb-48b9-af23-364022160b68	true	userinfo.token.claim
8fe5a1a9-75bb-48b9-af23-364022160b68	zoneinfo	user.attribute
8fe5a1a9-75bb-48b9-af23-364022160b68	true	id.token.claim
8fe5a1a9-75bb-48b9-af23-364022160b68	true	access.token.claim
8fe5a1a9-75bb-48b9-af23-364022160b68	zoneinfo	claim.name
8fe5a1a9-75bb-48b9-af23-364022160b68	String	jsonType.label
989c1db2-10e0-41ee-a0f9-f925bd5a38bc	true	introspection.token.claim
989c1db2-10e0-41ee-a0f9-f925bd5a38bc	true	userinfo.token.claim
989c1db2-10e0-41ee-a0f9-f925bd5a38bc	username	user.attribute
989c1db2-10e0-41ee-a0f9-f925bd5a38bc	true	id.token.claim
989c1db2-10e0-41ee-a0f9-f925bd5a38bc	true	access.token.claim
989c1db2-10e0-41ee-a0f9-f925bd5a38bc	preferred_username	claim.name
989c1db2-10e0-41ee-a0f9-f925bd5a38bc	String	jsonType.label
9e140793-4e98-4f87-9f03-e92acd526a62	true	introspection.token.claim
9e140793-4e98-4f87-9f03-e92acd526a62	true	userinfo.token.claim
9e140793-4e98-4f87-9f03-e92acd526a62	firstName	user.attribute
9e140793-4e98-4f87-9f03-e92acd526a62	true	id.token.claim
9e140793-4e98-4f87-9f03-e92acd526a62	true	access.token.claim
9e140793-4e98-4f87-9f03-e92acd526a62	given_name	claim.name
9e140793-4e98-4f87-9f03-e92acd526a62	String	jsonType.label
af987870-0abd-4f88-8f1b-735bf999f79b	true	introspection.token.claim
af987870-0abd-4f88-8f1b-735bf999f79b	true	userinfo.token.claim
af987870-0abd-4f88-8f1b-735bf999f79b	locale	user.attribute
af987870-0abd-4f88-8f1b-735bf999f79b	true	id.token.claim
af987870-0abd-4f88-8f1b-735bf999f79b	true	access.token.claim
af987870-0abd-4f88-8f1b-735bf999f79b	locale	claim.name
af987870-0abd-4f88-8f1b-735bf999f79b	String	jsonType.label
b2c87314-0ffe-4a36-8ae6-95b6e0ba12eb	true	introspection.token.claim
b2c87314-0ffe-4a36-8ae6-95b6e0ba12eb	true	userinfo.token.claim
b2c87314-0ffe-4a36-8ae6-95b6e0ba12eb	gender	user.attribute
b2c87314-0ffe-4a36-8ae6-95b6e0ba12eb	true	id.token.claim
b2c87314-0ffe-4a36-8ae6-95b6e0ba12eb	true	access.token.claim
b2c87314-0ffe-4a36-8ae6-95b6e0ba12eb	gender	claim.name
b2c87314-0ffe-4a36-8ae6-95b6e0ba12eb	String	jsonType.label
b617c337-eb9a-4528-9d8a-113f89fb83ed	true	introspection.token.claim
b617c337-eb9a-4528-9d8a-113f89fb83ed	true	userinfo.token.claim
b617c337-eb9a-4528-9d8a-113f89fb83ed	website	user.attribute
b617c337-eb9a-4528-9d8a-113f89fb83ed	true	id.token.claim
b617c337-eb9a-4528-9d8a-113f89fb83ed	true	access.token.claim
b617c337-eb9a-4528-9d8a-113f89fb83ed	website	claim.name
b617c337-eb9a-4528-9d8a-113f89fb83ed	String	jsonType.label
c0411399-4829-45d7-a102-9ba56a21dbf7	true	introspection.token.claim
c0411399-4829-45d7-a102-9ba56a21dbf7	true	userinfo.token.claim
c0411399-4829-45d7-a102-9ba56a21dbf7	profile	user.attribute
c0411399-4829-45d7-a102-9ba56a21dbf7	true	id.token.claim
c0411399-4829-45d7-a102-9ba56a21dbf7	true	access.token.claim
c0411399-4829-45d7-a102-9ba56a21dbf7	profile	claim.name
c0411399-4829-45d7-a102-9ba56a21dbf7	String	jsonType.label
c6a58271-4431-4419-91e9-0b1891daf422	true	introspection.token.claim
c6a58271-4431-4419-91e9-0b1891daf422	true	userinfo.token.claim
c6a58271-4431-4419-91e9-0b1891daf422	picture	user.attribute
c6a58271-4431-4419-91e9-0b1891daf422	true	id.token.claim
c6a58271-4431-4419-91e9-0b1891daf422	true	access.token.claim
c6a58271-4431-4419-91e9-0b1891daf422	picture	claim.name
c6a58271-4431-4419-91e9-0b1891daf422	String	jsonType.label
da556282-c6cb-4544-864e-8f978f647824	true	introspection.token.claim
da556282-c6cb-4544-864e-8f978f647824	true	userinfo.token.claim
da556282-c6cb-4544-864e-8f978f647824	updatedAt	user.attribute
da556282-c6cb-4544-864e-8f978f647824	true	id.token.claim
da556282-c6cb-4544-864e-8f978f647824	true	access.token.claim
da556282-c6cb-4544-864e-8f978f647824	updated_at	claim.name
da556282-c6cb-4544-864e-8f978f647824	long	jsonType.label
df1379f8-14eb-4da2-979e-52af9030682d	true	introspection.token.claim
df1379f8-14eb-4da2-979e-52af9030682d	true	userinfo.token.claim
df1379f8-14eb-4da2-979e-52af9030682d	birthdate	user.attribute
df1379f8-14eb-4da2-979e-52af9030682d	true	id.token.claim
df1379f8-14eb-4da2-979e-52af9030682d	true	access.token.claim
df1379f8-14eb-4da2-979e-52af9030682d	birthdate	claim.name
df1379f8-14eb-4da2-979e-52af9030682d	String	jsonType.label
9febf6a3-f3a8-46da-8a08-8897be51be6f	true	introspection.token.claim
9febf6a3-f3a8-46da-8a08-8897be51be6f	true	userinfo.token.claim
9febf6a3-f3a8-46da-8a08-8897be51be6f	email	user.attribute
9febf6a3-f3a8-46da-8a08-8897be51be6f	true	id.token.claim
9febf6a3-f3a8-46da-8a08-8897be51be6f	true	access.token.claim
9febf6a3-f3a8-46da-8a08-8897be51be6f	email	claim.name
9febf6a3-f3a8-46da-8a08-8897be51be6f	String	jsonType.label
ce0a3578-dcd8-4aad-a3de-a8ff27ee570a	true	introspection.token.claim
ce0a3578-dcd8-4aad-a3de-a8ff27ee570a	true	userinfo.token.claim
ce0a3578-dcd8-4aad-a3de-a8ff27ee570a	emailVerified	user.attribute
ce0a3578-dcd8-4aad-a3de-a8ff27ee570a	true	id.token.claim
ce0a3578-dcd8-4aad-a3de-a8ff27ee570a	true	access.token.claim
ce0a3578-dcd8-4aad-a3de-a8ff27ee570a	email_verified	claim.name
ce0a3578-dcd8-4aad-a3de-a8ff27ee570a	boolean	jsonType.label
62e067f0-86fd-4430-91b2-9a541412b819	formatted	user.attribute.formatted
62e067f0-86fd-4430-91b2-9a541412b819	country	user.attribute.country
62e067f0-86fd-4430-91b2-9a541412b819	true	introspection.token.claim
62e067f0-86fd-4430-91b2-9a541412b819	postal_code	user.attribute.postal_code
62e067f0-86fd-4430-91b2-9a541412b819	true	userinfo.token.claim
62e067f0-86fd-4430-91b2-9a541412b819	street	user.attribute.street
62e067f0-86fd-4430-91b2-9a541412b819	true	id.token.claim
62e067f0-86fd-4430-91b2-9a541412b819	region	user.attribute.region
62e067f0-86fd-4430-91b2-9a541412b819	true	access.token.claim
62e067f0-86fd-4430-91b2-9a541412b819	locality	user.attribute.locality
005ed372-a598-4505-a523-95e1d25aa2f6	true	introspection.token.claim
005ed372-a598-4505-a523-95e1d25aa2f6	true	userinfo.token.claim
005ed372-a598-4505-a523-95e1d25aa2f6	phoneNumber	user.attribute
005ed372-a598-4505-a523-95e1d25aa2f6	true	id.token.claim
005ed372-a598-4505-a523-95e1d25aa2f6	true	access.token.claim
005ed372-a598-4505-a523-95e1d25aa2f6	phone_number	claim.name
005ed372-a598-4505-a523-95e1d25aa2f6	String	jsonType.label
2074a7c0-e5d7-43e3-a56b-b6241ab20d2b	true	introspection.token.claim
2074a7c0-e5d7-43e3-a56b-b6241ab20d2b	true	userinfo.token.claim
2074a7c0-e5d7-43e3-a56b-b6241ab20d2b	phoneNumberVerified	user.attribute
2074a7c0-e5d7-43e3-a56b-b6241ab20d2b	true	id.token.claim
2074a7c0-e5d7-43e3-a56b-b6241ab20d2b	true	access.token.claim
2074a7c0-e5d7-43e3-a56b-b6241ab20d2b	phone_number_verified	claim.name
2074a7c0-e5d7-43e3-a56b-b6241ab20d2b	boolean	jsonType.label
1065e6bf-d40c-4dc3-81dc-81a7281d4aa5	true	introspection.token.claim
1065e6bf-d40c-4dc3-81dc-81a7281d4aa5	true	access.token.claim
4cfc078a-29ba-4e57-afec-435749d4b604	true	introspection.token.claim
4cfc078a-29ba-4e57-afec-435749d4b604	true	multivalued
4cfc078a-29ba-4e57-afec-435749d4b604	foo	user.attribute
4cfc078a-29ba-4e57-afec-435749d4b604	true	access.token.claim
4cfc078a-29ba-4e57-afec-435749d4b604	resource_access.${client_id}.roles	claim.name
4cfc078a-29ba-4e57-afec-435749d4b604	String	jsonType.label
b9bddda1-61ab-42cc-b080-4e221ce9d0a4	true	introspection.token.claim
b9bddda1-61ab-42cc-b080-4e221ce9d0a4	true	multivalued
b9bddda1-61ab-42cc-b080-4e221ce9d0a4	foo	user.attribute
b9bddda1-61ab-42cc-b080-4e221ce9d0a4	true	access.token.claim
b9bddda1-61ab-42cc-b080-4e221ce9d0a4	realm_access.roles	claim.name
b9bddda1-61ab-42cc-b080-4e221ce9d0a4	String	jsonType.label
dc11110d-3462-4c33-a783-ae7fd5173e3d	true	introspection.token.claim
dc11110d-3462-4c33-a783-ae7fd5173e3d	true	access.token.claim
48937fac-d158-4343-8990-2c3f106a18c4	true	introspection.token.claim
48937fac-d158-4343-8990-2c3f106a18c4	true	multivalued
48937fac-d158-4343-8990-2c3f106a18c4	foo	user.attribute
48937fac-d158-4343-8990-2c3f106a18c4	true	id.token.claim
48937fac-d158-4343-8990-2c3f106a18c4	true	access.token.claim
48937fac-d158-4343-8990-2c3f106a18c4	groups	claim.name
48937fac-d158-4343-8990-2c3f106a18c4	String	jsonType.label
872a55d4-f8db-4ded-b18d-c06056413971	true	introspection.token.claim
872a55d4-f8db-4ded-b18d-c06056413971	true	userinfo.token.claim
872a55d4-f8db-4ded-b18d-c06056413971	username	user.attribute
872a55d4-f8db-4ded-b18d-c06056413971	true	id.token.claim
872a55d4-f8db-4ded-b18d-c06056413971	true	access.token.claim
872a55d4-f8db-4ded-b18d-c06056413971	upn	claim.name
872a55d4-f8db-4ded-b18d-c06056413971	String	jsonType.label
0cf67637-a5d8-484a-9ce8-3a40a204be67	true	introspection.token.claim
0cf67637-a5d8-484a-9ce8-3a40a204be67	true	id.token.claim
0cf67637-a5d8-484a-9ce8-3a40a204be67	true	access.token.claim
0f673d6d-1b0c-415d-b986-5c44db570c1f	AUTH_TIME	user.session.note
0f673d6d-1b0c-415d-b986-5c44db570c1f	true	introspection.token.claim
0f673d6d-1b0c-415d-b986-5c44db570c1f	true	id.token.claim
0f673d6d-1b0c-415d-b986-5c44db570c1f	true	access.token.claim
0f673d6d-1b0c-415d-b986-5c44db570c1f	auth_time	claim.name
0f673d6d-1b0c-415d-b986-5c44db570c1f	long	jsonType.label
2bba4deb-89cb-491e-b4f5-912c25fbe6c1	true	introspection.token.claim
2bba4deb-89cb-491e-b4f5-912c25fbe6c1	true	access.token.claim
0fb729cc-1404-49a2-9e2e-9e3ae206dd28	clientAddress	user.session.note
0fb729cc-1404-49a2-9e2e-9e3ae206dd28	true	introspection.token.claim
0fb729cc-1404-49a2-9e2e-9e3ae206dd28	true	id.token.claim
0fb729cc-1404-49a2-9e2e-9e3ae206dd28	true	access.token.claim
0fb729cc-1404-49a2-9e2e-9e3ae206dd28	clientAddress	claim.name
0fb729cc-1404-49a2-9e2e-9e3ae206dd28	String	jsonType.label
ade7b998-e996-4d97-99f8-11f10c5f65a8	client_id	user.session.note
ade7b998-e996-4d97-99f8-11f10c5f65a8	true	introspection.token.claim
ade7b998-e996-4d97-99f8-11f10c5f65a8	true	id.token.claim
ade7b998-e996-4d97-99f8-11f10c5f65a8	true	access.token.claim
ade7b998-e996-4d97-99f8-11f10c5f65a8	client_id	claim.name
ade7b998-e996-4d97-99f8-11f10c5f65a8	String	jsonType.label
ce0a9dd1-d170-4d04-8379-88a8960488f3	clientHost	user.session.note
ce0a9dd1-d170-4d04-8379-88a8960488f3	true	introspection.token.claim
ce0a9dd1-d170-4d04-8379-88a8960488f3	true	id.token.claim
ce0a9dd1-d170-4d04-8379-88a8960488f3	true	access.token.claim
ce0a9dd1-d170-4d04-8379-88a8960488f3	clientHost	claim.name
ce0a9dd1-d170-4d04-8379-88a8960488f3	String	jsonType.label
5404cfdb-05bf-4ed5-9946-640558b02548	true	introspection.token.claim
5404cfdb-05bf-4ed5-9946-640558b02548	true	multivalued
5404cfdb-05bf-4ed5-9946-640558b02548	true	id.token.claim
5404cfdb-05bf-4ed5-9946-640558b02548	true	access.token.claim
5404cfdb-05bf-4ed5-9946-640558b02548	organization	claim.name
5404cfdb-05bf-4ed5-9946-640558b02548	String	jsonType.label
66e9f1c5-42ba-4e52-aa8d-62adbfe46887	true	introspection.token.claim
66e9f1c5-42ba-4e52-aa8d-62adbfe46887	true	userinfo.token.claim
66e9f1c5-42ba-4e52-aa8d-62adbfe46887	locale	user.attribute
66e9f1c5-42ba-4e52-aa8d-62adbfe46887	true	id.token.claim
66e9f1c5-42ba-4e52-aa8d-62adbfe46887	true	access.token.claim
66e9f1c5-42ba-4e52-aa8d-62adbfe46887	locale	claim.name
66e9f1c5-42ba-4e52-aa8d-62adbfe46887	String	jsonType.label
b8b75b7d-074f-41d7-b5aa-d3fc113488ae	true	introspection.token.claim
b8b75b7d-074f-41d7-b5aa-d3fc113488ae	true	multivalued
b8b75b7d-074f-41d7-b5aa-d3fc113488ae	true	userinfo.token.claim
b8b75b7d-074f-41d7-b5aa-d3fc113488ae	true	id.token.claim
b8b75b7d-074f-41d7-b5aa-d3fc113488ae	false	lightweight.claim
b8b75b7d-074f-41d7-b5aa-d3fc113488ae	true	access.token.claim
b8b75b7d-074f-41d7-b5aa-d3fc113488ae	realm_access.roles	claim.name
b8b75b7d-074f-41d7-b5aa-d3fc113488ae	String	jsonType.label
2c43a846-d1d5-4c5b-a284-a57fcd58f433	true	introspection.token.claim
2c43a846-d1d5-4c5b-a284-a57fcd58f433	true	userinfo.token.claim
2c43a846-d1d5-4c5b-a284-a57fcd58f433	tenant_state_code	user.attribute
2c43a846-d1d5-4c5b-a284-a57fcd58f433	true	id.token.claim
2c43a846-d1d5-4c5b-a284-a57fcd58f433	false	lightweight.claim
2c43a846-d1d5-4c5b-a284-a57fcd58f433	true	access.token.claim
2c43a846-d1d5-4c5b-a284-a57fcd58f433	tenant_state_code	claim.name
2c43a846-d1d5-4c5b-a284-a57fcd58f433	String	jsonType.label
2c43a846-d1d5-4c5b-a284-a57fcd58f433	false	aggregate.attrs
2c43a846-d1d5-4c5b-a284-a57fcd58f433	false	multivalued
27cb48e5-72a2-4e1f-b8f7-df48b1d5bbd1	true	introspection.token.claim
27cb48e5-72a2-4e1f-b8f7-df48b1d5bbd1	true	userinfo.token.claim
27cb48e5-72a2-4e1f-b8f7-df48b1d5bbd1	user_type	user.attribute
27cb48e5-72a2-4e1f-b8f7-df48b1d5bbd1	true	id.token.claim
27cb48e5-72a2-4e1f-b8f7-df48b1d5bbd1	false	lightweight.claim
27cb48e5-72a2-4e1f-b8f7-df48b1d5bbd1	true	access.token.claim
27cb48e5-72a2-4e1f-b8f7-df48b1d5bbd1	user_type	claim.name
27cb48e5-72a2-4e1f-b8f7-df48b1d5bbd1	String	jsonType.label
\.

--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	60	300	300	\N	\N	\N	t	f	0	\N	jalsoochak-realm	0	length(8) and maxLength(64) and upperCase(1) and lowerCase(1) and digits(1) and specialChars(1) and notEmail(undefined) and notUsername(undefined) and notContainsUsername(undefined)	f	t	t	f	EXTERNAL	1800	36000	f	t	549ccf4a-fba8-49c8-869c-69f94e19b8f1	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	8fdf82c8-c5c1-4db8-8c6f-369f1974bf03	fea1c426-4f9d-4238-91b1-f949f50a5630	af659bd1-44b9-418f-b69e-e1d66031aee8	3e0631da-ead5-4e98-b3d6-0f7cd1458e69	4731c60b-0891-49a3-b9bd-c8891fb42e5f	2592000	f	900	t	f	0a2087dd-8e69-4635-9320-4ae71bfb63aa	0	t	0	0	9df28e2e-7791-4c2a-892c-2da8bd6d4bb8
345a4401-4184-4713-959a-273d7f8fe7d8	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	0882bff5-d2f7-42ed-bae0-181c59835dfa	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	a778da81-9738-4b09-8379-d45b412015a5	a380986f-9e93-409e-9249-4fa8e46a0241	95ecb2d5-b705-4888-9501-64f9fbac626c	f4f6f9fb-9806-455c-8a14-3c075e40ddb0	ff9f691f-c3ac-4099-a911-9f36da168ec3	2592000	f	900	t	f	fec0bb81-d29e-44fa-965b-22d03b0d73f1	0	f	0	0	415b52c5-eeff-4bc1-ae7c-7bcb8862455a
\.

--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	345a4401-4184-4713-959a-273d7f8fe7d8	
_browser_header.xContentTypeOptions	345a4401-4184-4713-959a-273d7f8fe7d8	nosniff
_browser_header.referrerPolicy	345a4401-4184-4713-959a-273d7f8fe7d8	no-referrer
_browser_header.xRobotsTag	345a4401-4184-4713-959a-273d7f8fe7d8	none
_browser_header.xFrameOptions	345a4401-4184-4713-959a-273d7f8fe7d8	SAMEORIGIN
_browser_header.contentSecurityPolicy	345a4401-4184-4713-959a-273d7f8fe7d8	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	345a4401-4184-4713-959a-273d7f8fe7d8	max-age=31536000; includeSubDomains
bruteForceProtected	345a4401-4184-4713-959a-273d7f8fe7d8	false
permanentLockout	345a4401-4184-4713-959a-273d7f8fe7d8	false
maxTemporaryLockouts	345a4401-4184-4713-959a-273d7f8fe7d8	0
bruteForceStrategy	345a4401-4184-4713-959a-273d7f8fe7d8	MULTIPLE
maxFailureWaitSeconds	345a4401-4184-4713-959a-273d7f8fe7d8	900
minimumQuickLoginWaitSeconds	345a4401-4184-4713-959a-273d7f8fe7d8	60
waitIncrementSeconds	345a4401-4184-4713-959a-273d7f8fe7d8	60
quickLoginCheckMilliSeconds	345a4401-4184-4713-959a-273d7f8fe7d8	1000
maxDeltaTimeSeconds	345a4401-4184-4713-959a-273d7f8fe7d8	43200
failureFactor	345a4401-4184-4713-959a-273d7f8fe7d8	30
realmReusableOtpCode	345a4401-4184-4713-959a-273d7f8fe7d8	false
firstBrokerLoginFlowId	345a4401-4184-4713-959a-273d7f8fe7d8	8781bdba-7fdd-4211-b6f9-df987b4c2437
displayName	345a4401-4184-4713-959a-273d7f8fe7d8	Keycloak
displayNameHtml	345a4401-4184-4713-959a-273d7f8fe7d8	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	345a4401-4184-4713-959a-273d7f8fe7d8	RS256
offlineSessionMaxLifespanEnabled	345a4401-4184-4713-959a-273d7f8fe7d8	false
offlineSessionMaxLifespan	345a4401-4184-4713-959a-273d7f8fe7d8	5184000
_browser_header.contentSecurityPolicyReportOnly	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	
_browser_header.xContentTypeOptions	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	nosniff
_browser_header.referrerPolicy	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	no-referrer
_browser_header.xRobotsTag	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	none
_browser_header.xFrameOptions	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	SAMEORIGIN
_browser_header.contentSecurityPolicy	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	max-age=31536000; includeSubDomains
bruteForceProtected	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	false
permanentLockout	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	false
maxTemporaryLockouts	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	0
bruteForceStrategy	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	MULTIPLE
maxFailureWaitSeconds	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	900
minimumQuickLoginWaitSeconds	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	60
waitIncrementSeconds	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	60
quickLoginCheckMilliSeconds	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	1000
maxDeltaTimeSeconds	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	43200
failureFactor	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	30
realmReusableOtpCode	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	false
defaultSignatureAlgorithm	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	RS256
offlineSessionMaxLifespanEnabled	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	false
offlineSessionMaxLifespan	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	5184000
actionTokenGeneratedByAdminLifespan	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	43200
actionTokenGeneratedByUserLifespan	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	300
oauth2DeviceCodeLifespan	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	600
oauth2DevicePollingInterval	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	5
webAuthnPolicyRpEntityName	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	keycloak
webAuthnPolicySignatureAlgorithms	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	ES256,RS256
webAuthnPolicyRpId	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	
webAuthnPolicyAttestationConveyancePreference	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	not specified
webAuthnPolicyAuthenticatorAttachment	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	not specified
webAuthnPolicyRequireResidentKey	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	not specified
webAuthnPolicyUserVerificationRequirement	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	not specified
webAuthnPolicyCreateTimeout	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	0
webAuthnPolicyAvoidSameAuthenticatorRegister	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	false
webAuthnPolicyRpEntityNamePasswordless	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	ES256,RS256
webAuthnPolicyRpIdPasswordless	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	
webAuthnPolicyAttestationConveyancePreferencePasswordless	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	not specified
webAuthnPolicyRequireResidentKeyPasswordless	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	Yes
webAuthnPolicyUserVerificationRequirementPasswordless	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	required
webAuthnPolicyCreateTimeoutPasswordless	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	false
cibaBackchannelTokenDeliveryMode	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	poll
cibaExpiresIn	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	120
cibaInterval	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	5
cibaAuthRequestedUserHint	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	login_hint
parRequestUriLifespan	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	60
firstBrokerLoginFlowId	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	c9f1e64a-6925-45c5-a6f7-c00f78dd5d5f
organizationsEnabled	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	false
verifiableCredentialsEnabled	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	false
clientSessionIdleTimeout	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	0
clientSessionMaxLifespan	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	0
clientOfflineSessionIdleTimeout	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	0
clientOfflineSessionMaxLifespan	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	0
client-policies.profiles	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	{"profiles":[]}
client-policies.policies	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	{"policies":[]}
frontendUrl	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	
saml.signature.algorithm	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	
acr.loa.map	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	{}
displayName	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	
displayNameHtml	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	
adminPermissionsEnabled	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	true
adminPermissionsClientId	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	8a864bd5-419a-4390-b42f-512d78d23e8a
\.

--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin; \.

--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.

--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.realm_events_listeners (realm_id, value) FROM stdin;
345a4401-4184-4713-959a-273d7f8fe7d8	jboss-logging
6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	jboss-logging
\.

--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.

--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: beehyv
--


COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	345a4401-4184-4713-959a-273d7f8fe7d8
password	password	t	t	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac
\.

--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin; \.

--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin; \.

--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.redirect_uris (client_id, value) FROM stdin;

ac19f8f4-f89c-43fd-85d6-f6ebf8de095f	/realms/master/account/*
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	/realms/master/account/*
c75ada75-7228-463d-81bc-2d96e1253ae5	/admin/master/console/*
2a74862e-2165-4e23-aec8-daa79e9ddcd1	/admin/jalsoochak-realm/console/*
b627e058-48c9-4c24-a3c1-4e678e99c1e1	/realms/jalsoochak-realm/account/*
e6be4642-3e50-4ec2-8531-7f97846e3e1b	/realms/jalsoochak-realm/account/*
eaf18766-7489-4693-a788-95fe5a56096a	*
671898bc-9014-4cbc-ab63-604fb1767d16	/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
3465fa8a-6df0-4608-8b30-6e6f58be37ef	VERIFY_EMAIL	Verify Email	345a4401-4184-4713-959a-273d7f8fe7d8	t	f	VERIFY_EMAIL	50
511c3a69-a2c4-4267-b1e4-0ef7698fb2ef	UPDATE_PROFILE	Update Profile	345a4401-4184-4713-959a-273d7f8fe7d8	t	f	UPDATE_PROFILE	40
efdb5810-b5f6-4a76-af8e-8cf9471d63e9	CONFIGURE_TOTP	Configure OTP	345a4401-4184-4713-959a-273d7f8fe7d8	t	f	CONFIGURE_TOTP	10
a3b2752e-abf0-4e3d-9d87-24e1d36ad383	UPDATE_PASSWORD	Update Password	345a4401-4184-4713-959a-273d7f8fe7d8	t	f	UPDATE_PASSWORD	30
3fb37c49-0b62-488d-a4c9-6568eb0f9735	TERMS_AND_CONDITIONS	Terms and Conditions	345a4401-4184-4713-959a-273d7f8fe7d8	f	f	TERMS_AND_CONDITIONS	20
e017a7a6-cef2-41aa-8010-2ffefaf94b67	delete_account	Delete Account	345a4401-4184-4713-959a-273d7f8fe7d8	f	f	delete_account	60
d01018a0-d6fc-4375-bd0b-d3abfb76bfbb	delete_credential	Delete Credential	345a4401-4184-4713-959a-273d7f8fe7d8	t	f	delete_credential	110
30e3abf2-3654-4e48-b6b7-7afd69a66e93	update_user_locale	Update User Locale	345a4401-4184-4713-959a-273d7f8fe7d8	t	f	update_user_locale	1000
087887bb-dcbf-4164-8628-733acf9a2575	UPDATE_EMAIL	Update Email	345a4401-4184-4713-959a-273d7f8fe7d8	f	f	UPDATE_EMAIL	70
6b07e7fa-a877-4f47-9645-d13f224e9900	CONFIGURE_RECOVERY_AUTHN_CODES	Recovery Authentication Codes	345a4401-4184-4713-959a-273d7f8fe7d8	t	f	CONFIGURE_RECOVERY_AUTHN_CODES	130
032a7077-132c-44d0-bffe-e51a953d87b4	webauthn-register	Webauthn Register	345a4401-4184-4713-959a-273d7f8fe7d8	t	f	webauthn-register	80
b22a42cc-5c0c-4713-ae6e-28d505f9090c	webauthn-register-passwordless	Webauthn Register Passwordless	345a4401-4184-4713-959a-273d7f8fe7d8	t	f	webauthn-register-passwordless	90
f6ed47f8-5a2a-428a-a190-f86ff8afddfb	VERIFY_PROFILE	Verify Profile	345a4401-4184-4713-959a-273d7f8fe7d8	t	f	VERIFY_PROFILE	100
646a52f5-4bd5-44cd-ba91-7adb99774036	idp_link	Linking Identity Provider	345a4401-4184-4713-959a-273d7f8fe7d8	t	f	idp_link	120
9d50534f-331f-43a7-820c-fd768e72a23c	VERIFY_EMAIL	Verify Email	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	t	f	VERIFY_EMAIL	50
70d2e568-7a4a-4f52-b2df-107dc415096e	UPDATE_PROFILE	Update Profile	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	t	f	UPDATE_PROFILE	40
5661262e-66c7-48aa-97a4-d8093117d00b	CONFIGURE_TOTP	Configure OTP	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	t	f	CONFIGURE_TOTP	10
7270746b-cf74-4a8a-b6f9-0b129b1015a9	UPDATE_PASSWORD	Update Password	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	t	f	UPDATE_PASSWORD	30
75bc2422-ad44-4bc9-a3d9-9f670e848275	TERMS_AND_CONDITIONS	Terms and Conditions	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	f	f	TERMS_AND_CONDITIONS	20
764e399b-541b-420c-8018-c0e72cd3647d	delete_account	Delete Account	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	f	f	delete_account	60
4470f9a0-b0af-4bda-b7df-0771af4f236a	VERIFY_PROFILE	Verify Profile	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	t	f	VERIFY_PROFILE	100
853cc89b-d64d-4f71-9dfb-950f46365b33	UPDATE_EMAIL	Update Email	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	t	f	UPDATE_EMAIL	70
797460ae-4797-4cd2-91cc-48842e3903b3	webauthn-register	Webauthn Register	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	f	f	webauthn-register	80
bbddd188-31c7-4b5f-8901-a8dbca93bb62	webauthn-register-passwordless	Webauthn Register Passwordless	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	f	f	webauthn-register-passwordless	90
e4cc949e-6f9d-4e5d-90f3-b2003a74ca8d	CONFIGURE_RECOVERY_AUTHN_CODES	Recovery Authentication Codes	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	f	f	CONFIGURE_RECOVERY_AUTHN_CODES	130
c1b7c08f-0ffe-40dc-953f-57a906be622d	update_user_locale	Update User Locale	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	f	f	update_user_locale	1000
f678b7ae-6d43-41bf-9b2c-d6b349312fb7	idp_link	Linking Identity Provider	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	f	f	idp_link	120
7dd3d489-9426-4b79-80d4-fe8edaac6c65	delete_credential	Delete Credential	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	f	f	delete_credential	110
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
65aa718c-d39c-4f91-ad6c-2d6a60d97ba6	316b9501-54a7-490c-bfbf-d08ae5cf5644
65aa718c-d39c-4f91-ad6c-2d6a60d97ba6	cbd247b3-86f9-44fc-8fa5-cece217b88a3
65aa718c-d39c-4f91-ad6c-2d6a60d97ba6	0b55c102-d451-42e2-b9e3-3fc9fe391b96
3f39a8ba-3c4c-45e1-a4a8-a668a2deee9c	9a4c3c63-4ba0-412e-8f07-56180bada1b8
3f39a8ba-3c4c-45e1-a4a8-a668a2deee9c	6ed34598-98f6-46dd-b86d-640350a68d49
3f39a8ba-3c4c-45e1-a4a8-a668a2deee9c	1a5a14d2-1081-435a-a700-47c6734fe63a
3f39a8ba-3c4c-45e1-a4a8-a668a2deee9c	49892cbb-803c-4149-90e6-15417b1d5fe2
3f39a8ba-3c4c-45e1-a4a8-a668a2deee9c	43517ecc-1064-4a36-ab9d-59a3a84ac9ed
4969d928-b2e5-40a1-857d-0597c3914eeb	9a4c3c63-4ba0-412e-8f07-56180bada1b8
4969d928-b2e5-40a1-857d-0597c3914eeb	175a936d-898c-4b70-adff-71410064f4ce
4969d928-b2e5-40a1-857d-0597c3914eeb	846cedc1-3baa-4f15-9aa6-6397437713db
4969d928-b2e5-40a1-857d-0597c3914eeb	49892cbb-803c-4149-90e6-15417b1d5fe2
4969d928-b2e5-40a1-857d-0597c3914eeb	43517ecc-1064-4a36-ab9d-59a3a84ac9ed
4969d928-b2e5-40a1-857d-0597c3914eeb	36ba0a61-49a6-469c-97ed-943d6883b5b6
348250a6-b2ca-4730-94a5-87715dc7de79	9a4c3c63-4ba0-412e-8f07-56180bada1b8
348250a6-b2ca-4730-94a5-87715dc7de79	5017e96d-6f35-4bdc-b366-30e7fcbb5761
348250a6-b2ca-4730-94a5-87715dc7de79	49892cbb-803c-4149-90e6-15417b1d5fe2
348250a6-b2ca-4730-94a5-87715dc7de79	c1fff3da-85d3-4737-aa48-b9c4293476ed
348250a6-b2ca-4730-94a5-87715dc7de79	63334c9b-e5a1-41b9-9f24-f12c1349b00b
348250a6-b2ca-4730-94a5-87715dc7de79	55a52fe3-ce47-4897-8e26-d7a59b2ca53b
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
8a864bd5-419a-4390-b42f-512d78d23e8a	t	0	1
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
65aa718c-d39c-4f91-ad6c-2d6a60d97ba6	Roles	Roles	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	8a864bd5-419a-4390-b42f-512d78d23e8a	f	\N
3f39a8ba-3c4c-45e1-a4a8-a668a2deee9c	Clients	Clients	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	8a864bd5-419a-4390-b42f-512d78d23e8a	f	\N
4969d928-b2e5-40a1-857d-0597c3914eeb	Users	Users	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	8a864bd5-419a-4390-b42f-512d78d23e8a	f	\N
348250a6-b2ca-4730-94a5-87715dc7de79	Groups	Groups	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	8a864bd5-419a-4390-b42f-512d78d23e8a	f	\N
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
846cedc1-3baa-4f15-9aa6-6397437713db	manage-group-membership	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
6ed34598-98f6-46dd-b86d-640350a68d49	map-roles-client-scope	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
0b55c102-d451-42e2-b9e3-3fc9fe391b96	map-role	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
63334c9b-e5a1-41b9-9f24-f12c1349b00b	view-members	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
175a936d-898c-4b70-adff-71410064f4ce	reset-password	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
9a4c3c63-4ba0-412e-8f07-56180bada1b8	manage	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
55a52fe3-ce47-4897-8e26-d7a59b2ca53b	impersonate-members	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
5017e96d-6f35-4bdc-b366-30e7fcbb5761	manage-members	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
49892cbb-803c-4149-90e6-15417b1d5fe2	view	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
36ba0a61-49a6-469c-97ed-943d6883b5b6	impersonate	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
c1fff3da-85d3-4737-aa48-b9c4293476ed	manage-membership	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
316b9501-54a7-490c-bfbf-d08ae5cf5644	map-role-composite	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
43517ecc-1064-4a36-ab9d-59a3a84ac9ed	map-roles	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
cbd247b3-86f9-44fc-8fa5-cece217b88a3	map-role-client-scope	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
1a5a14d2-1081-435a-a700-47c6734fe63a	map-roles-composite	\N	8a864bd5-419a-4390-b42f-512d78d23e8a	\N
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.revoked_token (id, expire) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	5607af5d-8d31-42e4-a88d-3945f8ccd17c
eb43d5b5-1c47-4530-9458-1f5c3e0aeb91	892f40d7-0dba-46b1-bf6f-8c3a2f49dbb2
e6be4642-3e50-4ec2-8531-7f97846e3e1b	c2f8be08-f52a-4697-9f35-3060d7e30e64
e6be4642-3e50-4ec2-8531-7f97846e3e1b	e07a872e-679b-45be-8997-3f79051d3288
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: server_config; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.server_config (server_config_key, value, version) FROM stdin;
crt_jgroups	{"prvKey":"MIIEogIBAAKCAQEAmpA1o/xYY6WzchN3LT+0bVL55MzjyQmRC3bugsroT9Dl4Zamxq+kU7hird+gIAuInlXh4HnHOn+8aNWG3d7VQ3VTTv9nuE/epi544gCUYP46KhDWxddsHap9YDSQvT1ldewFfRjq4vvLhvyoHiaMmJNlc8Fyool3tU3BceB7IJIVz6JI8IgaYBf7K+4VFk1gJjJJiwGz75glC5Ohcn4oESd3RVtWI7O7EZWhGWe+BPqzJkrbtHqoXEcT4hnWdnSEv9qpiPEdyNSL6gtXFypNneFKRrDa54KUeXdcHisVqQEmfsoygkjzqz40jsZ74K8+POkIbKO8Geyij7hfAnSj8QIDAQABAoIBABEmC2GGm6rwpUR0nu4lCYhwoputVN+HAXH/b86Qoy5J29uH2rikH6wPQtmOPGaZyP5iQnWkpUNbDUUnXbeLo+dAYu4ancAgEnCnKs/OZygMxNjKdf3M3Si8c/0iz+VDJNjsxx4eT98/txDiwudXeRVrkx/A+I5KiL7TofEXyiluh7thVDifn2Obmk4AyfLQvTR15uln6JtsK+j9e6Fpyw/pNr+lZ/0k0KRoY9jUcp5ylg4OxIiVKihxFOh/FOzJOSN5wRYqj5079suCW45lRxUUICCj6rbgApQ0TYKEcTCIfwGZBGMqldTmay4I2LpVJI5oCkX4BWGLjCevsdoBoq0CgYEAyELl4slNBgk5JtL43ifbOXD5BwN3NM5gwA6mHetGpsIyZpPu4jtQ+l1mYC3dfVceflcH43+F/Gww0AVKQNiHiS+I8QmXoMCVl5ogplLRCCV6thBpXRAJJSvJwSSu66MXCqu1AACE/IBRyqFt25/kFi0voRySecR3+k2jilFWktUCgYEAxZU3/XvrFF3OeFRytBASKH8WwukJMqgulvw6N5TKt0PW913PXM0iLnsPUg7ncGE0/WW1P67Bt+nPySCui5ioMwjPiACdwQZBA0+1fXzXDLiwwM9kwzvHyjfl294fOAKQMnEb+aZR/cB+BNlbPVvUE5z2j5Sj/X4hmvfO8Xv2wq0CgYBqyNFQZsq9hzmEbEbsHxCUxprjlIOCEvIgNy95ELXxweeiLwvYcoyxlBA9BPfwF/5YnAvG0X8epIo6wjdf8JYFHuXEsbq6qzaZSkRSrCJuV53ha0rjpuNZgMnqRadIWwS0We7/+0buZXY3uHCeBdpXwOx+2n94krzvKWslHE4vqQKBgD1aDl65oc9bKYeXwV5ENz8351tyfRarvnvHqlQj8aZifFenW4JXeCuyrpkuY5Mzu/6LHHK/0wtGoOy1Jz3VkzT1oWt7tYCAbqOWlqZ2o1gh6VCVlZZB89HI9akGGe+MbDYdhTBKAt+ma/sZewlcgEfuz2jaIOnPxqOWGz5E3eSpAoGABNwx9yEdt6VhNgefkaZRp9+hOjNBSXnRYlZNJIS7jTjZv46iTRaFLjR+w2ZTyL2nwLrwSBi/judrF3dQPKxAQ+TciwfzZAwoxFvwdCOVfi/QasBICbq7nrlV/Z8nC3Wrg9T696xviBVPOHf5FvxNT40cx1Ko+IdKTcbf8OjhIpc=","pubKey":"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmpA1o/xYY6WzchN3LT+0bVL55MzjyQmRC3bugsroT9Dl4Zamxq+kU7hird+gIAuInlXh4HnHOn+8aNWG3d7VQ3VTTv9nuE/epi544gCUYP46KhDWxddsHap9YDSQvT1ldewFfRjq4vvLhvyoHiaMmJNlc8Fyool3tU3BceB7IJIVz6JI8IgaYBf7K+4VFk1gJjJJiwGz75glC5Ohcn4oESd3RVtWI7O7EZWhGWe+BPqzJkrbtHqoXEcT4hnWdnSEv9qpiPEdyNSL6gtXFypNneFKRrDa54KUeXdcHisVqQEmfsoygkjzqz40jsZ74K8+POkIbKO8Geyij7hfAnSj8QIDAQAB","crt":"MIICnTCCAYUCBgGdM/8pFTANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdqZ3JvdXBzMB4XDTI2MDMyODEwMjkxM1oXDTI2MDUyNzEwMzA1M1owEjEQMA4GA1UEAwwHamdyb3VwczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJqQNaP8WGOls3ITdy0/tG1S+eTM48kJkQt27oLK6E/Q5eGWpsavpFO4Yq3foCALiJ5V4eB5xzp/vGjVht3e1UN1U07/Z7hP3qYueOIAlGD+OioQ1sXXbB2qfWA0kL09ZXXsBX0Y6uL7y4b8qB4mjJiTZXPBcqKJd7VNwXHgeyCSFc+iSPCIGmAX+yvuFRZNYCYySYsBs++YJQuToXJ+KBEnd0VbViOzuxGVoRlnvgT6syZK27R6qFxHE+IZ1nZ0hL/aqYjxHcjUi+oLVxcqTZ3hSkaw2ueClHl3XB4rFakBJn7KMoJI86s+NI7Ge+CvPjzpCGyjvBnsoo+4XwJ0o/ECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEALkQokVbYI0caezFAbjQ2nk3wXud1UrplxG5QOg9v8wimnywVrmEYgdp8p6xjJLB+ATY+wZN1vMY0+QNsQjj2wt6mrN9S6PSyBAAtXrm9BYv7DZuh1RWaRqT/m/i4Eq8+kl8UPYjdCVaGz/TzRsrGIwGg1HYCcIg9y7F/XqdkIbbfYJQmLdtcK1Wo74kaNkS3HoUZ41qNMogl6DUCsgFDejGrJe0fQClK9GGRS+TeCA2ZtsXYtNWjZSji/XeEb7yVaEokr2snP2Jq6ROgtK5UMuJY59gSXupQnGcYxIxgHH5IbS1GL642SZyAaMhgr+w0t5bP7Z6gsEPAQLmEIBarCA==","alias":"32fcf0a2-88c8-4b8b-b5de-3963fb9a4a2e","generatedMillis":1774693853487}	1
JGROUPS_ADDRESS_SEQUENCE	7	7
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
is_temporary_admin	true	f0949a79-c15b-4f64-8f46-1de2545cae14	9199ebf0-2d50-4707-b0a4-1c4752dd2c1e	\N	\N	\N
tenant_state_code	Ka	1167ffcb-9b74-40da-97cf-94bfadd5a99d	6354b87a-8250-438b-97e7-e9be29cfa6f4	\N	\N	\N
tenant_state_code	MZ	88b54d5a-6d9d-4241-98c8-672170338819	a7768a32-7349-4823-a2f3-a35bcfeedddb	\N	\N	\N
tenant_state_code	MZ	8889b000-efa9-45e6-8039-cec381bfe1f9	82b71e22-5b5f-4f79-a5d5-56e68824178b	\N	\N	\N
tenant_state_code	MZ	c2400918-3904-4eca-9a29-7411798bdde3	45bceed0-fe73-4e0b-952d-8efdecfa953a	\N	\N	\N
tenant_state_code	AS	023b1f46-6352-4be7-ad6f-eb51f59524b9	d25fa336-20b6-4a7a-a285-67c40f97de35	\N	\N	\N
tenant_state_code	AS	5b3ee9d0-09e1-4e7c-b1de-8834cb556621	1c0028ad-4c47-4cbd-9b37-c654f6e24baa	\N	\N	\N
tenant_state_code	AS	4882e302-8df3-4430-b60f-444b85a975cd	fd2fc242-b202-4602-9d68-d0b690ba3de2	\N	\N	\N
tenant_state_code	AN	81d461f6-3226-4957-bf3e-33c45ac10ed0	e7400bcb-fea3-47c1-8a4b-8d6a3700143f	\N	\N	\N
tenant_state_code	AN	e6086cbd-e8d1-4653-858c-8db3efcb55fa	7a470724-677c-4151-8c71-feb74ca367c0	\N	\N	\N
user_type	SUPER_USER	ae90a340-11bf-4a23-b52e-16228da17213	2fda6f0a-1dc5-4b13-9037-9957e48fa573	\N	\N	\N
user_type	STATE_ADMIN	e6086cbd-e8d1-4653-858c-8db3efcb55fa	3d00cdb2-b9ac-44f6-9750-0847589ab46b	\N	\N	\N
user_type	STATE_ADMIN	81d461f6-3226-4957-bf3e-33c45ac10ed0	13d9e425-2208-4f29-a98f-a31efdcebce4	\N	\N	\N
user_type	STATE_ADMIN	cb363695-d4a6-4f83-9f2e-2241d23e0c57	56c65b79-6f56-4a9d-b107-ed17f32516e0	\N	\N	\N
user_type	STATE_ADMIN	8889b000-efa9-45e6-8039-cec381bfe1f9	008274bf-9947-4a0e-8b7b-525b323a328a	\N	\N	\N
user_type	STATE_ADMIN	c2400918-3904-4eca-9a29-7411798bdde3	130186a6-876c-4a7c-80f6-36b9c578adb1	\N	\N	\N
user_type	STATE_ADMIN	1167ffcb-9b74-40da-97cf-94bfadd5a99d	6b667178-c0cd-4537-8a43-be8e4649c6e4	\N	\N	\N
user_type	SUPER_USER	e18f96fb-61ca-472e-beaa-68dd99a6081e	314caeda-b6fe-4500-aa45-d719aff4ca78	\N	\N	\N
user_type	STATE_ADMIN	fe708873-b3cf-4234-a772-9eaa2d9be2df	f76f0dca-b051-400e-9888-eb45d16a615b	\N	\N	\N
user_type	SUPER_USER	676374c2-0baa-4e63-8cc0-ff4f5b844755	5566c923-d9ef-44c7-8ff6-b3458a320bf9	\N	\N	\N
user_type	STATE_ADMIN	88b54d5a-6d9d-4241-98c8-672170338819	ac2516f5-5f2b-4bcc-be07-9da7d95a16b2	\N	\N	\N
user_type	STATE_ADMIN	5b3ee9d0-09e1-4e7c-b1de-8834cb556621	3fe6a297-7fa6-4739-ae95-506456907bd9	\N	\N	\N
user_type	STATE_ADMIN	023b1f46-6352-4be7-ad6f-eb51f59524b9	e26baf03-d413-4346-8e4e-94a8f2b259e2	\N	\N	\N
user_type	STATE_ADMIN	4882e302-8df3-4430-b60f-444b85a975cd	60acb9b4-f0a5-4a45-9726-c8fff8a1ec93	\N	\N	\N
tenant_state_code	UK	b1ef69eb-bac2-4d3a-9f0b-171e8cc004af	54576656-1928-4469-a99b-ac0310e28181	\N	\N	\N
tenant_state_code	ka	db1fc5a5-deed-42eb-828b-5c555698f990	d0115593-49cb-4271-ab55-ec15853da8f2	\N	\N	\N
tenant_state_code	PB	d4e28bba-de8d-4685-997e-78908579acc0	92ccc5ef-11f0-451d-a481-34a9594d3ef3	\N	\N	\N
user_type	SUPER_USER	d4e28bba-de8d-4685-997e-78908579acc0	49777e42-6027-431f-9f8c-643c94e055fc	\N	\N	\N
tenant_state_code	AS	fe708873-b3cf-4234-a772-9eaa2d9be2df	7a3c6454-af51-4892-a303-c2a7c046cfb8	\N	\N	\N
tenant_state_code	AS	cb363695-d4a6-4f83-9f2e-2241d23e0c57	167a14fa-b1a5-43c0-91cf-2428d2a2fcca	\N	\N	\N
tenant_state_code	AS	3bc4b222-9fa8-46c0-acc8-3186b561f545	b3161443-3dc4-43af-91b1-d1d8dc16c303	\N	\N	\N
tenant_state_code	KA	206c22e3-de43-42d5-a769-2dd0a8562cb0	ae6200f1-6dc1-4238-a180-ed0627f4f8d8	\N	\N	\N
tenant_state_code	AS	cbb668ab-5f85-4e8e-b167-c504971c84f9	ba571531-b970-42ae-9a95-56febe707447	\N	\N	\N
tenant_state_code	LA	a397868c-c9f2-4a90-9885-4c22c875aea7	4e4e0dc3-20c0-404f-9fb3-f488a7a4f6af	\N	\N	\N
tenant_state_code	CH	52549e3e-8931-491e-94fd-1aae25eba5af	1057f99e-38d6-4460-a5cf-140977ed62d8	\N	\N	\N
tenant_state_code	HP	fe2abd63-7c6b-40f4-a55b-cf0599a7b3d4	0efa123e-ddd4-40d4-a89c-529a05854119	\N	\N	\N
tenant_state_code	HP	a0a3fd0a-0936-45a0-a4b9-fca607fc69e0	72d3a744-d15f-4ab0-b158-26504586ecab	\N	\N	\N
tenant_state_code	AS	dd2ca154-0481-4d12-a36b-478f0cc72253	f70805e4-723d-4567-b4bb-688086a23321	\N	\N	\N
user_type	SECTION_OFFICER	dd2ca154-0481-4d12-a36b-478f0cc72253	4e89a618-be4d-498f-8f09-dda2f9032858	\N	\N	\N
tenant_state_code	AS	60ca2a05-a5e1-4214-aab9-4abf52b22557	8e6d1e08-fbf9-4532-9f5e-d8da3a27ebca	\N	\N	\N
tenant_state_code	NL	dceee8a7-beb9-4908-8553-aa1015aa4311	6a26b761-5a0e-4627-bc7f-923a540ceef0	\N	\N	\N
tenant_state_code	KL	ec6bccf3-affe-40f8-990f-6948a4e46ef8	9150d819-262c-4d07-aa02-514ac28ab5fd	\N	\N	\N
tenant_state_code	PY	a3583c57-e3a5-4694-92f6-8d4505f9839a	86fa574f-d750-47fc-85e0-73b2425c2102	\N	\N	\N
tenant_state_code	AN	e8852ed8-954f-4322-b78b-b571ef350275	f5942348-3f6b-4908-8d94-574c334a9c05	\N	\N	\N
tenant_state_code	BR	048c2de6-2d96-4928-a522-fa92da2dee8d	e33ec91a-ccc7-41c1-a1b9-c5d28ca19181	\N	\N	\N
tenant_state_code	AP	93588d7f-3447-4084-8f3c-5db7bf08a3b1	62cca44c-b75c-4558-94de-efd86c24fad4	\N	\N	\N
tenant_state_code	NL	94f7dffa-ba0a-4b82-b1a4-6da7bbd8ab7d	ebcbfe4b-7f1f-49e0-b041-c76679a7eb65	\N	\N	\N
user_type	PUMP_OPERATOR	94f7dffa-ba0a-4b82-b1a4-6da7bbd8ab7d	40af2bbd-6804-4960-9abe-2409b3b00935	\N	\N	\N
tenant_state_code	GA	adae6f53-20ff-43b4-b446-ab9076f20e91	749d0054-47df-4d6d-afac-1b69dcb65816	\N	\N	\N
tenant_state_code	DL	237822d7-2bf9-4d79-a590-6bc9c6fa6c21	f8e5764e-e6e8-4bb3-a3ec-ecd8703bf9a1	\N	\N	\N
tenant_state_code	CH	144725da-ce29-4188-96ee-8b35071d4797	d0214299-f24e-4606-8bae-705a715e239f	\N	\N	\N
tenant_state_code	NL	500c4ed6-a2ca-48e7-aa91-b6e0b6d0a77a	0a1ae062-0cc5-40be-b969-50135caf7a2c	\N	\N	\N
user_type	STATE_ADMIN	500c4ed6-a2ca-48e7-aa91-b6e0b6d0a77a	a7e380a2-5de0-469a-90f2-7bc1c4a4e56b	\N	\N	\N
tenant_state_code	NL	a5f338c8-2cf8-41a8-8456-8ae7d425555e	aacbf12a-4ba9-4ce7-9ab6-eb3e419f0b8d	\N	\N	\N
user_type	SECTION_OFFICER	a5f338c8-2cf8-41a8-8456-8ae7d425555e	37043e0a-9f62-420e-ae5e-02922f1ab9f8	\N	\N	\N
tenant_state_code	NL	0230c74f-d858-4aa2-a87d-68a986698825	bbd5cab9-cfdd-4230-95e8-eb2f951e71b7	\N	\N	\N
user_type	SUB_DIVISIONAL_OFFICER	0230c74f-d858-4aa2-a87d-68a986698825	638bf1b5-3b8a-43d8-8701-3fc453a8f5ba	\N	\N	\N
tenant_state_code	CG	d3419d44-1755-4943-9f09-2d8eab01246f	fd826d17-3aa0-45ca-b575-5da16b9fec4c	\N	\N	\N
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
f0949a79-c15b-4f64-8f46-1de2545cae14	\N	55bf1649-3e13-4f97-8307-afa78d752b0d	f	t	\N	\N	\N	345a4401-4184-4713-959a-273d7f8fe7d8	admin	1772101855679	\N	0
cbb668ab-5f85-4e8e-b167-c504971c84f9	u63hei9s08@bwmyga.com	u63hei9s08@bwmyga.com	t	f	\N	peter	parkerrrrrrr	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	u63hei9s08@bwmyga.com	1774252124405	\N	0
60ca2a05-a5e1-4214-aab9-4abf52b22557	miwava5470@izkat.com	miwava5470@izkat.com	t	t	\N	march	thirty	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	miwava5470@izkat.com	1774864049634	\N	0
19a6a63f-63b5-49c7-a6df-d370a5e79d59	\N	4c39081d-d42b-4e33-9bab-ff52675aab05	f	t	\N	\N	\N	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	service-account-jalsoochak-admin	1772786226043	671898bc-9014-4cbc-ab63-604fb1767d16	0
f45c2296-bfa3-488c-97f3-b8c1869253fc	jipatic681@jsncos.com	jipatic681@jsncos.com	t	t	\N	march	retre	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	jipatic681@jsncos.com	1774465250663	\N	0
cf172056-0b84-4046-8037-293cf69f95f5	nibica2211@jsncos.com	nibica2211@jsncos.com	t	t	\N	Swetha	Pullela	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	nibica2211@jsncos.com	1774864372444	\N	0
8889b000-efa9-45e6-8039-cec381bfe1f9	naxaxi4394@devlug.com	naxaxi4394@devlug.com	t	f	\N	burger	king	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	naxaxi4394@devlug.com	1773410616870	\N	0
ae90a340-11bf-4a23-b52e-16228da17213	aviral.gupta@beehyv.com	aviral.gupta@beehyv.com	t	t	\N	Aviral	Gupta	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	aviral.gupta@beehyv.com	1773149449253	\N	0
1167ffcb-9b74-40da-97cf-94bfadd5a99d	otonyeamie@gmail.com	otonyeamie@gmail.com	t	t	\N	Otonye 	Amietubodie	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	otonyeamie@gmail.com	1773294015917	\N	0
88b54d5a-6d9d-4241-98c8-672170338819	swetha.pullela@beehyv.com	swetha.pullela@beehyv.com	t	f	\N	harry	potter	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	swetha.pullela@beehyv.com	1773410130626	\N	0
dceee8a7-beb9-4908-8553-aa1015aa4311	kehiref396@marvetos.com	kehiref396@marvetos.com	t	t	\N	swetha	kghkjh	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	kehiref396@marvetos.com	1774944142233	\N	0
e18f96fb-61ca-472e-beaa-68dd99a6081e	revanth.korra@beehyv.com	revanth.korra@beehyv.com	t	t	\N	Pikachu	shinyeee	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	revanth.korra@beehyv.com	1773409210451	\N	0
52549e3e-8931-491e-94fd-1aae25eba5af	xihipeb280@pazard.com	xihipeb280@pazard.com	t	t	\N	march	parSDker	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	xihipeb280@pazard.com	1774274359609	\N	0
ec6bccf3-affe-40f8-990f-6948a4e46ef8	rohedof924@flownue.com	rohedof924@flownue.com	t	t	\N	Swetha	Pullela	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	rohedof924@flownue.com	1774948837452	\N	0
a3583c57-e3a5-4694-92f6-8d4505f9839a	yaroxit199@algarr.com	yaroxit199@algarr.com	t	t	\N	sfdsf	dsfsdf	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	yaroxit199@algarr.com	1774957535853	\N	0
e6086cbd-e8d1-4653-858c-8db3efcb55fa	harmannat.kaur@beehyv.com	harmannat.kaur@beehyv.com	t	t	\N	Gandalf	The white	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	harmannat.kaur@beehyv.com	1773646496408	\N	1773646902
e8852ed8-954f-4322-b78b-b571ef350275	gisel41068@nexafilm.com	gisel41068@nexafilm.com	t	t	\N	andaman	nicobar	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	gisel41068@nexafilm.com	1774968070652	\N	0
81d461f6-3226-4957-bf3e-33c45ac10ed0	johnsamuel.neerudu@beehyv.com	johnsamuel.neerudu@beehyv.com	t	t	\N	santaaaaaa	claussssssyyyyyy	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	johnsamuel.neerudu@beehyv.com	1773645011494	\N	1773646181
b1ef69eb-bac2-4d3a-9f0b-171e8cc004af	kapil.garg@beehyv.com	kapil.garg@beehyv.com	t	t	\N	Hamza	Ali Mazari	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	kapil.garg@beehyv.com	1773664451901	\N	0
048c2de6-2d96-4928-a522-fa92da2dee8d	cicado9259@algarr.com	cicado9259@algarr.com	t	t	\N	new	gamer	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	cicado9259@algarr.com	1775028711850	\N	0
a397868c-c9f2-4a90-9885-4c22c875aea7	vpk7ra3snb@bltiwd.com	vpk7ra3snb@bltiwd.com	t	t	\N	mad	max	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	vpk7ra3snb@bltiwd.com	1774255334525	\N	0
023b1f46-6352-4be7-ad6f-eb51f59524b9	vishnu.p@beehyv.com	vishnu.p@beehyv.com	t	t	\N	testing	1	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	vishnu.p@beehyv.com	1773494934306	\N	0
93588d7f-3447-4084-8f3c-5db7bf08a3b1	belag55001@marvetos.com	belag55001@marvetos.com	t	t	\N	sdfsd	sdfsd	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	belag55001@marvetos.com	1775038775983	\N	0
db1fc5a5-deed-42eb-828b-5c555698f990	blossomese@gmail.com	blossomese@gmail.com	t	t	\N	Blossom 	Esezobor	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	blossomese@gmail.com	1773693542399	\N	0
d4e28bba-de8d-4685-997e-78908579acc0	prabhsimran@beehyv.com	prabhsimran@beehyv.com	t	t	\N	Prabhsimran	Singh	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	prabhsimran@beehyv.com	1773711500349	\N	0
fe708873-b3cf-4234-a772-9eaa2d9be2df	state.admin.as@beehyv.com	state.admin.as@beehyv.com	t	t	\N	State Admin	AS	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	state.admin.as@beehyv.com	1772791350547	\N	0
5b3ee9d0-09e1-4e7c-b1de-8834cb556621	vayet66430@hlkes.com	vayet66430@hlkes.com	t	t	\N	testing	2	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	vayet66430@hlkes.com	1773495468599	\N	0
4882e302-8df3-4430-b60f-444b85a975cd	wotike5043@flosek.com	wotike5043@flosek.com	t	t	\N	testing	2	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	wotike5043@flosek.com	1773495902248	\N	0
fe2abd63-7c6b-40f4-a55b-cf0599a7b3d4	selewo9715@pazard.com	selewo9715@pazard.com	t	t	\N	march23	parSDker	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	selewo9715@pazard.com	1774277700710	\N	0
a0a3fd0a-0936-45a0-a4b9-fca607fc69e0	ponijof768@paylaar.com	ponijof768@paylaar.com	t	t	\N	march23	parSDker	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	ponijof768@paylaar.com	1774279045663	\N	0
dd2ca154-0481-4d12-a36b-478f0cc72253	\N	b33cf389-5eb5-4324-af15-025f2d2b4d11	t	t	\N	SO	Test 1	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	9876543210	1774360476865	\N	0
206c22e3-de43-42d5-a769-2dd0a8562cb0	yiroh36080@paylaar.com	yiroh36080@paylaar.com	t	t	\N	Super	user	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	yiroh36080@paylaar.com	1773926772621	\N	0
676374c2-0baa-4e63-8cc0-ff4f5b844755	super.user@beehyv.com	super.user@beehyv.com	t	t	\N	ewqweq	Userrrrr	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	super.user@beehyv.com	1772791244419	\N	1774116741
cb363695-d4a6-4f83-9f2e-2241d23e0c57	mukul.jakhar@beehyv.com	mukul.jakhar@beehyv.com	t	t	\N	Mukul	gamerRRRR	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	mukul.jakhar@beehyv.com	1773312634654	\N	1773654984
3bc4b222-9fa8-46c0-acc8-3186b561f545	najona8045@pazard.com	najona8045@pazard.com	t	f	\N	Swetha	Pullela	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	najona8045@pazard.com	1773758479377	\N	0
c2400918-3904-4eca-9a29-7411798bdde3	nischey.devgan@beehyv.com	nischey.devgan@beehyv.com	t	t	\N	sushi	ramenER	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	nischey.devgan@beehyv.com	1773410970342	\N	0
94f7dffa-ba0a-4b82-b1a4-6da7bbd8ab7d	\N	774c6bff-65e6-49e5-94a7-6fb8dfc0953c	t	t	\N	pump	operator	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	917815816856	1775041033677	\N	0
adae6f53-20ff-43b4-b446-ab9076f20e91	sofilok546@agoalz.com	sofilok546@agoalz.com	t	t	\N	west	side	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	sofilok546@agoalz.com	1775041894529	\N	0
237822d7-2bf9-4d79-a590-6bc9c6fa6c21	witebes142@algarr.com	witebes142@algarr.com	t	t	\N	delhi	guy	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	witebes142@algarr.com	1775047590763	\N	0
144725da-ce29-4188-96ee-8b35071d4797	famif19533@algarr.com	famif19533@algarr.com	t	t	\N	Swetha	Pullela	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	famif19533@algarr.com	1775060790070	\N	0
500c4ed6-a2ca-48e7-aa91-b6e0b6d0a77a	\N	c0ae72ed-342f-44e2-8f43-d37ed90acd5c	t	t	\N	swetha	kghkjh	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	7815816856	1775114893982	\N	0
a5f338c8-2cf8-41a8-8456-8ae7d425555e	\N	c8d9cf7c-d938-498b-8f46-6092f125697d	t	t	\N	section	officer	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	917661016648	1775119742699	\N	0
0230c74f-d858-4aa2-a87d-68a986698825	\N	6159598b-06c7-4aa3-accc-9592fdbcb69b	t	t	\N	sub	divisional	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	918179020960	1775119825461	\N	0
d3419d44-1755-4943-9f09-2d8eab01246f	fekeced347@marvetos.com	fekeced347@marvetos.com	t	t	\N	FSDGSDG	SDFGDSF	6ac7f425-7bcf-42b6-b6e7-d16c43ff7cac	fekeced347@marvetos.com	1775134423191	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
415b52c5-eeff-4bc1-ae7c-7bcb8862455a	f0949a79-c15b-4f64-8f46-1de2545cae14
0b2835c1-fa22-474b-9fd9-0963c3ad95e2	f0949a79-c15b-4f64-8f46-1de2545cae14
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	19a6a63f-63b5-49c7-a6df-d370a5e79d59
6fd6ffc0-2426-4019-b05d-939f7e2dc06c	19a6a63f-63b5-49c7-a6df-d370a5e79d59
49f42704-56e4-4aea-b9d1-457f4fd38fb3	19a6a63f-63b5-49c7-a6df-d370a5e79d59
5bb2fa47-0e2c-4c98-a1d8-e00ec0d34d4f	19a6a63f-63b5-49c7-a6df-d370a5e79d59
8fc92887-4d49-4ef8-877b-1af16b98ba94	19a6a63f-63b5-49c7-a6df-d370a5e79d59
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	676374c2-0baa-4e63-8cc0-ff4f5b844755
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	fe708873-b3cf-4234-a772-9eaa2d9be2df
bd143611-7a68-410b-80b7-7de95d5fed56	fe708873-b3cf-4234-a772-9eaa2d9be2df
1081e9d7-a3d2-4a21-be6d-8374e7145768	676374c2-0baa-4e63-8cc0-ff4f5b844755
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	ae90a340-11bf-4a23-b52e-16228da17213
1081e9d7-a3d2-4a21-be6d-8374e7145768	ae90a340-11bf-4a23-b52e-16228da17213
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	1167ffcb-9b74-40da-97cf-94bfadd5a99d
bd143611-7a68-410b-80b7-7de95d5fed56	1167ffcb-9b74-40da-97cf-94bfadd5a99d
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	cb363695-d4a6-4f83-9f2e-2241d23e0c57
bd143611-7a68-410b-80b7-7de95d5fed56	cb363695-d4a6-4f83-9f2e-2241d23e0c57
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	e18f96fb-61ca-472e-beaa-68dd99a6081e
1081e9d7-a3d2-4a21-be6d-8374e7145768	e18f96fb-61ca-472e-beaa-68dd99a6081e
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	88b54d5a-6d9d-4241-98c8-672170338819
bd143611-7a68-410b-80b7-7de95d5fed56	88b54d5a-6d9d-4241-98c8-672170338819
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	8889b000-efa9-45e6-8039-cec381bfe1f9
bd143611-7a68-410b-80b7-7de95d5fed56	8889b000-efa9-45e6-8039-cec381bfe1f9
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	c2400918-3904-4eca-9a29-7411798bdde3
bd143611-7a68-410b-80b7-7de95d5fed56	c2400918-3904-4eca-9a29-7411798bdde3
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	023b1f46-6352-4be7-ad6f-eb51f59524b9
bd143611-7a68-410b-80b7-7de95d5fed56	023b1f46-6352-4be7-ad6f-eb51f59524b9
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	5b3ee9d0-09e1-4e7c-b1de-8834cb556621
bd143611-7a68-410b-80b7-7de95d5fed56	5b3ee9d0-09e1-4e7c-b1de-8834cb556621
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	4882e302-8df3-4430-b60f-444b85a975cd
bd143611-7a68-410b-80b7-7de95d5fed56	4882e302-8df3-4430-b60f-444b85a975cd
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	81d461f6-3226-4957-bf3e-33c45ac10ed0
bd143611-7a68-410b-80b7-7de95d5fed56	81d461f6-3226-4957-bf3e-33c45ac10ed0
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	e6086cbd-e8d1-4653-858c-8db3efcb55fa
bd143611-7a68-410b-80b7-7de95d5fed56	e6086cbd-e8d1-4653-858c-8db3efcb55fa
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	b1ef69eb-bac2-4d3a-9f0b-171e8cc004af
bd143611-7a68-410b-80b7-7de95d5fed56	b1ef69eb-bac2-4d3a-9f0b-171e8cc004af
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	db1fc5a5-deed-42eb-828b-5c555698f990
bd143611-7a68-410b-80b7-7de95d5fed56	db1fc5a5-deed-42eb-828b-5c555698f990
1081e9d7-a3d2-4a21-be6d-8374e7145768	db1fc5a5-deed-42eb-828b-5c555698f990
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	d4e28bba-de8d-4685-997e-78908579acc0
1081e9d7-a3d2-4a21-be6d-8374e7145768	d4e28bba-de8d-4685-997e-78908579acc0
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	3bc4b222-9fa8-46c0-acc8-3186b561f545
bd143611-7a68-410b-80b7-7de95d5fed56	3bc4b222-9fa8-46c0-acc8-3186b561f545
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	206c22e3-de43-42d5-a769-2dd0a8562cb0
bd143611-7a68-410b-80b7-7de95d5fed56	206c22e3-de43-42d5-a769-2dd0a8562cb0
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	cbb668ab-5f85-4e8e-b167-c504971c84f9
bd143611-7a68-410b-80b7-7de95d5fed56	cbb668ab-5f85-4e8e-b167-c504971c84f9
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	a397868c-c9f2-4a90-9885-4c22c875aea7
bd143611-7a68-410b-80b7-7de95d5fed56	a397868c-c9f2-4a90-9885-4c22c875aea7
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	52549e3e-8931-491e-94fd-1aae25eba5af
bd143611-7a68-410b-80b7-7de95d5fed56	52549e3e-8931-491e-94fd-1aae25eba5af
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	fe2abd63-7c6b-40f4-a55b-cf0599a7b3d4
bd143611-7a68-410b-80b7-7de95d5fed56	fe2abd63-7c6b-40f4-a55b-cf0599a7b3d4
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	a0a3fd0a-0936-45a0-a4b9-fca607fc69e0
bd143611-7a68-410b-80b7-7de95d5fed56	a0a3fd0a-0936-45a0-a4b9-fca607fc69e0
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	dd2ca154-0481-4d12-a36b-478f0cc72253
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	f45c2296-bfa3-488c-97f3-b8c1869253fc
1081e9d7-a3d2-4a21-be6d-8374e7145768	f45c2296-bfa3-488c-97f3-b8c1869253fc
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	60ca2a05-a5e1-4214-aab9-4abf52b22557
bd143611-7a68-410b-80b7-7de95d5fed56	60ca2a05-a5e1-4214-aab9-4abf52b22557
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	cf172056-0b84-4046-8037-293cf69f95f5
1081e9d7-a3d2-4a21-be6d-8374e7145768	cf172056-0b84-4046-8037-293cf69f95f5
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	dceee8a7-beb9-4908-8553-aa1015aa4311
bd143611-7a68-410b-80b7-7de95d5fed56	dceee8a7-beb9-4908-8553-aa1015aa4311
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	ec6bccf3-affe-40f8-990f-6948a4e46ef8
bd143611-7a68-410b-80b7-7de95d5fed56	ec6bccf3-affe-40f8-990f-6948a4e46ef8
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	a3583c57-e3a5-4694-92f6-8d4505f9839a
bd143611-7a68-410b-80b7-7de95d5fed56	a3583c57-e3a5-4694-92f6-8d4505f9839a
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	e8852ed8-954f-4322-b78b-b571ef350275
bd143611-7a68-410b-80b7-7de95d5fed56	e8852ed8-954f-4322-b78b-b571ef350275
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	048c2de6-2d96-4928-a522-fa92da2dee8d
bd143611-7a68-410b-80b7-7de95d5fed56	048c2de6-2d96-4928-a522-fa92da2dee8d
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	93588d7f-3447-4084-8f3c-5db7bf08a3b1
bd143611-7a68-410b-80b7-7de95d5fed56	93588d7f-3447-4084-8f3c-5db7bf08a3b1
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	94f7dffa-ba0a-4b82-b1a4-6da7bbd8ab7d
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	adae6f53-20ff-43b4-b446-ab9076f20e91
bd143611-7a68-410b-80b7-7de95d5fed56	adae6f53-20ff-43b4-b446-ab9076f20e91
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	237822d7-2bf9-4d79-a590-6bc9c6fa6c21
bd143611-7a68-410b-80b7-7de95d5fed56	237822d7-2bf9-4d79-a590-6bc9c6fa6c21
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	144725da-ce29-4188-96ee-8b35071d4797
bd143611-7a68-410b-80b7-7de95d5fed56	144725da-ce29-4188-96ee-8b35071d4797
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	500c4ed6-a2ca-48e7-aa91-b6e0b6d0a77a
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	a5f338c8-2cf8-41a8-8456-8ae7d425555e
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	0230c74f-d858-4aa2-a87d-68a986698825
9df28e2e-7791-4c2a-892c-2da8bd6d4bb8	d3419d44-1755-4943-9f09-2d8eab01246f
bd143611-7a68-410b-80b7-7de95d5fed56	d3419d44-1755-4943-9f09-2d8eab01246f
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.web_origins (client_id, value) FROM stdin;
c75ada75-7228-463d-81bc-2d96e1253ae5	+
2a74862e-2165-4e23-aec8-daa79e9ddcd1	+
eaf18766-7489-4693-a788-95fe5a56096a	*
671898bc-9014-4cbc-ab63-604fb1767d16	/*
\.


--
-- Data for Name: workflow_state; Type: TABLE DATA; Schema: public; Owner: beehyv
--

COPY public.workflow_state (execution_id, resource_id, workflow_id, workflow_provider_id, resource_type, scheduled_step_id, scheduled_step_timestamp) FROM stdin;
\.


--
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


--
-- Name: server_config SERVER_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.server_config
    ADD CONSTRAINT "SERVER_CONFIG_pkey" PRIMARY KEY (server_config_key);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: jgroups_ping constraint_jgroups_ping; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.jgroups_ping
    ADD CONSTRAINT constraint_jgroups_ping PRIMARY KEY (address);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: revoked_token constraint_rt; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: workflow_state pk_workflow_state; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.workflow_state
    ADD CONSTRAINT pk_workflow_state PRIMARY KEY (execution_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- Name: migration_model uk_migration_update_time; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT uk_migration_update_time UNIQUE (update_time);


--
-- Name: migration_model uk_migration_version; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT uk_migration_version UNIQUE (version);


--
-- Name: org uk_org_alias; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);


--
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: workflow_state uq_workflow_resource; Type: CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.workflow_state
    ADD CONSTRAINT uq_workflow_resource UNIQUE (workflow_id, resource_id);


--
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_entity_user_id_type; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_event_entity_user_id_type ON public.event_entity USING btree (user_id, type, event_time);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_idp_for_login; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);


--
-- Name: idx_idp_realm_org; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_by_client; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_offline_css_by_client ON public.offline_client_session USING btree (client_id, offline_flag) WHERE ((client_id)::text <> 'external'::text);


--
-- Name: idx_offline_css_by_client_storage_provider; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_offline_css_by_client_storage_provider ON public.offline_client_session USING btree (client_storage_provider, external_client_id, offline_flag) WHERE ((client_storage_provider)::text <> 'internal'::text);


--
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_org_domain_org_id; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);


--
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_rev_token_on_expire; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: idx_workflow_state_provider; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_workflow_state_provider ON public.workflow_state USING btree (resource_id, workflow_provider_id);


--
-- Name: idx_workflow_state_step; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX idx_workflow_state_step ON public.workflow_state USING btree (workflow_id, scheduled_step_id);


--
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: beehyv
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: beehyv
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

\unrestrict 4NO2BoMQNCfBFFST2odkd821f8zcLZOrP05sj0RqLlW51DTikQtX4JLMj64604y