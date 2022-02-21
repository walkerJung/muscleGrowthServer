// 데이터 형식(typeDefs) 지정하기 위한 gql 불러오기
import { gql } from "apollo-server";

// export default 활용해 gql typeDefs 내보내기
export default gql`
  type User {
    id: Int!
    userId: String!
    userName: Int!
    userPassword: String!
    userType: String!
    userAgree: Boolean!
    createdAt: String!
  }
`;
