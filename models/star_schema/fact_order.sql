SELECT lin.lineitem_pk
, enc.order_pk
, lin.linenumber
, orderstatus
, totalprice
, orderdate
, orderpriority
, shippriority
, discount
, extendedprice
, quantity
, returnflag
, shipdate
, shipinstruct
, shipmode
, tax
	FROM dw.hub_lineitem lin
	INNER JOIN dw.link_order_lineitem link_lin ON lin.lineitem_pk = link_lin.lineitem_pk
	INNER JOIN dw.hub_order enc ON enc.order_pk = link_lin.order_pk
	INNER JOIN dw.sat_order_order_details enc_det ON enc_det.order_pk = enc.order_pk
	INNER JOIN dw.sat_order_lineitem_details lin_det ON lin_det.lineitem_pk = lin.lineitem_pk
	