declare
  v_ecif_id       number(10);
  v_tmp_level     number(2);
  v_pension_flag  number(2);
  v_cust_status   number(2);
  v_property_lvl  number(2);
  v_pro_expiry_dt date;
  v_property_lvl2 number(2);
  v_fi_expiry_dt  date;
  v_curr_date     date;
  v_year_after    date;
begin
  select trunc(sysdate) into v_curr_date from dual;
  select add_months(trunc(sysdate), 12) into v_year_after from dual;
  for cust in (select a.ecif_id,
                      b.finance_id,
                      b.fi_level,
                      a.pension_flag,
                      b.fi_expiry_dt,
                      a.t24_cust_status_tp_cd,
                      a.property_lvl_flag,
                      a.pro_lvl_expiry_dt,
                      b.pf_reserved_2
                 from ecif.bos_person a, ecif.bos_p_finance b
                where a.ecif_id = b.ecif_id
                  and a.last_update_dt>sysdate-1) loop
    begin
      v_ecif_id       := cust.ecif_id;
      v_tmp_level     := 0;
      v_pro_expiry_dt := cust.pro_lvl_expiry_dt;
      v_fi_expiry_dt  := null;
      select decode(cust.pension_flag,null,0,1,10,0) into v_pension_flag from dual;
      select decode(cust.t24_cust_status_tp_cd,50,0,51,0,52,20,53,40,54,50,55,50,0) into v_cust_status from dual;
      select decode(cust.property_lvl_flag,1,30,2,40,3,50,4,50,0) into v_property_lvl from dual;
      select decode(cust.pf_reserved_2,5,0,4,30,3,40,2,50,1,50,0) into v_property_lvl2 from dual;
      if v_pension_flag >= v_cust_status then
        v_tmp_level := v_pension_flag;
      else
        v_tmp_level := v_cust_status;
      end if;
      if v_property_lvl >= v_tmp_level then
        v_tmp_level := v_property_lvl;
      else
        v_tmp_level := v_tmp_level;
      end if;
      if v_property_lvl2 >= v_tmp_level then
        v_tmp_level := v_property_lvl2;
      else
        v_tmp_level := v_tmp_level;
      end if;
      --高净值以上客户不参考服务等级
      if v_tmp_level >= 30 then
        v_tmp_level := v_pension_flag;
        if v_cust_status = 20 then
          v_tmp_level := v_cust_status;
        end if;
        --只参考有效的ecif资产等级
        if v_pro_expiry_dt >= v_curr_date or v_pro_expiry_dt is null then
          if v_property_lvl >= v_tmp_level then
            v_tmp_level := v_property_lvl;
          else
            v_tmp_level := v_tmp_level;
          end if;
        end if;
        if v_property_lvl2 >= v_tmp_level then
          v_tmp_level := v_property_lvl2;
        else
          v_tmp_level := v_tmp_level;
        end if;
      end if;
      if v_tmp_level < 30 then
        v_fi_expiry_dt := null;
      else
        v_fi_expiry_dt := v_year_after;
      end if;
      update ecif.bos_p_finance c
         set c.fi_level = v_tmp_level, c.fi_expiry_dt = v_fi_expiry_dt
       where c.ecif_id = v_ecif_id;
      commit;
    exception
      when others then
        null;
    end;
  end loop;
end;

/
