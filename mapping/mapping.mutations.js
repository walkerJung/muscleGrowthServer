import client from "../client";

export default {
  Mutation: {
    createMapping: async (
      _,
      {
        userId,
        timeStamp,
        mappingType,
        mappingName,
        mappingTel,
        mappingBusinessHour,
        mappingLatitude,
        mappingLongitude,
      }
    ) => {
      const existMapping = await client.mapping.findUnique({
        where: {
          mappingLatitude,
          mappingLongitude,
        },
      });

      if (existMapping) {
        return {
          mapping: existMapping,
          result: false,
          message: "이미 입력되어있는 맵핑 정보가 존재합니다.",
        };
      }

      const newMapping = await client.mapping.create({
        data: {
          userId,
          timeStamp,
          mappingType,
          mappingName,
          mappingTel,
          mappingBusinessHour,
          mappingLatitude,
          mappingLongitude,
        },
      });

      return {
        mapping: newMapping,
        result: true,
        message: "맵핑정보 등록이 완료되었습니다. 감사합니다.",
      };
    },
  },
};
