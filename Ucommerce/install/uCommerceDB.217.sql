IF NOT EXISTS(select 1 from uCommerce_DataType where TypeName = 'ImagePickerMultiSelect')
    BEGIN
        INSERT INTO uCommerce_DataType VALUES
        (
            'ImagePickerMultiSelect',
            1,
            '',
            1,
            'ImagePickerMultiSelect',
            0,
            NEWID(),
            GETDATE(),
            '',
            GETDATE(),
            '',
            null
        )
    END