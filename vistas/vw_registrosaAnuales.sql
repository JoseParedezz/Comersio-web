go

create view vw_registrosaAnuales as
select 
    year(R.fecha) as año,
    sum(R.cantidad_compras) as total_compras_anual,
    sum(R.total_importe_mes) as total_importe_anual,
    (
        select top 1 datename(month, R2.fecha)
        from Registros R2
        where year(R2.fecha) = year(r.fecha)
        order by R2.total_importe_mes desc
    ) as mes_mayor_importe
from Registros R
group by year(R.fecha)
