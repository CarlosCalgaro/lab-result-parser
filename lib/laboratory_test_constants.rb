

module LaboratoryTestConstants 

    FORMATS = {
        C100: :float,
        C200: :float,
        A250: :boolean,
        B250: :nil_3plus
    }

    module FileImport
        DELIMITER = "|"
        LAB_RESULT_START_TOKEN = "OBX|"
        LAB_COMMENT_START_TOKEN = "NTE|"
    end

end