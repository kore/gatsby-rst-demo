import * as React from "react";

const NotFoundPage = () => {
  return (
    <>
      <h1>Page not found</h1>
      <p>
        Sorry,{" "}
        <span role="img" aria-label="Pensive emoji">
          😔
        </span>{" "}
        we couldn’t find what you were looking for.
      </p>
    </>
  );
};

export default NotFoundPage;
