import client from "../client";

export default {
  Query: {
    users: () => client.user.findMany(),
    user: (_, { code }) => client.user.findUnique({ where: { code } }),
  },
};
