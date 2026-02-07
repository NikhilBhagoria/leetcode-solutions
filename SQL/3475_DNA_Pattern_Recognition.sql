-- Problem: 3475 - DNA Pattern Recognition 
-- Table: Samples
-- Identify DNA patterns:
-- 1. Starts with ATG
-- 2. Ends with TAA, TAG, or TGA
-- 3. Contains ATAT
-- 4. Contains at least three consecutive G (GGG)
-- Return results ordered by sample_id

SELECT
    sample_id,
    dna_sequence,
    species,
    
    -- Starts with ATG
    CASE 
        WHEN dna_sequence LIKE 'ATG%' THEN 1 
        ELSE 0 
    END AS has_start,
    
    -- Ends with stop codon
    CASE 
        WHEN dna_sequence LIKE '%TAA'
          OR dna_sequence LIKE '%TAG'
          OR dna_sequence LIKE '%TGA'
        THEN 1 
        ELSE 0 
    END AS has_stop,
    
    -- Contains ATAT motif
    CASE 
        WHEN dna_sequence LIKE '%ATAT%' THEN 1 
        ELSE 0 
    END AS has_atat,
    
    -- Contains at least three consecutive G
    CASE 
        WHEN dna_sequence LIKE '%GGG%' THEN 1 
        ELSE 0 
    END AS has_ggg

FROM Samples
ORDER BY sample_id;
