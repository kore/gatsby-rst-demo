const fs = require(`fs`);
const xmlParser = require(`xml2json`);
const ChildProcess = require(`child_process`);

function existsAndIsCurrent(path, cachPath) {
  return fs.existsSync(cachPath) && fs.statSync(path).ctime < fs.statSync(cachPath).ctime;
}

function extractMetaData(document) {
  let metaData = {};

  if (!document.docinfo) {
    return metaData;
  }

  if (document.docinfo.field) {
    if (!Array.isArray(document.docinfo.field)) {
      document.docinfo.field = [document.docinfo.field];
    }

    document.docinfo.field.forEach((value) => {
      if (value.field_body.paragraph && value.field_body.paragraph.reference) {
        metaData[value.classes] = value.field_body.paragraph.reference.refuri;
      } else {
        metaData[value.classes] = value.field_body.paragraph;
      }
    });

    delete document.docinfo.field;
  }

  metaData = {
    author: document.docinfo.author || null,
    ...document.docinfo.field,
    ...metaData,
  };

  return metaData;
}

module.exports = (rstFile) => {
  const xmlFile = rstFile + ".xml";
  if (!existsAndIsCurrent(rstFile, xmlFile)) {
    ChildProcess.execSync(`rst2xml ${rstFile} ${xmlFile}`);
  }

  const document = xmlParser.toJson(fs.readFileSync(xmlFile, "utf8"), {
    object: true,
  }).document;
  const metaData = extractMetaData(document);

  const htmlFile = rstFile + ".html";
  if (!existsAndIsCurrent(rstFile, htmlFile)) {
    ChildProcess.execSync(`xsltproc ${__dirname}/xslt/html.xsl ${xmlFile} > ${htmlFile}`);
  }

  return {
    title: document.title[0],
    html: fs
      .readFileSync(htmlFile, "utf8")
      .toString()
      .replace(/<a([^>]+)\/>/g, (match, inner) => `<a${inner}></a>`),
    ...metaData,
  };
};
