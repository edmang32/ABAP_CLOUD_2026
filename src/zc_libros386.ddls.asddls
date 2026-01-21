@AbapCatalog.sqlViewName: 'ZV_LIBROS386'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@UI.headerInfo : { typeName: 'Libro',
                   typeNamePlural: 'Libros',
                      title: { type: #STANDARD,
                              value: 'Titulo'},
                description: { type: #STANDARD,
                              value: 'Autor' },
                 imageUrl:   'Imagen' }
define view ZC_LIBROS386 as select from ztb_libros_386 as libros
inner join ztb_catego_386 as catego on libros.bi_categ = catego.bi_categ
left outer join ZC_CLNTS_LIB386 as ventas on libros.id_libro = ventas.IdLibro
association [0..*] to ZC_CLIENTES_386 as _Clientes on $projection.IdLibro = _Clientes.IdLibro
{
    key libros.id_libro as IdLibro,
        libros.titulo   as Titulo,
        libros.bi_categ as Categoria,
        libros.autor as Autor,
        libros.editorial as Editorial,
        libros.idioma as Idioma,
        libros.paginas as Paginas,
        @Semantics.amount.currencyCode: 'moneda'
        libros.precio as Precio,
        ventas.Ventas as Ventas,
        
        case
        when ventas.Ventas < 1 then 1
        when ventas.Ventas = 1 then 2
        when ventas.Ventas = 2 then 2
        when ventas.Ventas > 2 then 3
        else 1
        end as Vtas2,
        
        case
        when ventas.Ventas < 1 then 'SinVentas'
        when ventas.Ventas = 1 then 'UnoVendido'
        when ventas.Ventas = 2 then 'DosVendidos'
        when ventas.Ventas > 2 then '+2Vendidos'
        else 'SinVentas'
        end as Calif_Vtas,
        @Semantics.currencyCode: true
        libros.moneda as Moneda,
        libros.formato as Formato,
        catego.descripcion as Descripcion,
        libros.url as Imagen,
        _Clientes
    
}
