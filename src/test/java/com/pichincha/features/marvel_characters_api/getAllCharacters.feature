@REQ_HU_001 @HU001 @obtener_todos_personajes @marvel_characters_api
Feature: HU_001 Obtener todos los personajes (microservicio para consultar lista de personajes de Marvel)

  Background:
    * url port_marvel_characters_api
    * path '/api/characters'
    * def generarHeaders =
      """
      function() {
        return {
          "X-Guid": "88212f38-cc02-4083-a763-8cc09a933840",
          "X-Flow": "consultation",
          "Content-Type": "application/json",
          "Accept": "application/json"
        };
      }
      """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @obtenerPersonajes @consultaExitosa200
  Scenario: T-API-HU_001-CA01-Obtener todos los personajes exitosamente 200 - karate
    When method GET
    Then status 200

  @id:2 @obtenerPersonajes @errorServicio500
  Scenario: T-API-HU_001-CA02-Obtener personajes con error interno 500 - karate
    * header X-Force-Error = 'internal-server-error'
    When method GET
    Then status 500