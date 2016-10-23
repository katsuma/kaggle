-- avg(mr.) = 32.3
-- avg(mrs.) = 35.9
-- avg(miss.) = 21.7


select
 passenger_id,
--  survived,

  case when pclass = 1 then 1 else 0 end AS pclass_1,
  case when pclass = 2 then 1 else 0 end AS pclass_2,
  case when pclass = 3 then 1 else 0 end AS pclass_3,


  case when instr(name, 'Mr.') > 0 then 1 else 0 end AS name_mr,
  case when instr(name, 'Mrs.') > 0 then 1 else 0 end AS name_mrs,
  case when instr(name, 'Miss.') > 0 then 1 else 0 end AS name_miss,
  case when instr(name, 'Don.') > 0 then 1 else 0 end AS name_don,
  case when instr(name, 'Dr.') > 0 then 1 else 0 end AS name_dr,
  case when instr(name, 'Major.') > 0 then 1 else 0 end AS name_major,
  case when instr(name, 'Jonkheer.') > 0 then 1 else 0 end AS name_jonkheer,
  case when instr(name, 'Master.') > 0 then 1 else 0 end AS name_master,
  case when instr(name, 'Col.') > 0 then 1 else 0 end AS name_col,
  case when instr(name, 'Capt.') > 0 then 1 else 0 end AS name_capt,
  case when instr(name, 'Mme.') > 0 then 1 else 0 end AS name_mme,
  case when instr(name, 'Countess.') > 0 then 1 else 0 end AS name_countess,
  case when instr(name, 'Mlle.') > 0 then 1 else 0 end AS name_mlle,
  case when instr(name, 'Rev.') > 0 then 1 else 0 end AS name_rev,

  case when sex = 'male' then 1 else 0 end AS male,
  case when sex = 'female' then 1 else 0 end AS female,

  -- age,
  case when age >=  0 and age <  5 then 1 else 0 end AS age_05,
  case when age >=  5 and age < 10 then 1 else 0 end AS age_10,
  case when (age >= 10 and age < 20) or (age is null and instr(name, 'Miss.') > 0) then 1 else 0 end AS age_20,
  case when (age >= 20 and age < 30) or (age is null and instr(name, 'Miss')  = 0) then 1 else 0 end AS age_30,
  case when age >= 30 and age < 40 then 1 else 0 end AS age_40,
  case when age >= 40 and age < 50 then 1 else 0 end AS age_50,
  case when age >= 50 and age < 60 then 1 else 0 end AS age_60,
  case when age >= 60 and age < 70 then 1 else 0 end AS age_70,
  case when age >= 70 and age < 80 then 1 else 0 end AS age_80,
  case when age >= 80 and age < 90 then 1 else 0 end AS age_90,


--  sibsp,
  case when sibsp = 0 then 1 else 0 end AS sibsp_0,
  case when sibsp = 1 then 1 else 0 end AS sibsp_1,
  case when sibsp = 2 then 1 else 0 end AS sibsp_2,
  case when sibsp = 3 then 1 else 0 end AS sibsp_3,
  case when sibsp = 4 then 1 else 0 end AS sibsp_4,
  case when sibsp = 5 then 1 else 0 end AS sibsp_5,
  case when sibsp > 5 then 1 else 0 end AS sibsp_more,

--  parch,
  case when parch = 0 then 1 else 0 end AS parch_0,
  case when parch = 1 then 1 else 0 end AS parch_1,
  case when parch = 2 then 1 else 0 end AS parch_2,
  case when parch = 3 then 1 else 0 end AS parch_3,
  case when parch = 4 then 1 else 0 end AS parch_4,
  case when parch = 5 then 1 else 0 end AS parch_5,
  case when parch > 5 then 1 else 0 end AS parch_more,

--  ticket,
--  fare,
--  cabin,
--  case when instr(cabin, 'A') > 0 then 1 else 0 end AS cabin_a,
--  case when instr(cabin, 'B') > 0 then 1 else 0 end AS cabin_b,
--  case when instr(cabin, 'C') > 0 then 1 else 0 end AS cabin_c,
--  case when instr(cabin, 'D') > 0 then 1 else 0 end AS cabin_d,
--  case when instr(cabin, 'E') > 0 then 1 else 0 end AS cabin_e,
--  case when instr(cabin, 'F') > 0 then 1 else 0 end AS cabin_f,
--  case when instr(cabin, 'G') > 0 then 1 else 0 end AS cabin_g,
--  case when instr(cabin, 'T') > 0 then 1 else 0 end AS cabin_t,

  case when embarked = 'S' then 1 else 0 end AS emb_s,
  case when embarked = 'C' then 1 else 0 end AS emb_c,
  case when embarked = 'Q' then 1 else 0 end AS emb_q

from titanic_trains
-- where survived is not null
 where survived is null
;
