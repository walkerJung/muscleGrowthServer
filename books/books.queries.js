import client from "../client"; //PrismaClient 사용하기 위해 불러오기

// export default로 Query 내용 내보내기
export default {
  Query: {
    books: () => client.book.findMany(),
    book: (_, { id }) => client.book.findUnique({ where: { id } }),
  },
};
