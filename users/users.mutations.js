import client from "../client";

export default {
  Mutation: {
    createUser: (_, { userId, userName, userPassword, userType, userAgree }) =>
      client.user.create({
        data: {
          userId,
          userName,
          userPassword,
          userType,
          userAgree,
        },
      }),
    updateUser: (_, { id, userName, userPassword }) =>
      client.user.update({ where: { id }, data: { userName, userPassword } }),
    deleteUser: (_, { id }) => client.user.delete({ where: { id } }),
  },
};
