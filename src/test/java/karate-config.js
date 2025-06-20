function fn() {
  karate.configure('ssl', true);
  var env = karate.env || 'local';

  // Configuración base para todos los entornos
  var config = {
    baseUrl: 'http://bp-se-test-cabcd9b246a5.herokuapp.com/daadavil'
  };

  // URLs para todos los microservicios (nombrados con formato port_nombre_microservicio)
  config.port_marvel_characters_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/daadavil';

  // Configuración específica por entorno
  if (env == 'dev') {
    config.baseUrl = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/daadavil';
    config.port_marvel_characters_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/daadavil';
  }
  else if (env == 'qa') {
    config.baseUrl = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/daadavil';
    config.port_marvel_characters_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/daadavil';
  }
  else if (env == 'prod') {
    config.baseUrl = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/daadavil';
    config.port_marvel_characters_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/daadavil';
  }

  return config;
}