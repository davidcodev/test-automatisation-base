package com.pichincha;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

  @Karate.Test
  Karate testGetAllCharacters() {
    return Karate.run("classpath:features/marvel_characters_api/getAllCharacters.feature")
        .relativeTo(getClass());
  }

  @Karate.Test
  Karate testGetCharacterById() {
    return Karate.run("classpath:features/marvel_characters_api/getCharacterById.feature")
        .relativeTo(getClass());
  }

  @Karate.Test
  Karate testCreateCharacter() {
    return Karate.run("classpath:features/marvel_characters_api/createCharacter.feature")
        .relativeTo(getClass());
  }

  @Karate.Test
  Karate testUpdateCharacter() {
    return Karate.run("classpath:features/marvel_characters_api/updateCharacter.feature")
        .relativeTo(getClass());
  }

  @Karate.Test
  Karate testDeleteCharacter() {
    return Karate.run("classpath:features/marvel_characters_api/deleteCharacter.feature")
        .relativeTo(getClass());
  }
}