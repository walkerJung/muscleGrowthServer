import { gql } from "apollo-server";

export default gql`
  type User {
    id: Int!
    userId: String!
    userName: String!
    userPassword: String!
    userType: String!
    userAgree: Boolean!
    createdAt: String!
  }

  type Query {
    users: [User]
    user(id: Int!): User
  }

  type Mutation {
    createUser(
      userId: String!
      userName: String!
      userPassword: String!
      userType: String!
      userAgree: Boolean!
    ): User
    updateUser(id: Int!, userName: String, userPassword: String): User
    deleteUser(id: Int!): User
  }
`;
