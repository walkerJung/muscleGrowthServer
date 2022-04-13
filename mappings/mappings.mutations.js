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
        restaurantMenu,
        restaurantNutrition,
        restaurantTip,
        gymFacility,
        gymMood,
        gymGood,
        gymBad,
      }
    ) => {
      const existMapping = await client.mapping.findMany({
        where: {
          AND: {
            mappingLatitude,
            mappingLongitude,
          },
        },
      });

      if (existMapping.length > 0) {
        return {
          mapping: existMapping,
          result: false,
          message: "이미 입력되어있는 맵핑 정보가 존재합니다.",
        };
      }

      if (mappingType == "restaurant") {
        try {
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
              MappingRestaurant: {
                create: {
                  restaurantMenu,
                  restaurantNutrition,
                  restaurantTip,
                },
              },
            },
          });

          return {
            mapping: newMapping,
            result: true,
            message: "맵핑정보 등록이 완료되었습니다. 감사합니다.",
          };
        } catch (err) {
          return {
            mapping: [],
            result: false,
            message: err,
          };
        }
      } else if (mappingType == "gym") {
        try {
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
              MappingGym: {
                create: {
                  gymFacility,
                  gymMood,
                  gymGood,
                  gymBad,
                },
              },
            },
          });

          return {
            mapping: newMapping,
            result: true,
            message: "맵핑정보 등록이 완료되었습니다. 감사합니다.",
          };
        } catch (err) {
          return {
            mapping: [],
            result: false,
            message: err,
          };
        }
      }
    },
    updateMapping: async (
      _,
      { code, mappingName, mappingTel, mappingBusinessHour }
    ) => {
      const updateMapping = await client.mapping.update({
        where: { code },
        data: { mappingName, mappingTel, mappingBusinessHour },
      });

      return {
        user: updateMapping,
        result: true,
        message: "맵핑정보 변경이 완료되었습니다.",
      };
    },
    deleteMapping: async (_, { code }) => {
      await client.mapping.delete({ where: { code } });

      return {
        result: true,
        message: "맵핑정보 삭제가 완료되었습니다.",
      };
    },
  },
};
