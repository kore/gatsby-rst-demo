const path = require(`path`);
const rstProcessor = require("./src/processor/rst");
const fs = require(`fs`);

exports.createPages = async ({ graphql, actions }) => {
  const { createPage } = actions;

  const result = await graphql(`
    query MyQuery {
      allRstText(sort: { created: DESC }, limit: 1024) {
        edges {
          node {
            author
            title
            created
            id
            name
            description
            html
            canonical
          }
        }
      }
    }
  `);

  let posts = [];

  // Create single blog post pages
  result.data.allRstText.edges.forEach((edge) => {
    const context = {
      type: "BlogPost",
      title: edge.node.title,
      description: edge.node.description,
      created: edge.node.created,
      language: edge.node.language || "en",
      url: `/blog/${edge.node.name}.html`,
      sourcePath: edge.node.absolutePath,
    };

    posts.push(context);
    createPage({
      path: `/blog/${edge.node.name}.html`,
      component: path.resolve("src/components/blog/post.jsx"),
      context: {
        ...edge.node,
        ...context,
      },
    });
  });

  // Create blog post listing pages
  const postsPerPage = 12;
  const pageCount = Math.ceil(posts.length / postsPerPage);
  Array.from({ length: pageCount }).forEach((_, i) => {
    createPage({
      path: `blog/${i + 1}.html`,
      component: path.resolve("src/components/blog/listing.jsx"),
      context: {
        type: "BlogListing",
        limit: postsPerPage,
        currentPage: i + 1,
        pageCount: pageCount,
        posts: posts.slice(i * postsPerPage, i * postsPerPage + postsPerPage),
      },
    });
  });
};

exports.onCreateNode = ({
  node,
  actions,
  lodeNodeContent,
  createNode,
  createNodeId,
  createContentDigest,
}) => {
  if (node.internal.mediaType !== "text/plain") {
    return;
  }

  if (node.absolutePath.match(/\/drafts\//)) {
    return;
  }

  const document = rstProcessor(node.absolutePath);
  actions.createNode({
    ...node,
    ...document,
    id: createNodeId(node.absolutePath + ".rst"),
    children: [],
    internal: {
      contentDigest: createContentDigest(document.description),
      type: "RstText",
    },
  });
};

exports.onCreatePage = ({ page, actions }) => {
  const { createPage } = actions;
  if (page.path === `/`) {
    page.matchPath = `/*`;
    createPage(page);
  }
};

exports.onPostBuild = ({ reporter }) => {
  reporter.info(`Your Gatsby site has been built!`);
};
