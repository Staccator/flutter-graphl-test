const { ApolloServer, gql } = require('apollo-server');

// A schema is a collection of type definitions (hence "typeDefs")
// that together define the "shape" of queries that are executed against
// your data.
const typeDefs = gql`
  # Comments in GraphQL strings (such as this one) start with the hash (#) symbol.

  type Author {
    id: String!
    name: String!
    language: String!
  }

  # This "Book" type defines the queryable fields for every book in our data source.
  type Book {
    id: String!
    title: String!
    author: Author!
  }

  # The "Query" type is special: it lists all of the available queries that
  # clients can execute, along with the return type for each. In this
  # case, the "books" query returns an array of zero or more Books (defined above).
  type Query {
    books: [Book!]!
    book(id: String!): Book
  }

  type Mutation {
    updateBookTitle(id: String!, title: String!): Book
    updateAuthorName(id: String!, name: String!): Author
  }
`;

const books = [
  {
    id: '1',
    title: 'The Awakening',
    author: {
      id: 'a1',
      name: 'Andrew',
      language: 'pl'
    },
  },
  {
    id: '2',
    title: 'City of Glass',
    author: {
      id: 'a1',
      name: 'Terry',
      language: 'eng',
    },   
  },
];

const resolvers = {
  Query: {
    books: () => books,
    book: (parent, args, context, info) => {
      return books.filter((book) => book.id == args.id)[0];
    }
  },
  Mutation: {
    updateBookTitle: (parent, args, context, info) => {
      let book = books.filter((book) => book.id == args.id)[0];
      book.title = args.title;

      return book;
    },
    updateAuthorName: (parent, args, context, info) => {
      let book = books.filter((book) => book.author.id == args.id)[0];
      let author = book.author;
      author.name = args.name;

      return author;
    },
  }
};

const server = new ApolloServer({ typeDefs, resolvers });

server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
});
  
 
