# Data dictionary

## region
| Field | Description | Type | Rules |
| ----- | ----------- | ---- | ----- |
| `reg_code` (PK) | Region code | INTEGER | Not null, between 0 and 94 |
| `reg_nom` | Region name | VARCHAR(45) | Not null |
| `regrgp_nom` | Region group name | VARCHAR(45) | Not null |

## commune
| Field | Description | Type | Rules |
| ----- | ----------- | ---- | ----- |
| `coddep_codcom` (PK) | Department code + commune code | VARCHAR(8) | Not null |
| `com_nom_maj` | Commune name, upper case | VARCHAR(45) | Not null |
| `dep_code` | Department code | VARCHAR(8) | Not null |
| `dep_nom` | Department name | VARCHAR(45) | Not null |
| `population` | Population of the commune (INSEE) | INTEGER | Can be null |
| `reg_code` (FK → region) | Region code | INTEGER | Not null |

## biens (properties)
| Field | Description | Type | Rules |
| ----- | ----------- | ---- | ----- |
| `id_bien` (PK) | Property identifier | VARCHAR(6) | Not null |
| `type_local` | Property type (Appartement or Maison) | VARCHAR(12) | Not null |
| `surface` | Built surface (m²) | INTEGER | Not null, 1 to 379 |
| `surface_carrez` | Carrez surface (m²), the legal surface for apartments | REAL | Not null |
| `nombre_pieces_principales` | Number of main rooms | INTEGER | Not null, 0 to 11 |
| `coddep_codcom` (FK → commune) | Department code + commune code | VARCHAR(8) | Concatenation of `code_dep` and `code_com` |
| `code_dep` | Department code | VARCHAR(3) | Not null |
| `code_com` | Commune code | VARCHAR(5) | Not null |

## ventes (sales)
| Field | Description | Type | Rules |
| ----- | ----------- | ---- | ----- |
| `id_vente` (PK) | Sale identifier | VARCHAR(6) | Not null |
| `date` | Sale date | TEXT (YYYY-MM-DD) | Not null |
| `montant` | Sale amount (€) | REAL | Can be null |
| `id_bien` (FK → biens) | Property identifier | VARCHAR(6) | Not null |

Street address fields (`no_voie`, `b_t_q`, `type_de_voie`, `voie`) existed in the original database and were removed from this public version. The original dictionary, in French, is in `data-dictionary-original-fr.xlsx`.
