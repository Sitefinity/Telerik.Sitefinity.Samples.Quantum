IF NOT EXISTS(select 1 from uCommerce_DataType where TypeName = 'ContentPickerMultiSelect')
    BEGIN
        INSERT INTO uCommerce_DataType VALUES
        (
            'ContentPickerMultiSelect',
            1,
            '',
            1,
            'ContentPickerMultiSelect',
            0,
            NEWID(),
            GETDATE(),
            '',
            GETDATE(),
            '',
            null
        )
    END