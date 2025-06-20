@REQ_HU_001 @HU001 @crear_personaje @marvel_characters_api
Feature: HU_001 Crear personaje (microservicio para crear nuevos personajes de Marvel)

  Background:
    * url port_marvel_characters_api
    * path '/api/characters'
    * def generarHeaders =
      """
      function() {
        return {
          "X-Guid": "88212f38-cc02-4083-a763-8cc09a933840",
          "X-Flow": "creation",
          "Content-Type": "application/json",
          "Accept": "application/json"
        };
      }
      """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @crearPersonaje @creacionExitosa201
  Scenario: T-API-HU_001-CA01-Crear personaje exitosamente 201 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_valid.json')
    And request jsonData
    When method POST
    Then status 201
  # And match response.id != null
  # And match response.name == jsonData.name

  @id:2 @crearPersonaje @nombreDuplicado400
  Scenario: T-API-HU_001-CA02-Crear personaje con nombre duplicado 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_duplicate.json')
    And request jsonData
    When method POST
    Then status 400
  # And match response.error == 'Character name already exists'
  # And match response != null

  @id:3 @crearPersonaje @camposRequeridos400
  Scenario: T-API-HU_001-CA03-Crear personaje con campos requeridos faltantes 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_missing_fields.json')
    And request jsonData
    When method POST
    Then status 400
  # And match response.name == 'Name is required'
  # And match response.alterego == 'Alterego is required'

  @id:4 @crearPersonaje @errorValidacion400
  Scenario: T-API-HU_001-CA04-Crear personaje con datos inválidos 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_invalid.json')
    And request jsonData
    When method POST
    Then status 400
  # And match response.error != null
  # And match response.status == 400

  @id:5 @crearPersonaje @errorServicio500
  Scenario: T-API-HU_001-CA05-Crear personaje con error interno 500 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_valid.json')
    * header X-Force-Error = 'internal-server-error'
    And request jsonData
    When method POST
    Then status 500
  # And match response.error != null
  # And match response.status == 500