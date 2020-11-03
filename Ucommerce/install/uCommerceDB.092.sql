update CIP
set CIP.Value = REPLACE(Value, ',', '.')
from uCommerce_CampaignItemProperty CIP
inner join uCommerce_DefinitionField DF on CIP.DefinitionFieldId = DF.DefinitionFieldId
inner join uCommerce_DataType DT on DF.DataTypeId = DT.DataTypeId
where DT.TypeName = 'Number'

update CP
set CP.Value = REPLACE(Value, ',', '.')
from uCommerce_CategoryProperty CP
inner join uCommerce_DefinitionField DF on CP.DefinitionFieldId = DF.DefinitionFieldId
inner join uCommerce_DataType DT on DF.DataTypeId = DT.DataTypeId
where DT.TypeName = 'Number'

update PMP
set PMP.Value = REPLACE(Value, ',', '.')
from uCommerce_PaymentMethodProperty PMP
inner join uCommerce_DefinitionField DF on PMP.DefinitionFieldId = DF.DefinitionFieldId
inner join uCommerce_DataType DT on DF.DataTypeId = DT.DataTypeId
where DT.TypeName = 'Number'

update PDP
set PDP.Value = REPLACE(Value, ',', '.')
from uCommerce_ProductDescriptionProperty PDP
inner join uCommerce_ProductDefinitionField PDF on PDP.ProductDefinitionFieldId = PDF.ProductDefinitionFieldId
inner join uCommerce_DataType DT on PDF.DataTypeId = DT.DataTypeId
where DT.TypeName = 'Number'

update PP
set PP.Value = REPLACE(Value, ',', '.')
from uCommerce_ProductProperty PP
inner join uCommerce_ProductDefinitionField PDF on PP.ProductDefinitionFieldId = PDF.ProductDefinitionFieldId
inner join uCommerce_DataType DT on PDF.DataTypeId = DT.DataTypeId
where DT.TypeName = 'Number'
