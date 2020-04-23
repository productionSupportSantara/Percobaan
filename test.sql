select ers.email, tra.name, tra.phone, its.amount, its.bank_from,
case
    when its.bank_to = 1 then "BCA"
    when its.bank_to = 2 then "Mandiri"
    else "Bank Lainnya"
end as bank_to,
DATE_FORMAT(its.created_at,'%Y-%m-%d %T') as tanggal_deposit, DATE_FORMAT(its.updated_at,'%Y-%m-%d %T') as tanggal_verifikasi
from users ers 
join traders tra on tra.user_id = ers.id
join deposits its on its.trader_id = tra.id
where its.status = 1 and its.bank_to is not null
order by its.created_at desc
