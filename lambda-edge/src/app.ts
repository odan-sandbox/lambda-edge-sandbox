import express from "express";
import basicAuth from "express-basic-auth";

export const app = express();

app.use(
  basicAuth({
    users: { admin: "supersecret" },
    challenge: true
  })
);

app.get("/", (_, res) => {
  res.send("Hello!");
});

app.listen(3000, () => console.log("start: http://localhost:3000"));
