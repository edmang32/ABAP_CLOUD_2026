@AbapCatalog.sqlViewName: 'ZV_CATEGO_386'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Categoría'
@Metadata.ignorePropagatedAnnotations: true
define view ZC_CATEGORIAS386 as select from ztb_catego_386 as Categoria
{
    key bi_categ as Categoria,
    descripcion  as Descripcion
}
