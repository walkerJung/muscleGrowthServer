const { ApolloServer, gql } = require("apollo-server");

const books = [
  {
    title: "The Awakccccening",
    author: "Kate Chopin",
  },
  {
    title: "City of ddddGlass",
    author: "Paul Auster",
  },
];

const typeDefs = gql`
  type Book {
    title: String
    author: String
  }
  type Query {
    books: [Book]
  }
`;
const resolvers = {
  Query: {
    books: () => books,
  },
};
const server = new ApolloServer({ typeDefs, resolvers });

server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
});
