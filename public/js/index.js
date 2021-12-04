function parseContentPreview(content) {
  if (content.length > 400) {
    return `${content.substring(0, 400)} [...]`;
  } else {
    return content;
  }
}

module.exports = {
  parseContentPreview,
};
