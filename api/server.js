const express = require("express");
const helmet = require("helmet");

const UserRouter = require("../users/user-router.js");
const db = require("../data/db-config.js");

const server = express();

server.use(helmet());
server.use(express.json());

server.use("/api/users", UserRouter);

server.get("/api/posts", (req, res) => {
  /*
        select p.contents as Quote, u.username as PostedBy 
        from posts as p
        join users as u on p.user_id = u.id;
    */
  db("posts as p")
    .join("users as u", "p.user_id", "u.id")
    .select("p.contents as Quote", "u.username as PostedBy")
    .then((posts) => {
      res.status(200).json({ data: posts });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
});

module.exports = server;
