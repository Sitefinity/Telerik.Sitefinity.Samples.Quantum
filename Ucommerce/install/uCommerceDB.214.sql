-- Ucommerce namespaces and assemblies have been renamed (capitalization) so we have to update the following to reflect the changes
UPDATE uCommerce_EntityUi SET [Type] = REPLACE([Type], 
N'UCommerce.EntitiesV2', 
N'Ucommerce.EntitiesV2')

UPDATE uCommerce_EntityUi SET [Type] = REPLACE([Type], 
N', UCommerce',
N', Ucommerce')

UPDATE uCommerce_EntityProperty SET [Value] = REPLACE([Value], 
N'UCommerce.Presentation.Web.Controls.IControlFactory, UCommerce.Presentation', 
N'Ucommerce.Presentation.Web.Controls.IControlFactory, Ucommerce.Presentation')