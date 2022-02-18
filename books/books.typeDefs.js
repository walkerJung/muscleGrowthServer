// books/books.typeDefs.js

// 데이터 형식(typeDefs) 지정하기 위한 gql 불러오기
import { gql } from "apollo-server";

// export default 활용해 gql typeDefs 내보내기
export default gql`
  type Book {
    id: Int!
    title: String!
    year: Int!
    genre: String
    createdAt: String!
    updatedAt: String!
  }

  type Query {
    books: [Book]
    book(id: Int!): Book
  }

  type Mutation {
    createBook(title: String!, year: Int!, genre: String): Book
    deleteBook(id: Int!): Book
    updateBook(id: Int!, title: String, year: Int, genre: String): Book
  }
`;
