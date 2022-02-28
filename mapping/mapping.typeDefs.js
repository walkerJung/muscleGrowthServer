import { gql } from "apollo-server";

export default gql`
  type Mapping {
    id: Int!
    userId: Int!
    timeStamp: String!
    mappingType: String!
    mappingName: String!
    mappingTel: String!
    mappingBusinessHour: String!
    mappingMuscleUp: Int!
    mappingMuscleDown: Int!
    createdAt: String!
  }

  type MappingResponse {
    mapping: Mapping!
    result: Boolean!
    message: String!
  }

  type Query {
    mappings: [Mapping]
    mapping(id: Int!): Mapping!
  }

  type Mutation {
    createMapping(
      userId: Int!
      timeStamp: String!
      mappingType: String!
      mappingName: String!
      mappingTel: String!
      mappingBusinessHour: String!
      mappingMuscleUp: Int!
      mappingMuscleDown: Int!
    ): MappingResponse!
    updateMapping(
      id: Int!
      mappingName: String!
      mappingTel: String!
      mappingBusinessHour: String!
    ): MappingResponse!
    deleteMapping(id: Int!): MappingResponse!
  }
`;
