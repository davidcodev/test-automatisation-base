@REQ_HU_001 @HU001 @actualizar_personaje @marvel_characters_api
Feature: HU_001 Actualizar personaje (microservicio para actualizar personajes existentes de Marvel)

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

  @id:1 @actualizarPersonaje @actualizacionExitosa200
  Scenario: T-API-HU_001-CA01-Actualizar personaje exitosamente 200 - karate
    * def requestData = read('classpath:data/marvel_characters_api/request_update_character_valid.json')
    * def characterData = read('classpath:data/marvel_characters_api/character_id_valid.json')
    * path characterData.characterId
    And request requestData
    When method PUT
    Then status 200

  @id:2 @actualizarPersonaje @personajeNoExiste404
  Scenario: T-API-HU_001-CA02-Actualizar personaje que no existe 404 - karate
    * def requestData = read('classpath:data/marvel_characters_api/request_update_character_valid.json')
    * def characterData = read('classpath:data/marvel_characters_api/character_id_not_found.json')
    * path characterData.characterId
    And request requestData
    When method PUT
    Then status 404

  @id:3 @actualizarPersonaje @errorValidacion400
  Scenario: T-API-HU_001-CA03-Actualizar personaje con datos inválidos 400 - karate
    * def requestData = read('classpath:data/marvel_characters_api/request_update_character_invalid.json')
    * def characterData = read('classpath:data/marvel_characters_api/character_id_valid.json')
    * path characterData.characterId
    And request requestData
    When method PUT
    Then status 400