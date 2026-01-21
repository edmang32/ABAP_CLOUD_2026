@AbapCatalog.sqlViewName: 'ZV_CLNTS_LIB386'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ventas'
@Metadata.ignorePropagatedAnnotations: true
define view ZC_CLNTS_LIB386
  as select from ztb_clnts_lib386
{
  key id_libro                     as IdLibro,
      count( distinct id_cliente ) as Ventas

}
group by
  id_libro
