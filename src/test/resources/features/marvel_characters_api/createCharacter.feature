@REQ_HU_001 @HU001 @crear_personaje @marvel_characters_api
Feature: HU_001 Crear personaje (microservicio para crear nuevos personajes de Marvel)

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
    * def getDate =
      """
      function() {
        var DateTimeFormatter = Java.type('java.time.format.DateTimeFormatter');
        var dtf = DateTimeFormatter.ofPattern('uuuuMMddHHmmss');
        var ldt = java.time.LocalDateTime.now();
        return ldt.format(dtf);
      }
      """
    * def temp = getDate()
    * print temp

  @id:1 @crearPersonaje @creacionExitosa201
  Scenario: T-API-HU_001-CA01-Crear personaje exitosamente 201 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_valid.json')
    * def nombre = jsonData.name + temp
    *     jsonData.name = nombre
    And request jsonData
    And print jsonData
    When method POST
    Then status 201

  @id:2 @crearPersonaje @nombreDuplicado400
  Scenario: T-API-HU_001-CA02-Crear personaje con nombre duplicado 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_duplicate.json')
    And request jsonData
    When method POST
    Then status 400

  @id:3 @crearPersonaje @camposRequeridos400
  Scenario: T-API-HU_001-CA03-Crear personaje con campos requeridos faltantes 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_missing_fields.json')
    And request jsonData
    When method POST
    Then status 400

  @id:4 @crearPersonaje @errorValidacion400
  Scenario: T-API-HU_001-CA04-Crear personaje con datos inválidos 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_invalid.json')
    And request jsonData
    When method POST
    Then status 400
