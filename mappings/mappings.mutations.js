import client from "../client";

export default {
  Mutation: {
    createMapping: async (
      _,
      {
        userCode,
        timeStamp,
        mappingType,
        mappingName,
        mappingTel,
        mappingBusinessHour,
        mappingLatitude,
        mappingLongitude,
      }
    ) => {
      // const existMapping = await client.mapping.findMany({
      //   where: {
      //     AND: {
      //       mappingLatitude,
      //       mappingLongitude,
      //     },
      //   },
      // });

      // if (existMapping.length > 0) {
      //   return {
      //     mapping: existMapping,
      //     result: false,
      //     message: "이미 입력되어있는 맵핑 정보가 존재합니다.",
      //   };
      // }
      console.log({
        userCode,
        timeStamp,
        mappingType,
        mappingName,
        mappingTel,
        mappingBusinessHour,
        mappingLatitude,
        mappingLongitude,
      });

      const newMapping = await client.mapping.create({
        data: {
          userCode,
          timeStamp,
          mappingType,
          mappingName,
          mappingTel,
          mappingBusinessHour,
          mappingMuscleUp: 0,
          mappingMuscleDown: 0,
          mappingLatitude,
          mappingLongitude,
        },
      });

      return {
        mapping: newMapping,
        result: true,
        message: "맵핑정보 등록이 완료되었습니다. 감사합니다.",
      };

      // if (mappingType == "restaurant") {
      //   const newMapping = await client.mapping.create({
      //     data: {
      //       userCode,
      //       timeStamp,
      //       mappingType,
      //       mappingName,
      //       mappingTel,
      //       mappingBusinessHour,
      //       mappingMuscleUp: 0,
      //       mappingMuscleDown: 0,
      //       mappingLatitude,
      //       mappingLongitude,
      //     },
      //   });

      //   return {
      //     mapping: newMapping,
      //     result: true,
      //     message: "맵핑정보 등록이 완료되었습니다. 감사합니다.",
      //   };
      // } else if (mappingType == "gym") {
      //   const newMapping = await client.mapping.create({
      //     data: {
      //       timeStamp,
      //       mappingType,
      //       mappingName,
      //       mappingTel,
      //       mappingBusinessHour,
      //       mappingMuscleUp: 0,
      //       mappingMuscleDown: 0,
      //       mappingLatitude,
      //       mappingLongitude,
      //     },
      //   });

      //   return {
      //     mapping: newMapping,
      //     result: true,
      //     message: "맵핑정보 등록이 완료되었습니다. 감사합니다.",
      //   };
      // }
    },
  },
};
