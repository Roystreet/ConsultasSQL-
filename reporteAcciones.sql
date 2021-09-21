select
 td.id as id , t.cod_ticket as ticket, c.first_name as nombreAccionista, c.last_name as apellidoAccionista,
 c.document as  documentoAcc, c.phone as telefono, c.email as correo, c.address as direccion, pais.description as pais, estado.description as estado, ciudad.description as ciudad, 
 p.cod_product as codigoProducto, p.name_product as NombreProducto, p.description as descripcion, p.type_action as tipoAccion, p.action_pack as paqueteAccion,
 a.first_name as NombreInvitado, a.last_name as apellidoInvitado, a.document  as documentoInvitado,
 paisInvertir.description as paisInvertir, t.date_pay as fechaPago,
 pago.name_pay as tipodePago, t.total as total, t.created_at as fechaCreacionticket, t.updated_at  as fechaModificacionTicket, u.username as modificadoPor, 
 t.note as anotacion, status.description as EstadoTicket, t.donate as donada, t.number_operation as NumeroDeOperacion, t.nro_book as nroDeLibro, usuarios.username as creadoPor, t.obser_int as observaciones,
 
 td.cant as cantidad,  td.price as precio,
 m.description as  moneda, m.symbol as  simbolo,
 td.total as total,  banco.name as banco 

from finanzas.ticket_ds  as td
left join finanzas.tickets as t on  td.id_ticket=t.id --customer 
left join finanzas.customers as c on t.id_customer=c.id-- customer 
left join finanzas.country as pais on c.id_country=pais.id-- customer 
left join finanzas.state as estado on c.id_state=estado.id-- customer 
left join finanzas.country as paisInvertir on t.id_country_invert=paisInvertir.id-- ticket
left join finanzas.pays as pago on t.id_pay=pago.id
left join finanzas.city as ciudad on 	c.id_city=ciudad.id
left join finanzas.users  as u on  t.create_by=u.id-- customers 
left join finanzas.users as usuarios on t.modified_by= usuarios.id 
left join finanzas.customers as a on t.id_invited_by= a.id -- customers invitado 
left join finanzas.products as p on td.id_product=p.id 
left join finanzas.moneys as m on td.id_money=m.id 
left join finanzas.status as status on t.status_user=status.id 
left join finanzas.banks as banco on t.id_banck=banco.id  order by fechaCreacionTicket asc

-- usuarios
select document from finanzas.users where id=48;-- ptp 3741755
select * from finanzas.tickets;
select * from finanzas.customers;
select * from finanzas.ticket_ds;
select * from finanzas.moneys;
select * from finanzas.products; 

select * from finanzas.status_pay-- recargas

select * from finanzas.pays;-- tipos de pagos 

select * from finanzas.payments_quotas;-- tabla sin uso 

select * from finanzas.payments_quotas_ds; -- tabla sin uso 

select * from finanzas.status; -- estados de los tickets 

select * from finanzas.country;
select * from finanzas.state;
select * from finanzas.city;