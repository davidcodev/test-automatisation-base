@REQ_HU_001 @HU001 @actualizar_personaje @marvel_characters_api
Feature: HU_001 Actualizar personaje (microservicio para actualizar personajes existentes de Marvel)

  Background:
    * url port_marvel_characters_api
    * path '/api/characters'
    * def generarHeaders =
      """
      function() {
        return {
          "X-Guid": "88212f38-cc02-4083-a763-8cc09a933840",
          "X-Flow": "update",
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
    * def characterData = read('classpath:data/marvel_characters_api/character_id_valid.json.json')
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
    * def characterData = read('classpath:data/marvel_characters_api/character_id_valid.json.json')
    * path characterData.characterId
    And request requestData
    When method PUT
    Then status 400

  @id:4 @actualizarPersonaje @errorServicio500
  Scenario: T-API-HU_001-CA04-Actualizar personaje con error interno 500 - karate
    * def requestData = read('classpath:data/marvel_characters_api/request_update_character_valid.json')
    * def characterData = read('classpath:data/marvel_characters_api/character_id_valid.json.json')
    * path characterData.characterId
    * header X-Force-Error = 'internal-server-error'
    And request requestData
    When method PUT
    Then status 500