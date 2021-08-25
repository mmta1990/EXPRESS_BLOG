const redis = require("redis");
const connectRedis = require("connect-redis");

module.exports = (session) => {
  let RedisStore = require("connect-redis")(session);
  let redisClient = redis.createClient();
  return new RedisStore({ client: redisClient });
};

// Final Edition
