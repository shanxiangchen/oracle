create or replace function func_id15_id18(prm_id15 varchar2)
  return varchar2  is
  ll_i       number(4) := 18;
  ll_row     number(5) := 0;
  ll_num     number(2);
  ll_id18    varchar2(3);
  var_id18 varchar2(180);
  var_date   varchar2(20);
  dat_date   date;
begin
  if prm_id15 is null then
    return '';
  end if;
  if length(prm_id15) <> 15 then
    return prm_id15;
  end if;
  if length(prm_id15) = 15 then
    var_date := '19' || substr(prm_id15, 7, 6);
    begin
      select to_date(var_date, 'yyyymmdd') into dat_date from dual;
    exception
      when others then
        return prm_id15;
    end;
    var_id18 := substr(prm_id15, 0, 6) || '19' || substr(prm_id15, 7, 9);
    while ll_i >= 2 loop
      begin
        select to_number(substr(var_id18, 19 - ll_i, 1))
          into ll_num
          from dual;
      exception
        when others then
          return prm_id15;
      end;
      ll_row := ll_row + mod(power(2, (ll_i - 1)), 11) *
                to_number(substr(var_id18, 19 - ll_i, 1));
      ll_i   := ll_i - 1;
    end loop;
    ll_id18 := to_char(mod(ll_row, 11));
    select decode(ll_id18,'0','1','1','0','2','X','3','9','4','8','5','7','6','6','7','5','8','4','9','3','10','2')
    into ll_id18 from dual;
    var_id18 := var_id18 || ll_id18;
    return var_id18;
  end if;
end func_id15_id18;
