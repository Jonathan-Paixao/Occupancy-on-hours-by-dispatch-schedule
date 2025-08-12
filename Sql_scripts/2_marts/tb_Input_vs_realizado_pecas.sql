-- CTE 0: Unifica as tabelas e prepara os dados (LÓGICA INTACTA)
WITH base_dados_unificada AS (
  SELECT
    mcte.Ultima_data_de_modificacao,
    mcte.Carteira_Liquida,
    mcte.Faturado_Liquido,
    SAFE.PARSE_DATE('%d/%m/%Y', ns.DATA_REMESSA) AS DATA_REMESSA,
    SAFE.PARSE_DATE('%d/%m/%Y', ns.DATA_TRANSPORTE) AS DATA_TRANSPORTE
  FROM
    (
      SELECT
        *,
        CONCAT(CAST(NUMERO_ORDEM AS STRING), REGEXP_REPLACE(Material, r'^0+', '')) AS Ordem_Material_Concat
      FROM
        ``
      WHERE
        Carteira NOT IN ('Distribuidores ME', 'Supply', 'Distributor')
        AND TIPO_OV = 'FG'
        AND EXTRACT(YEAR FROM Data_de_Criacao) = EXTRACT(YEAR FROM CURRENT_DATE())
    ) AS mcte
    LEFT JOIN `` AS ns 
    ON mcte.Ordem_Material_Concat = ns.ORDEM_MATERIAL
),
-- CTE 1: Agrega os valores de Input e Faturamento (LÓGICA INTACTA)
input_faturamento_agg AS (
  SELECT
    Ultima_data_de_modificacao AS data_agg,
    SUM(Carteira_Liquida) AS Input,
    SUM(Faturado_Liquido) AS Faturamento
  FROM
    base_dados_unificada
  GROUP BY
    data_agg
),
-- CTE 2: Agrega o valor de Remessa (LÓGICA INTACTA)
remessa_agg AS (
  SELECT
    DATA_REMESSA AS data_agg,
    SUM(Carteira_Liquida) AS Remessa
  FROM
    base_dados_unificada
  GROUP BY
    data_agg
),
-- CTE 3: Agrega o valor de Transporte (LÓGICA INTACTA)
transporte_agg AS (
  SELECT
    DATA_TRANSPORTE AS data_agg,
    SUM(Carteira_Liquida) AS Transporte
  FROM
    base_dados_unificada
  GROUP BY
    data_agg
),
-- CTE 4: >>> A MUDANÇA PRINCIPAL ESTÁ AQUI! <<<
-- Agora usamos a tabela de METAS como nosso calendário principal, garantindo que todos os dias do mês existam.
todas_as_datas AS (
  SELECT DISTINCT
    Data AS data
  FROM
    ``
  WHERE Data IS NOT NULL
    AND EXTRACT(YEAR FROM Data) = EXTRACT(YEAR FROM CURRENT_DATE()) -- Filtro opcional para performance
)
-- SELECT Final: Junta todas as agregações e a tabela de metas (LÓGICA INTACTA)
SELECT
  d.data AS Data,
  IFNULL(i_f.Input, 0) AS Input,
  IFNULL(r.Remessa, 0) AS Remessa,
  IFNULL(t.Transporte, 0) AS Transporte,
  IFNULL(i_f.Faturamento, 0) AS Faturamento,
  metas.Meta_faturamento,
  metas.Meta_Input,
  metas.AT_Valor,
  metas.KA_Valor,
  metas.Revendas_Valor,
  metas.Novos_Neg_Valor,
  metas.Rev_CDP_Valor,
  metas.D2C_Valor
FROM
  todas_as_datas AS d
  LEFT JOIN input_faturamento_agg AS i_f ON d.data = i_f.data_agg
  LEFT JOIN remessa_agg AS r ON d.data = r.data_agg
  LEFT JOIN transporte_agg AS t ON d.data = t.data_agg
  LEFT JOIN `` AS metas ON d.data = metas.Data
WHERE
  d.data IS NOT NULL -- Remove linhas onde a data possa ser nula
ORDER BY
  d.data;