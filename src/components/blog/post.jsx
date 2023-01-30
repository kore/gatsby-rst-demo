import * as React from "react";
import { Helmet } from "react-helmet";

const BlogPost = ({ pageContext }) => {
  const age = new Date().getYear() - new Date(pageContext.created).getYear();
  const authors = pageContext.author ? pageContext.author.split(", ") : [];

  return (
    <>
      <div className="container blog-post">
        <h1>{pageContext.title}</h1>
        <h4 className="blog-post__created">
          First published at{" "}
          <strong>
            {new Date(pageContext.created).toLocaleDateString("en-GB", {
              weekday: "long",
              year: "numeric",
              month: "long",
              day: "numeric",
            })}
          </strong>
        </h4>

        {authors.length > 1 && (
          <ul className="blog-post__authors">
            {authors.map((author) => {
              switch (author) {
                case "Tobias Schlitt":
                  return (
                    <li key={author}>
                      <a href="https://schlitt.info/">Toby</a>
                    </li>
                  );
                case "Benjamin Eberlei":
                  return (
                    <li key={author}>
                      <a href="https://beberlei.de/">Benjamin Eberlei</a>
                    </li>
                  );
                default:
                  return <li key={author}>{author}</li>;
              }
            })}
          </ul>
        )}

        {pageContext.canonical && (
          <p className="alert">
            <a href={pageContext.canonical}>
              This blog post has first been published in the Qafoo blog and is duplicated here since I wrote it or
              participated in writing it.
            </a>
          </p>
        )}

        {pageContext.canonical && <Helmet link={[{ rel: "canonical", href: pageContext.canonical }]} />}
        {pageContext.description && <Helmet meta={[{ name: "description", href: pageContext.description }]} />}
        {pageContext.keywords && <Helmet meta={[{ name: "keywords", href: pageContext.keywords }]} />}

        <Helmet meta={[{ property: "og:title", content: pageContext.title }]} />
        {pageContext.description && <Helmet meta={[{ property: "og:description", content: pageContext.description }]} />}
        <Helmet meta={[{ property: "og:type", content: "article" }]} />
        <Helmet meta={[{ name: "twitter.card", content: "summary_large_image" }]} />

        {age > 5 && (
          <p className="alert alert--warning">
            <strong>Warning:</strong> This blog post is more then {age} years old – read and use with care.
          </p>
        )}

        <div className="blog-post__content" dangerouslySetInnerHTML={{ __html: pageContext.html }} />
      </div>
    </>
  );
};

export default BlogPost;
