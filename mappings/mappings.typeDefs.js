import { gql } from "apollo-server";

export default gql`
  type Mapping {
    code: Int!
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
    mapping: Mapping
    result: Boolean!
    message: String!
  }

  type Query {
    mappings: [Mapping]
    mapping(code: Int!): Mapping!
  }

  type Mutation {
    createMapping(
      userCode: Int!
      timeStamp: String!
      mappingType: String!
      mappingName: String!
      mappingTel: String!
      mappingBusinessHour: String!
      mappingLatitude: String!
      mappingLongitude: String!
      restaurantMenu: String
      restaurantNutrition: String
      restaurantTip: String
      gymFacility: String
      gymMood: String
      gymGood: String
      gymBad: String
    ): MappingResponse!
    updateMapping(
      code: Int!
      mappingName: String!
      mappingTel: String!
      mappingBusinessHour: String!
    ): MappingResponse!
    deleteMapping(code: Int!): MappingResponse!
  }
`;
