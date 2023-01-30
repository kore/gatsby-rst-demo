const rstProcessor = require("./src/processor/rst");

module.exports = {
  siteMetadata: {
    siteUrl: "https://kore-nordmann.de",
    title: "My Name",
  },
  plugins: [
    {
      resolve: `gatsby-plugin-layout`,
      options: {
        component: require.resolve(`./src/components/layout.jsx`),
      },
    },
    {
      resolve: "gatsby-source-filesystem",
      options: {
        path: `${__dirname}/content/blog`,
        name: "blog",
      },
    },
    {
      resolve: "gatsby-source-filesystem",
      options: {
        path: `${__dirname}/static/talks`,
        name: "talk",
      },
    },
    "gatsby-plugin-react-helmet",
    {
      resolve: "gatsby-plugin-sass",
      options: {
        sassOptions: {
          includePaths: ["src/styles"],
        },
      },
    },
    "gatsby-plugin-image",
    "gatsby-plugin-catch-links",
    {
      resolve: "gatsby-plugin-manifest",
      options: {
        name: "My Name",
        short_name: "My Name",
        start_url: "/",
        icon: "src/images/icon.png",
        icon_options: {
          purpose: "any maskable",
        },
        background_color: "#f00",
        theme_color: "#f00",
        display: `standalone`,
      },
    },
    // "gatsby-plugin-offline",
    "gatsby-plugin-remove-serviceworker",
    "gatsby-plugin-sharp",
    "gatsby-transformer-sharp",
    {
      resolve: "gatsby-plugin-react-svg",
      options: {
        rule: {
          include: /\.inline\.svg$/,
        },
      },
    },
    {
      resolve: "gatsby-plugin-feed",
      options: {
        feeds: [
          {
            query: `
              query MyQuery {
                allRstText(sort: {created: DESC}, limit: 10) {
                  edges {
                    node {
                      author
                      title
                      created
                      id
                      name
                      description
                    }
                  }
                }
              }`,
            serialize: ({ query: { site, allRstText } }) => {
              return allRstText.edges.map((edge) => {
                return Object.assign({}, edge.node.frontmatter, {
                  title: edge.node.title,
                  description: edge.node.description,
                  date: edge.node.created,
                  url:
                    site.siteMetadata.siteUrl + `/blog/${edge.node.name}.html?utm_source=rss`,
                  guid:
                    site.siteMetadata.siteUrl + `/blog/${edge.node.name}.html`,
                });
              });
            },
            output: "/blog.rss",
            title: "My Name's Blog",
            siteUrl: "https://kore-nordmann.de/",
          },
        ],
      },
    },
  ],
};
