import client from "../client";

export default {
  Query: {
    mappings: () => client.mapping.findMany(),
    mapping: (_, { code }) => client.mapping.findUnique({ where: { code } }),
  },
};
