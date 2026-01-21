@AbapCatalog.sqlViewName: 'ZV_CLIENTES_386'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@UI.headerInfo : { typeName: 'Cliente',
                      title: { type: #STANDARD,
                              value: 'NombreCompleto'},
                description: { type: #STANDARD,
                              value: 'IdCliente' },
                 imageUrl:   'Imagen'
}
define view ZC_CLIENTES_386
  as select from ztb_clientes_386 as clientes
    inner join   ztb_clnts_lib386 as clntslib on clntslib.id_cliente = clientes.id_cliente
{
  key clntslib.id_libro    as IdLibro,
  key clientes.id_cliente  as IdCliente,
  key clientes.tipo_acceso as Acceso,

      clientes.nombre      as Nombre,
      clientes.apellidos   as Apellidos,
      clientes.email       as Email,
      clientes.url         as Imagen,
      concat_with_space(clientes.nombre, clientes.apellidos, 1) as NombreCompleto
}
