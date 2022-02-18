// server.js

import { ApolloServer } from "apollo-server";

// 합쳐진 최종 schema불러오기
import schema from "./schema";

// schema로 ApolloServer 만들기
const server = new ApolloServer({ schema });

server
  .listen()
  .then(({ url }) => console.log(`🚀 Server is running on ${url}`));
