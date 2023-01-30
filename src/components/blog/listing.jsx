import * as React from "react";
import { StaticImage } from "gatsby-plugin-image";

const BlogListing = ({ pageContext }) => {
  return (
    <>
      <div className="container">
        <h1>
          Blog ({pageContext.currentPage} of {pageContext.pageCount})
        </h1>
        <ul className="blog">
          {pageContext.posts.map((post) => {
            return (
              <li className="blog__item blog-post" key={post.url}>
                <a href={post.url}>
                  <h3 className="blog-post__title">{post.title}</h3>
                  <p className="blog-post__abstract">{post.description}</p>
                  <div className="blog-post__created">
                    {new Date(post.created).toLocaleDateString("en-GB", {
                      weekday: "long",
                      year: "numeric",
                      month: "long",
                      day: "numeric",
                    })}
                  </div>
                  <div className="blog-post__read-more">Read more ➞</div>
                </a>
              </li>
            );
          })}
        </ul>
        <ul className="pager">
          <li className={"pager__arrow"}>
            <a href={`/blog/${Math.max(1, pageContext.currentPage - 1)}.html`}>⟵</a>
          </li>
          {Array.from({ length: pageContext.pageCount }).map((_, i) => {
            return (
              <li
                className={"pager__page" + (i === pageContext.currentPage - 1 ? " pager__page--active" : "")}
                key={`page-${i}`}
              >
                <a href={`/blog/${i + 1}.html`}>{i + 1}</a>
              </li>
            );
          })}
          <li className={"pager__arrow"}>
            <a href={`/blog/${Math.min(pageContext.pageCount, pageContext.currentPage + 1)}.html`}>⟶</a>
          </li>
        </ul>
      </div>
    </>
  );
};

export default BlogListing;
