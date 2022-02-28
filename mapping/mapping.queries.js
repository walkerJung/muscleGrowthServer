import client from "../client";

export default {
  Query: {
    mappings: () => client.mapping.findMany(),
    mapping: (_, { id }) => client.mapping.findUnique({ where: { id } }),
  },
};
