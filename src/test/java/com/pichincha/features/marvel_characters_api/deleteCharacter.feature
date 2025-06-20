@REQ_HU_001 @HU001 @eliminar_personaje @marvel_characters_api @Agente2 @E2 @iniciativa_marvel_api
Feature: HU_001 Eliminar personaje (microservicio para eliminar personajes de Marvel)

  Background:
    * url port_marvel_characters_api
    * path '/api/characters'
    * def generarHeaders =
      """
      function() {
        return {
          "X-Guid": "88212f38-cc02-4083-a763-8cc09a933840",
          "X-Flow": "deletion",
          "Content-Type": "application/json",
          "Accept": "application/json"
        };
      }
      """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @eliminarPersonaje @eliminacionExitosa204
  Scenario: T-API-HU_001-CA01-Eliminar personaje exitosamente 204 - karate
    * def characterData = read('classpath:data/marvel_characters_api/character_id_valid.json')
    * path characterData.characterId
    When method DELETE
    Then status 204

  @id:2 @eliminarPersonaje @personajeNoExiste404
  Scenario: T-API-HU_001-CA02-Eliminar personaje que no existe 404 - karate
    * def characterData = read('classpath:data/marvel_characters_api/character_id_not_found.json')
    * path characterData.characterId
    When method DELETE
    Then status 404

  @id:3 @eliminarPersonaje @errorValidacion400
  Scenario: T-API-HU_001-CA03-Eliminar personaje con ID inválido 400 - karate
    * def characterData = read('classpath:data/marvel_characters_api/character_id_invalid.json')
    * path characterData.characterId
    When method DELETE
    Then status 400

  @id:4 @eliminarPersonaje @errorServicio500
  Scenario: T-API-HU_001-CA04-Eliminar personaje con error interno 500 - karate
    * def characterData = read('classpath:data/marvel_characters_api/character_id_valid.json')
    * path characterData.characterId
    * header X-Force-Error = 'internal-server-error'
    When method DELETE
    Then status 500