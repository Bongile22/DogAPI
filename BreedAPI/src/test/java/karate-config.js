function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    URL: 'https://api.thedogapi.com/v1/',
    TOKEN: 'live_3GcNT1s85TAzKOZUVgHdXsgdsZ32JVNHLOLptC2rjBCIpZARSFNOD2VImoRTMrY6',
    C_TYPE: 'application/json',
    OK: 200,
    CREATED: 201,
    NO_CONTENT: 204,
    BAD_REQUEST: 400,

}

  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  karate.configure('logPrettyRequest', true)
  return config;
}