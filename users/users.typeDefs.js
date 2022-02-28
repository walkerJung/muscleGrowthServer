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

  type UserResponse {
    user: User!
    result: Boolean!
    message: String!
  }

  type Query {
    users: [User]
    user(id: Int!): User!
  }

  type Mutation {
    createUser(
      userId: String!
      userName: String!
      userPassword: String!
      userType: String!
      userAgree: Boolean!
    ): UserResponse!
    updateUser(id: Int!, userName: String, userPassword: String): UserResponse!
    deleteUser(id: Int!): UserResponse!
  }
`;
