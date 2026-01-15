create schema if not exists analytics;

create table if not exists analytics.job_listings (

    company_id                 varchar(50),
    company_name               varchar(150),
    job_id                     varchar(50) primary key,
    role_title                 varchar(150),
    skills_desc                text,
    experience_level           varchar(50),
    currency                   varchar(10),
    compensation_type          varchar(50),
    pay_period                 varchar(30),
    annual_salary              numeric(12,2),
    min_salary_usd             numeric(12,2),
    max_salary_usd             numeric(12,2),
    avg_salary_monthly_usd     numeric(12,2),
    monthly_salary_usd         numeric(12,2),
    work_type                  varchar(50),
    location                   varchar(150),
    remote_allowed             boolean,
    sponsored                  boolean,
    datetime                   timestamp,
    views                      integer,
    applies                    integer
);

select column_name, data_type
from information_schema.columns
where table_schema = 'analytics'
  and table_name = 'job_listings'
order by ordinal_position;

select count(*) from analytics.job_listings;

-- verifying if data exists--
select * from analytics.job_listings limit 10;

-- removing duplicates---
select
  count(*) as rows,
  count(distinct job_id) as unique_jobs
from analytics.job_listings;

-- 
