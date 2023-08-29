SELECT 
cust.customer_pk
, customer_name
, customer_address
, customer_nation_name
, customer_region_name
, customer_phone
, customer_accbal
, customer_mktsegment 
	FROM dw.hub_customer cust
	INNER JOIN dw.sat_order_cust_nation_details nati on 
		cust.customer_pk = nati.customer_pk and cust.load_date between nati.load_date and nati.effective_from
	INNER JOIN dw.sat_order_customer_details det ON
		cust.customer_pk = det.customer_pk and cust.load_date between det.load_date and det.effective_from
	INNER JOIN dw.sat_order_cust_region_details reg ON
		cust.customer_pk = reg.customer_pk and cust.load_date between reg.load_date and reg.effective_from