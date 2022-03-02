import { gql } from "apollo-server";

export default gql`
  type User {
    code: Int!
    userId: String!
    userName: String!
    userPassword: String!
    userType: String!
    userAgree: Boolean!
    createdAt: String!
  }

  type UserResponse {
    user: User
    result: Boolean!
    message: String!
  }

  type Query {
    users: [User]
    user(code: Int!): User!
  }

  type Mutation {
    createUser(
      userId: String!
      userName: String!
      userPassword: String!
      userType: String!
      userAgree: Boolean!
    ): UserResponse!
    updateUser(
      code: Int!
      userName: String
      userPassword: String
    ): UserResponse!
    deleteUser(code: Int!): UserResponse!
  }
`;
