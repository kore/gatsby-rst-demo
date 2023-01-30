import React, { Fragment, useState } from "react";
import { StaticImage } from "gatsby-plugin-image";
import { Helmet } from "react-helmet";

import "../styles/app.scss";

const Layout = (page) => {
  return (
    <Fragment>
      <Helmet htmlAttributes={{ lang: "en" }}>
        <meta charSet="utf-8" />
        <meta
          name="description"
          content="I code, found, write, and speak. Currently I focus building Frontastic as founder & CTO. My passion lies in empathically building sustainable software."
        />
        <title>{page.pageContext?.title ? page.pageContext?.title + " | " : ""}My Name</title>
      </Helmet>
      <header>
        <nav className="head">
          <ul className="container navigation">
            <li className="navigation__item">
              <a href="/">Start</a>
            </li>
            <li className="navigation__item">
              <a href="/blog/1.html">Blog</a>
            </li>
            <li className="navigation__item">
              <a href="/talks/">Talks</a>
            </li>
          </ul>
        </nav>
      </header>
      <main>{page.children}</main>
      <footer>
        <p className="footer__copyright">
          &copy; My Name, 2006 to {new Date().getFullYear()} – <a href="/imprint/">Imprint / Impressum</a>
        </p>
      </footer>
    </Fragment>
  );
};

export default Layout;
