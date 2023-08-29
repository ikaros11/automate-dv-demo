SELECT 
supp.supplier_pk
, supplier_name
, supplier_address
, nati.supplier_nation_name
, reg.supplier_nation_name as supplier_region_name
, supplier_phone
, supplier_acctbal
	FROM dw.hub_supplier supp
	INNER JOIN dw.sat_inv_supplier_details det on 
		supp.supplier_pk = det.supplier_pk and supp.load_date between det.load_date and det.effective_from
	INNER JOIN dw.sat_inv_supp_nation_details nati on 
		supp.supplier_pk = nati.supplier_pk and supp.load_date between nati.load_date and nati.effective_from
	INNER JOIN dw.sat_inv_supp_region_details reg ON
		supp.supplier_pk = reg.supplier_pk and supp.load_date between reg.load_date and reg.effective_from