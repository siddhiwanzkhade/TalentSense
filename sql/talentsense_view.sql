
-- 1) BASE VIEW
create or replace view analytics.vw_talentsense_base as
select
    job_id,
    company_id,
    company_name,

    role_title,
    experience_level,
    work_type,
    location,
    remote_allowed,
    sponsored,

    datetime,
    extract(year from datetime)::int as post_year,
    date_trunc('week', datetime)::date as post_week,
    datetime::date as post_date,

    monthly_salary_usd,
    avg_salary_monthly_usd,
    min_salary_usd,
    max_salary_usd,
    annual_salary,

    views,
    applies,

    currency,
    pay_period
from analytics.job_listings
where datetime is not null;


-- 2) KPI SNAPSHOT VIEW
create or replace view analytics.vw_kpi_snapshot as
select
    count(*) as total_postings,
    count(distinct company_id) as total_companies,

    round(avg(monthly_salary_usd)::numeric, 2) as avg_monthly_salary_usd,
    percentile_cont(0.5) within group (order by monthly_salary_usd) as median_monthly_salary_usd,

    round(100.0 * avg(case when remote_allowed is true then 1 else 0 end)::numeric, 2) as pct_remote,
    round(avg(views)::numeric, 2) as avg_views,
    round(avg(applies)::numeric, 2) as avg_applies
from analytics.vw_talentsense_base;


-- 3) WEEKLY AGGREGATED VIEW
create or replace view analytics.vw_talentsense_weekly as
select
    post_year,
    post_week,
    count(*) as postings,

    round(avg(monthly_salary_usd)::numeric, 2) as avg_monthly_salary_usd,
    round(100.0 * avg(case when remote_allowed is true then 1 else 0 end)::numeric, 2) as pct_remote
from analytics.vw_talentsense_base
group by post_year, post_week
order by post_year, post_week;


-- 4) TOP ROLES VIEW
create or replace view analytics.vw_top_roles as
select
    role_title,
    count(*) as postings,
    round(avg(monthly_salary_usd)::numeric, 2) as avg_monthly_salary_usd
from analytics.vw_talentsense_base
where role_title is not null and role_title <> ''
group by role_title
order by postings desc;


-- 5) SALARY BY EXPERIENCE VIEW
create or replace view analytics.vw_salary_by_experience as
select
    experience_level,
    count(*) as postings,
    round(avg(monthly_salary_usd)::numeric, 2) as avg_monthly_salary_usd
from analytics.vw_talentsense_base
where experience_level is not null and experience_level <> ''
group by experience_level
order by postings desc;


-- 6) LOCATION DEMAND VIEW
create or replace view analytics.vw_location_demand as
select
    location,
    count(*) as postings,
    round(avg(monthly_salary_usd)::numeric, 2) as avg_monthly_salary_usd,
    round(100.0 * avg(case when remote_allowed is true then 1 else 0 end)::numeric, 2) as pct_remote
from analytics.vw_talentsense_base
where location is not null and location <> ''
group by location
order by postings desc;

-- basic checks
select count(*) from analytics.vw_kpi_snapshot;
select * from analytics.vw_talentsense_weekly limit 5;
select * from analytics.vw_top_roles limit 5;
select * from analytics.vw_salary_by_experience;
select * from analytics.vw_location_demand limit 5;
