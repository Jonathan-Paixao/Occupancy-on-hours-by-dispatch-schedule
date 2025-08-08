SELECT
  -- 1. Seleciona todas as colunas originais
  mcte.*,

  -- 2. Colunas adicionadas/modificadas
  COALESCE(p.familia, 'N/E Familia ZP80') AS familia,
  mdata.VOLUM AS volume,
  mdata.VOLEH AS medida_volume,
  mdata.NTGEW AS peso_liquido,
  mdata.GEWEI AS unidade_peso,

  -- 3. Coluna "Mercado"
  CASE
    WHEN mcte.carteira IN (
      'Ats Distribuidoras', 'Ats Off', 'Ats On', 'CDP Bronze', 'CDP Diamante',
      'CDP Ouro', 'CDP Prata', 'Descredenciado', 'Elite', 'Em credenciamento',
      'Key Account', 'Novos Negócios', 'Plus', 'Top', 'Ultra'
    ) THEN 'B2B'
    WHEN mcte.carteira IN ('D2C Marketplace', 'D2C Sites') THEN 'D2C'
    WHEN mcte.carteira IN ('Distribuidores ME', 'Supply') THEN 'ME'
    ELSE 'Outro valor'
  END AS Mercado,

  -- 4. Coluna "fator"
  CASE
    WHEN mcte.Fatura_Qtd BETWEEN 1 AND 3 THEN 'P01'
    WHEN mcte.Fatura_Qtd BETWEEN 4 AND 5 THEN 'P02'
    WHEN mcte.Fatura_Qtd BETWEEN 6 AND 7 THEN 'P03'
    WHEN mcte.Fatura_Qtd BETWEEN 8 AND 9 THEN 'P04'
    WHEN mcte.Fatura_Qtd BETWEEN 10 AND 11 THEN 'P05'
    WHEN mcte.Fatura_Qtd BETWEEN 12 AND 14 THEN 'P06'
    WHEN mcte.Fatura_Qtd BETWEEN 15 AND 19 THEN 'P07'
    WHEN mcte.Fatura_Qtd BETWEEN 20 AND 27 THEN 'P08'
    WHEN mcte.Fatura_Qtd BETWEEN 28 AND 46 THEN 'P09'
    WHEN mcte.Fatura_Qtd BETWEEN 47 AND 130 THEN 'P10'
    WHEN mcte.Fatura_Qtd BETWEEN 131 AND 1000 THEN 'P11'
    WHEN mcte.Fatura_Qtd BETWEEN 1001 AND 2500 THEN 'P12'
    WHEN mcte.Fatura_Qtd BETWEEN 2501 AND 5000 THEN 'P13'
    WHEN mcte.Fatura_Qtd > 5000 THEN 'P14'
    ELSE 'Sem classificação'
  END AS fator,

  -- 5. Nova coluna "week" com a lógica correta de calendário
  CONCAT('Week ', CAST(
    (EXTRACT(WEEK(SUNDAY) FROM mcte.Ultima_data_de_modificacao) - EXTRACT(WEEK(SUNDAY) FROM DATE_TRUNC(mcte.Ultima_data_de_modificacao, MONTH))) + 1
  AS STRING)) AS week,

  -- 6. Nova coluna "M3 calculado" com a conversão de volume
  CASE mdata.VOLEH
    WHEN 'M3' THEN mdata.VOLUM / 1
    WHEN 'L' THEN mdata.VOLUM / 1000
    WHEN 'CDM' THEN mdata.VOLUM / 1000
    WHEN 'ML' THEN mdata.VOLUM / 1000000
    WHEN 'CCM' THEN mdata.VOLUM / 1000000
    ELSE NULL
  END AS `M3 calculado`

FROM
  `whr-lar-gtm-cx-data-lake.views_pecas_adm_pivo.tb_mcte` AS mcte
LEFT JOIN
  `whr-lar-gtm-cx-data-lake.transacoes_sap_ecc.zp80` AS p
  ON mcte.Material = CAST(p.material AS STRING)
LEFT JOIN
  `whr-lar-finance-lab-data-lake.master_data.vw_tb_mara` AS mdata
  ON mcte.Material = CAST(mdata.MATNR AS STRING)

 where
 mcte.Fatura_Qtd > 0
