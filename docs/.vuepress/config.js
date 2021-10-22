module.exports = {
  head: [['link', { rel: 'icon', href: '/logo.png' }]],
  title: 'GraphQL @ Yelp Schema Design Guidelines',
  description: 'Schema Design Guidelines for GraphQL @ Yelp',
  themeConfig: {
    logo: '/logo.png',
    lastUpdated: 'Last Updated',
    sidebar: [
      {
        title: 'GraphQL Styleguide',
        collapsable: false,
        children: ['/schema-design', '/nullability'],
      },
    ],
    docsDir: 'docs',
  },
  plugins: [
    [
      'flexsearch',
      {
        search_options: {
          // Incrementally index words in forward direction
          tokenize: 'forward',
          doc: {
            id: 'key',
            // Choose the fields we want to index.
            // Search in the title and the content of each page.
            field: ['title', 'content'],
          },
        },
      },
    ],
  ],
};
