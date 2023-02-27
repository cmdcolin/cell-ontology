PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX has_part: <http://purl.obolibrary.org/obo/BFO_0000051>
PREFIX oboInOwl: <http://www.geneontology.org/formats/oboInOwl#>

CONSTRUCT {
  ?term ?property ?value .
}

WHERE {
  VALUES ?property { oboInOwl:hasAlternativeId }
  ?other_term owl:deprecated "true"^^xsd:boolean .
  BIND(REPLACE(STR(?other_term),"http://purl.obolibrary.org/obo/CL_","CL:") as ?id)
  ?term ?property ?value .
  FILTER(STR(?value)=STR(?id))
}