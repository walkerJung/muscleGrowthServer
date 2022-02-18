// books/books.mutations.js

import client from "../client"; //PrismaClient 사용하기 위해 불러오기

// export default로 Mutation 내용 내보내기
export default {
  Mutation: {
    createBook: (_, { title, year, genre }) =>
      client.book.create({
        data: {
          title,
          year,
          genre,
        },
      }),
    deleteBook: (_, { id }) => client.book.delete({ where: { id } }),
    updateBook: (_, { id, title, year, genre }) =>
      client.book.update({
        where: {
          id,
        },
        data: {
          title,
          year,
          genre,
        },
      }),
  },
};
