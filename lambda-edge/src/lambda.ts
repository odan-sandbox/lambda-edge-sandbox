import { CloudFrontRequestHandler } from "aws-lambda";

export const basicAuth: CloudFrontRequestHandler = (event, _, callback) => {
  const { request } = event.Records[0].cf;
  const credentials = [{ user: "username", pass: "naisyo" }];

  if (request.headers.authorization) {
    const authorized = credentials.some(({ user, pass }) => {
      const secret = new Buffer(`${user}:${pass}`).toString("base64");
      return request.headers.authorization[0].value.split(" ")[1] === secret;
    });

    if (authorized) {
      callback(null, request);
      return;
    }
  }

  callback(null, {
    status: "401",
    statusDescription: "401 Unauthorized",
    headers: {
      "www-authenticate": [{ key: "WWW-Authenticate", value: "Basic" }]
    }
  });
};
