import * as React from "react";
import { graphql } from "gatsby";

const formatBytes = (bytes, decimals = 2) => {
  if (bytes === 0) {
    return "0 Bytes";
  }

  const k = 1024;
  const dm = decimals < 0 ? 0 : decimals;
  const sizes = ["Bytes", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];

  const i = Math.floor(Math.log(bytes) / Math.log(k));

  return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + " " + sizes[i];
};

const Talks = ({ data }) => {
  const talks = {};

  data.allFile.edges
    .filter(({ node }) => {
      return node.relativePath.match(/^[0-9]{2}_[0-9]{2}_/);
    })
    .map(({ node }) => {
      let [year] = node.relativePath.split("_", 2);
      node.name = node.relativePath
        .substr(6)
        .split("_")
        .map((word) => {
          return word.substr(0, 1).toUpperCase() + word.substr(1);
        })
        .join(" ");

      year = "20" + year;
      if (!talks[year]) {
        talks[year] = [];
      }

      node.preview = "/talks/" + node.relativePath + ".png";

      talks[year].push(node);
      return node;
    });

  let years = Object.keys(talks);
  years.reverse();

  return (
    <div className="container">
      <h1>Presentations</h1>
      <p>
        Over the years I gave many presentations at various conferences and events. A selection can be found here, while
        I held many of these presentations multiple times at different conferences and some might be horribly outdated.
      </p>
      {years.map((year) => {
        return (
          <React.Fragment key={year}>
            <h2>Year {year}</h2>
            <ul className="talk__list">
              {talks[year].map((talk) => {
                return (
                  <li className="talk" key={talk.relativePath} id={talk.id}>
                    <a className="talk__link" href={"/talks/" + talk.relativePath}>
                      <img src={talk.preview} alt={talk.name} />
                      <span className="talk__meta">PDF ({formatBytes(talk.size)})</span>
                    </a>
                  </li>
                );
              })}
            </ul>
          </React.Fragment>
        );
      })}
    </div>
  );
};

export default Talks;

export const query = graphql`
  query MyQuery {
    allFile(filter: { extension: { eq: "pdf" } }) {
      edges {
        node {
          id
          name
          relativePath
          size
        }
      }
    }
  }
`;
