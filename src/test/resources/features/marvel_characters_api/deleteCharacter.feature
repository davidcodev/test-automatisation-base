@REQ_HU_001 @HU001 @eliminar_personaje @marvel_characters_api @Agente2 @E2 @iniciativa_marvel_api
Feature: HU_001 Eliminar personaje (microservicio para eliminar personajes de Marvel)

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
