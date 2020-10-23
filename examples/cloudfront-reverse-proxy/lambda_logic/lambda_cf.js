exports.handler = (event, context, callback) => {
  console.log("## CONTEXT: " + serialize(context));
  console.log("## EVENT: " + serialize(event));

  const request = event.Records[0].cf.request;
  const headers = request.headers;

  const requestCountry = headers["cloudfront-viewer-country"][0].value;
  const countryCodeParam = `countryCode=${requestCountry}`;

  // CHANGEME to own website to redirect to
  const redirectUrl = `https://xs1m3g0mtj.execute-api.us-east-1.amazonaws.com`;
  console.log(`lambda_cf: redirect to '${redirectUrl}'`);

  const response = {
    status: "302",
    statusDescription: "Found",
    headers: {
      "x-some-header": [{ key: "x-some-header", value: "some-header-content" }],
      location: [
        {
          key: "Location",
          value: redirectUrl,
        },
      ],
    },
  };
  callback(null, request);
};

const serialize = (object) => {
  return JSON.stringify(object, null, 2);
};
