UPDATE dbo.uCommerce_ProductCatalogGroup
SET Secret = CONVERT(varchar(255), NEWID()) + 'pkPdRblQH1i389c7wJG4gsLcpTDKouTLPZ6630T8hXDa7uTBvuxUYC1QEQn6cLGfdNCKTEj9Gu7SSe2XKRFsvL9Es6INsCO7OTUCuI8c55uKhtNz58KhFzG0DpjW2C2BkN'
where Secret = 'secret'