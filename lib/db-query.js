const config = require("./config");
const { Client } = require("pg");

const logQuery = (statement, parameters) => {
  let timeStamp = new Date();
  let formattedtimeStamp = timeStamp.toString().substring(4, 24);
  console.log(formattedtimeStamp, statement, parameters);
};

const isProduction = (config.NODE_ENV === "production");

const CONNECTION = {
  connectionString: config.DATABASE_URL,
  ssl: isProduction,
}

module.exports = {
  async dbQuery(statement, ...parameters) {
    let client = new Client( CONNECTION );

    await client.connect();
    logQuery(statement, parameters);
    let result = await client.query(statement, parameters);
    await client.end();

    console.log(result);
    return result;
  },
};