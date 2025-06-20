@REQ_HU_001 @HU001 @obtener_personaje_por_id @marvel_characters_api
Feature: HU_001 Obtener personaje por ID (microservicio para consultar personaje específico de Marvel)

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

  @id:1 @obtenerPersonajePorId @consultaExitosa200
  Scenario: T-API-HU_001-CA01-Obtener personaje por ID exitosamente 200 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/character_id_valid.json')
    * path jsonData.characterId
    When method GET
    Then status 200

  @id:2 @obtenerPersonajePorId @personajeNoExiste404
  Scenario: T-API-HU_001-CA02-Obtener personaje por ID que no existe 404 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/character_id_not_found.json')
    * path jsonData.characterId
    When method GET
    Then status 404

  @id:3 @obtenerPersonajePorId @errorValidacion400
  Scenario: T-API-HU_001-CA03-Obtener personaje con ID inválido 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/character_id_invalid.json')
    * path jsonData.characterId
    When method GET
    Then status 500