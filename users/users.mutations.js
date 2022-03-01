import client from "../client";

export default {
  Mutation: {
    createUser: async (
      _,
      { userId, userName, userPassword, userType, userAgree }
    ) => {
      const bcrypt = require("bcrypt");
      const prettyPassword = bcrypt.hashSync(userPassword, 10);

      const existUserId = await client.user.findUnique({
        where: {
          userId,
        },
      });

      if (existUserId) {
        return {
          result: false,
          message: "이미 존재하는 회원ID 입니다.",
        };
      }

      const newUser = await client.user.create({
        data: {
          userId,
          userName,
          userPassword: prettyPassword,
          userType,
          userAgree,
        },
      });

      return {
        user: newUser,
        result: true,
        message: "회원가입이 완료되었습니다. 감사합니다.",
      };
    },
    updateUser: async (_, { code, userName, userPassword }) => {
      const updateUser = await client.user.update({
        where: { code },
        data: { userName, userPassword },
      });

      return {
        user: updateUser,
        result: true,
        message: "회원정보 변경이 완료되었습니다.",
      };
    },
    deleteUser: async (_, { code }) => {
      const deleteUser = await client.user.delete({ where: { code } });

      return {
        user: deleteUser,
        result: true,
        message: "회원정보 삭제가 완료되었습니다. 이용해주셔서 감사합니다.",
      };
    },
  },
};
