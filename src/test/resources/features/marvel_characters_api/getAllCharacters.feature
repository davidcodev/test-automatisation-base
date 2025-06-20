@REQ_HU_001 @HU001 @obtener_todos_personajes @marvel_characters_api
Feature: HU_001 Obtener todos los personajes (microservicio para consultar lista de personajes de Marvel)

  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/daadavil'
    * path '/api/characters'
    * def generarHeaders =
      """
      function() {
        return {
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